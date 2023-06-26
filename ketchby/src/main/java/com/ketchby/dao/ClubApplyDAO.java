package com.ketchby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.ClubVO;
import com.ketchby.vo.ClubapplicationVO;

public class ClubApplyDAO {
	
	public static ClubApplyDAO dao;

	private ClubApplyDAO() {
	}

	public static ClubApplyDAO getInstance() {
		if (dao == null) {
			dao = new ClubApplyDAO();
		}
		return dao;
	}
	
	
	/*소모임 게시물 글 등록*/
	public int insertClubApply(ClubVO cb) {
		int re=-1;
		String sql="insert into club values(seq_club.NEXTVAL,?,?,?,?,?,?,?,TO_DATE(sysdate, 'YYYY-MM-DD'),to_date(?, 'yyyy-mm-dd'))";
		try {
			Connection conn=ConnectionProvider.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cb.getA_no());
			pstmt.setInt(2, cb.getSca_no());
			pstmt.setString(3, cb.getCb_title());
			pstmt.setString(4, cb.getCb_img());
			pstmt.setString(5, cb.getCb_content());
			pstmt.setInt(6, cb.getSloc_no());
			pstmt.setInt(7, cb.getCb_people());
			pstmt.setString(8, cb.getCb_cls_date());
			re=pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("insertClubApply 예외"+e.getMessage());
		}
		return re;
	}
	/*소모임 가입 신청*/
	public int insertwithClub(int cb_no, int a_no) {
		int re=-1;
		String sql="insert into club_application VALUES (seq_club_application.NEXTVAL,?, ?)";
		try {
			Connection conn=ConnectionProvider.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cb_no);
			pstmt.setInt(2, a_no);
			re=pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("insertwithClub 예외:"+e.getMessage());
		}
		return re;
	}
}
