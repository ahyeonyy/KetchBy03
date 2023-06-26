package com.ketchby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.AccountVO;

public class AccountDAO {
	private static AccountDAO dao;
	private AccountDAO() {	
	}
	
	public static AccountDAO getInstance() {
		if(dao==null) {
			dao=new AccountDAO();
		}
		return dao;
	}
	//회원정보 불러오기
	public AccountVO findAccountInfo(int a_no) {
		AccountVO a =null;
		String sql= "select * from account where a_no=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt(1);
				String pwd = rs.getString(2);
				String birth = rs.getString(3);
				String email = rs.getString(4);
				String name = rs.getString(5);
				String nick = rs.getString(6);
				String phone = rs.getString(7);
				String img = rs.getString(8);
				String level = rs.getString(9);
				a= new AccountVO(a_no,pwd,birth,email,name,nick,phone,img,level);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		return a;
	}
	public int findAccountNo(String email) {
		int n = -1;
		String sql= "select a_no from account where a_email=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				n = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		return n;
	}
	
	
	//회원update
	public int updateAccount(AccountVO a) {
		int re = -1;
		String sql="update account set a_pwd=?, a_email=?, a_nick=?, a_phone=?, a_img=? where a_no=?";
		System.out.println("a_phone"+a.getA_phone());
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getA_pwd());
			pstmt.setString(2, a.getA_email());
			pstmt.setString(3, a.getA_nick());
			pstmt.setString(4, a.getA_phone());
			pstmt.setString(5, a.getA_img());
			pstmt.setInt(6, a.getA_no());
			re=pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
			
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		return re;
	}
	//a_no불러오기
	public int findA_no(String nick) {
		int n=0;
		String sql = "select a_no from account where a_nick=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				n=rs.getInt(1);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("nickDoubleCheck 예외발생:"+e.getMessage());
		}
		return n;
	}
	
	//회원insert
	public int insertAccount(AccountVO a) {
		int re=-1;
		String sql="insert into account (a_no,a_pwd,a_birth,a_email,a_name,a_nick,a_phone) values(seq_account.nextval,?,TO_DATE(?, 'YYYY-MM-DD'),?,?,?,?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getA_pwd());
			pstmt.setString(2, a.getA_birth());
			pstmt.setString(3, a.getA_email());
			pstmt.setString(4, a.getA_name());
			pstmt.setString(5, a.getA_nick());
			pstmt.setString(6, a.getA_phone());
			
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
			
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		return re;
	}

	//닉네임중복체크
	public int nickDoubleCheck(String nick) {
		int re=-1;
		String sql ="select a_nick from account where a_nick= ?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(nick)) {
					re=1;
				}
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("nickDoubleCheck 예외발생:"+e.getMessage());
		}
		return re;
	}
	
	
}
