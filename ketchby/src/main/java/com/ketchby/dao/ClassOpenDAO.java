package com.ketchby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.ClassTimeVO;
import com.ketchby.vo.ClassVO;

public class ClassOpenDAO {
	public static ClassOpenDAO dao;
	
	private ClassOpenDAO() {
	}
	
	public static ClassOpenDAO getInstance() {
		if(dao==null) {
			dao = new ClassOpenDAO();
		}
		return dao;
	}
	
	public int insertClassInfo(ClassVO c) {
		int re = -1;
		String sql = "insert into class values "
				+ "(seq_class.nextval,?,?,?,?,?,?,?,?,?,sysdate,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getSca_no());
			pstmt.setInt(2, c.getA_no());
			pstmt.setString(3, c.getCl_title());
			pstmt.setString(4, c.getCl_img());
			pstmt.setString(5, c.getCl_content());
			pstmt.setNString(6, c.getCl_level());
			pstmt.setInt(7, c.getCl_people());
			pstmt.setInt(8, c.getCl_price());
			pstmt.setString(9, c.getCl_addr());
			pstmt.setString(10, c.getCl_s_date());
			pstmt.setString(11, c.getCl_e_date());
			pstmt.setString(12, c.getCl_type());
			
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("insertClassInfo error: "+e.getMessage());
		}
		return re;
	}
	public int findClassNo(ClassVO c) {
		int re = -1;
		String sql = "select cl_no from class "
				+ "where a_no=? and cl_title=? and cl_content=? and cl_people=? "
				+ "and cl_s_date=? and cl_e_date=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getA_no());
			pstmt.setString(2, c.getCl_title());
			pstmt.setString(3, c.getCl_content());
			pstmt.setInt(4, c.getCl_people());
			pstmt.setString(5, c.getCl_s_date());
			pstmt.setString(6, c.getCl_e_date());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				re = rs.getInt(1);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("findClassNo error: "+e.getMessage());
		}
		return re;
	}
	
	public int insertClassTimeInfo(int cl_no, ClassTimeVO c) {
		int re = -1;
		String sql = "insert into time values(seq_time.nextval, ?, null, ?, ?, ?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cl_no);
			pstmt.setString(2, c.getT_day());
			pstmt.setString(3, c.getT_s_time());
			pstmt.setString(4, c.getT_e_time());
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("insertClassTimeInfo error: "+e.getMessage());
		}
		return re;
	}
}
