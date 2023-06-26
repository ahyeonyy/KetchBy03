package com.ketchby.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.ClubDeatailVO;
import com.ketchby.vo.ClubVO;

public class ClubDetailDAO {

	public static ClubDetailDAO dao;

	private ClubDetailDAO() {
	}

	public static ClubDetailDAO getInstance() {
		if (dao == null) {
			dao = new ClubDetailDAO();
		}
		return dao;
	}
	
	public ClubDeatailVO findClubInfo(int cb_no){
		ClubDeatailVO c=new ClubDeatailVO();
		String sql="select a.a_img, cb.cb_title, cb.cb_content, cb.cb_people, to_char(cb.cb_cls_date,'yyyy/mm/dd'),bloc_name,sloc_name, a.a_nick, bca.bca_name, sca.sca_name , cb.cb_img, sloc.sloc_no,(select count(ca.cb_no) "
				+ "from club_application ca where ca.cb_no=cb.cb_no)cnt from account a, club cb, bcategory bca , scategory sca, slocation sloc, blocation bloc "
				+ "where a.a_no = cb.a_no and bca.bca_no = sca.bca_no and sloc.sloc_no = cb.sloc_no and sloc.bloc_no = bloc.bloc_no and cb.sca_no = sca.sca_no and cb.cb_no = ?";
		
		try {
			Connection conn=ConnectionProvider.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cb_no);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				c.setA_img(rs.getString(1));
				c.setCb_title(rs.getString(2));
				c.setCb_content(rs.getString(3));
				c.setCb_people(rs.getInt(4));
				c.setCb_cls_date(rs.getString(5));
				c.setBloc_name(rs.getString(6));
				c.setSloc_name(rs.getString(7));
				c.setA_nick(rs.getString(8));
				c.setBca_name(rs.getString(9));
				c.setSca_name(rs.getString(10));
				c.setCb_img(rs.getString(11));
				c.setSloc_no(rs.getInt(12));
				c.setCnt(rs.getInt(13));
			}
			ConnectionProvider.close(conn, pstmt, rs);
			
		} catch (Exception e) {
			System.out.println("findClubInfo 예외:"+e.getMessage());
		}
		return c;
	}
	
	
	public ArrayList<ClubDeatailVO> findRecommandClub(int sloc_no, int cb_no){
		ArrayList<ClubDeatailVO> list=new ArrayList<ClubDeatailVO> ();
		String sql="SELECT c.cb_no, c.cb_title, c.cb_img, bca.bca_name, sca.sca_name, c.cb_people, to_char(c.cb_cls_date,'mm/dd'), sloc.sloc_no, (select count(ca.cb_no) "
				+ "from club_application ca where ca.cb_no=c.cb_no)cnt FROM club c, scategory sca, bcategory bca, slocation sloc, blocation bloc "
				+ "WHERE bca.bca_no = sca.bca_no and sloc.sloc_no = c.sloc_no and sloc.bloc_no = bloc.bloc_no and c.sca_no = sca.sca_no and c.sloc_no=? AND c.cb_no <> ? AND ROWNUM <= 3";
		try {
			Connection conn=ConnectionProvider.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,sloc_no );
			pstmt.setInt(2,cb_no );
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ClubDeatailVO c=new ClubDeatailVO();
				c.setCb_no(rs.getInt(1));
				c.setCb_title(rs.getString(2));
				c.setCb_img(rs.getString(3));
				c.setBca_name(rs.getString(4));
				c.setSca_name(rs.getString(5));
				c.setCb_people(rs.getInt(6));
				c.setCb_cls_date(rs.getString(7));
				c.setSloc_no(rs.getInt(8));
				c.setCnt(rs.getInt(9));
				list.add(c);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
		}
		return list;
	}
	
	public ArrayList<ClubDeatailVO> findMainList(String keyword, String sortColum){
		ArrayList<ClubDeatailVO> list=new ArrayList<ClubDeatailVO>();
		String sql="SELECT cb.cb_no, cb_img, cb_title, a_nick, bca_name, sca_name, TO_CHAR(cb_cls_date, 'mm/dd'), cb_people, sloc.sloc_no, (SELECT COUNT(ca.cb_no) FROM club_application ca WHERE ca.cb_no = cb.cb_no) cnt "
				+ "FROM club cb, bcategory bca, scategory sca, account a, slocation sloc, blocation bloc "
				+ "WHERE cb.a_no = a.a_no "
				+ "AND cb.sca_no = sca.sca_no "
				+ "AND bca.bca_no = sca.bca_no "
				+ "AND sloc.sloc_no = cb.sloc_no "
				+ "AND sloc.bloc_no = bloc.bloc_no ";
		if(keyword != null && !keyword.isEmpty()) {
				sql+= "and cb_title like '%"+keyword+"%'";
		}
		
		if(sortColum.equals("new")) {
			sql+= " ORDER BY cb.cb_op_date DESC";
		}else if(sortColum.equals("detail")) {
			sql+= " ORDER BY (cb_people-cnt) ASC";
		}
		
		try {
			Connection conn=ConnectionProvider.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ClubDeatailVO c=new ClubDeatailVO();
				c.setCb_no(rs.getInt(1));
				c.setCb_img(rs.getString(2));
				c.setCb_title(rs.getString(3));
				c.setA_nick(rs.getString(4));
				c.setBca_name(rs.getString(5));
				c.setSca_name(rs.getString(6));
				c.setCb_cls_date(rs.getString(7));
				c.setCb_people(rs.getInt(8));
				c.setSloc_no(rs.getInt(9));
				c.setCnt(rs.getInt(10));
				list.add(c);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("findMainList 예외:"+e.getMessage());
		}
		
		return list;
	}
	
	public ArrayList<ClubDeatailVO> searchMainList(String keyword){
		ArrayList<ClubDeatailVO> list=new ArrayList<ClubDeatailVO>();
		String sql="SELECT cb.cb_no, cb_img, cb_title, a_nick, bca_name, sca_name, TO_CHAR(cb_cls_date, 'mm/dd'), cb_people, sloc.sloc_no, (SELECT COUNT(ca.cb_no) FROM club_application ca WHERE ca.cb_no = cb.cb_no) cnt "
				+ "FROM club cb, bcategory bca, scategory sca, account a, slocation sloc, blocation bloc "
				+ "WHERE cb.a_no = a.a_no "
				+ "AND cb.sca_no = sca.sca_no "
				+ "AND bca.bca_no = sca.bca_no "
				+ "AND sloc.sloc_no = cb.sloc_no "
				+ "AND sloc.bloc_no = bloc.bloc_no ";
		if(keyword != null && !keyword.isEmpty()) {
				sql+= "and cb_title like '%"+keyword+"%'";
		}
		
		sql+= "ORDER BY cb.cb_op_date DESC";
				
		return list;
	}
	
}
