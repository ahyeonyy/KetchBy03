package com.ketchby.dao;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.DateVO;
import com.ketchby.vo.ReservationVO;
import com.ketchby.vo.TimeVO;

public class ReservationDAO {	
	private static ReservationDAO dao;

	public static ReservationDAO getInstance() {
		if (dao == null) {
			dao = new ReservationDAO();
		}
		return dao;
	}
	
	public int insertReservation(ReservationVO r) {
		int re = -1;
		String sql = "insert into reservation values(seq_reservation.nextval,?,?,?,1)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getA_no());
			pstmt.setInt(2, r.getCl_no());
			pstmt.setString(3, r.getRs_date());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외발생 :" +e.getMessage());
		}
		return re;
	}
	
	// 클래스 시간 
	public ArrayList<TimeVO> findClTime(int cl_no){
		ArrayList<TimeVO> list = new ArrayList<TimeVO>();
		String sql ="select cl_no,t_day, t_s_time, t_e_time from time t  "
				+ "where t.cl_no = ?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cl_no);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt(1);
				String day = rs.getString(2);
				String s_time = rs.getString(3);
				String e_time = rs.getString(4);
				TimeVO t = new TimeVO(cl_no, day, s_time, e_time);
				list.add(t);
			}
		} catch (Exception e) {
			System.out.println("예외발생 : "+e.getMessage());
		}
		return list;
	}
	
	
	//클래스 요일
	public DateVO findClDate(int cl_no){
		DateVO d = new DateVO();
		String sql = " SELECT cl_no, TO_CHAR(cl_s_date, 'YYYY-MM-DD') AS cl_s_date, TO_CHAR(cl_e_date, 'YYYY-MM-DD') AS cl_e_date, "
				+ "cl_price, cl_people "
				+ "FROM class "
				+ "WHERE cl_no = ?";
		System.out.println(sql);
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cl_no);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				d.setCl_no( rs.getInt(1));
				d.setS_date(rs.getString(2));
				d.setE_date(rs.getString(3));
				d.setPrice(rs.getInt(4));
				d.setPeople(rs.getInt(5));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생 :"+e.getMessage());
		}
		return d;
	}
	
	
	
	//클래스 신청 인원
	public int countReservePeole(int cl_no) {
		int cnt = -1;
		String sql = "select sum(cl_people) "
				+ "from reservation "
				+ "where cl_no = ? "
				+ "group by cl_no ";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cl_no);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생 : "+e.getMessage());
		}
		return cnt;
	}
}
