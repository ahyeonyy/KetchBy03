package com.ketchby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.ReviewVO;
import com.ketchby.vo.ReClassVO;

public class ReviewDAO {
	private static ReviewDAO dao;

	public static ReviewDAO getInstance() {
		if (dao == null) {
			dao = new ReviewDAO();
		}
		return dao;
	}
	public int insertReview(ReviewVO r) {
		int re = -1;
		String sql ="insert into review values(seq_review.nextval,?,?,?,?,sysdate)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,r.getCl_no());
			pstmt.setString(2,r.getR_content());
			pstmt.setInt(3,r.getA_no());
			pstmt.setInt(4,r.getR_star());
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
			
		} catch (Exception e) {
			System.out.println("예외발생 : "+e.getMessage());
		}
		return re;
	}
	public ReClassVO findClassInfo(int cl_no) {
		ReClassVO rc = new ReClassVO();
		String sql = "select a.a_name, cl_title, cl_s_date, cl_img,cl_no "
				+ "from class cl, account a "
				+ "where a.a_no = cl.a_no and cl.cl_no = ?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cl_no);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				rc.setA_name(rs.getString(1));
				rc.setCl_title(rs.getString(2));
				rc.setCl_s_date(rs.getString(3));
				rc.setCl_img(rs.getString(4));	
				rc.setCl_no(rs.getInt(5));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생 :"+e.getMessage());
		}
		return rc;
	}
}
