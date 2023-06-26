package com.ketchby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.spi.CalendarDataProvider;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.AccClubVO;
import com.ketchby.vo.AccLikeVO;
import com.ketchby.vo.AccReviewVO;
import com.ketchby.vo.AccountVO;
import com.ketchby.vo.CourseDetailVO;


public class MypageDAO {
	private static MypageDAO dao;

	public static MypageDAO getInstance() {
		if (dao == null) {
			dao = new MypageDAO();
		}
		return dao;
	}
	
	public ArrayList<AccClubVO> findClub(int a_no){
		ArrayList<AccClubVO> list = new ArrayList<AccClubVO>();
		String sql = "select cb.cb_no , cb.cb_title, cb.cb_img, bca_name, sca_name,cb.sloc_no "
				+ "from club cb, scategory sca, bcategory bca, club_application cbap "
				+ "where cb.sca_no = sca.sca_no and "
				+ "cbap.cb_no = cb.cb_no and sca.bca_no = bca.bca_no and cbap.a_no= ? "
				+ "order by cb.cb_no";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int cb_no = rs.getInt(1);
				String title = rs.getString(2);
				String img = rs.getString(3);
				String bname = rs.getString(4);
				String sname = rs.getString(5);
				int sloc_no = rs.getInt(6);
				AccClubVO ac = new AccClubVO(cb_no, title, img, bname, sname,sloc_no);
				list.add(ac);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생 :"+e.getMessage());
		}
		return list;
	}
	public AccountVO findImage(int a_no) {
		AccountVO a = new AccountVO();
		String sql = "select a_img,a_nick from account where a_no = ?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				a.setA_img(rs.getString(1));
				a.setA_nick(rs.getString(2));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생 :"+e.getMessage());
		}
		return a;
	}
	
	
	public ArrayList<AccLikeVO> findLike(int a_no){
		ArrayList<AccLikeVO> list = new ArrayList<AccLikeVO>();
		String sql ="select cl.cl_title, cl.cl_img,b.bca_name, sca_name ,cl.cl_no "
				+ "from likes l , class cl, bcategory b, scategory s "
				+ "where l.cl_no = cl.cl_no and l.a_no = ? and "
				+ "cl.sca_no = s.sca_no and b.bca_no = s.bca_no";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString(1);
				String img = rs.getString(2);
				String bca = rs.getString(3);
				String sca = rs.getString(4);
				int cl_no = rs.getInt(5);
				AccLikeVO al = new AccLikeVO(title, img, bca, sca,cl_no);
				list.add(al);
			}
		} catch (Exception e) {
			System.out.println("예외발생 :" +e.getMessage());
		}
		
		return list;
	}
	
	public ArrayList<AccReviewVO> findReview(int a_no){
		ArrayList<AccReviewVO> list = new ArrayList<AccReviewVO>();
		String sql = "select r.cl_no, r_content, r.r_star, r.r_date, cl.cl_title "
				+ " from review r , class cl "
				+ " where r.a_no = ? and cl.cl_no = r.cl_no";
		System.out.println(sql);
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int cl_no = rs.getInt(1);
				String r_content = rs.getString(2);
				int r_star = rs.getInt(3);
				Date r_date = rs.getDate(4);
				String cl_title = rs.getString(5);
				AccReviewVO ar = new AccReviewVO(cl_no, r_content, a_no, r_star, r_date, cl_title);
				list.add(ar);
			}
			ConnectionProvider.close(conn, pstmt, rs);
			}catch (Exception e) {
				System.out.println("예외발생 :" +e.getMessage());
			}
		
		return list;
	}
	
	public ArrayList<CourseDetailVO> findCourse(int a_no) {
		ArrayList<CourseDetailVO> list = new ArrayList<CourseDetailVO>();
		String sql = "select cl.cl_no, rs_date, cl_title, cl_img, cl_price "
				+ "from reservation rs , class cl "
				+ "where rs.cl_no = cl.cl_no and rs.a_no = ?";
		System.out.println(sql);
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int cl_no = rs.getInt(1);
				Date rs_date = rs.getDate(2);
				String cl_title = rs.getString(3);
				String cl_img = rs.getString(4);
				int cl_price = rs.getInt(5);
				CourseDetailVO cd = new CourseDetailVO(cl_no, rs_date, cl_title, cl_img, cl_price);
				list.add(cd);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생 :" +e.getMessage());
		}
		
		
		return list;
	}
	
}
