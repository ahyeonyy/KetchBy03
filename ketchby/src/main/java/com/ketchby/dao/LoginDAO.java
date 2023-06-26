package com.ketchby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ketchby.db.ConnectionProvider;

public class LoginDAO {
	private static LoginDAO dao;
	private LoginDAO() {	
	}
	
	public static LoginDAO getInstance() {
		if(dao==null) {
			dao=new LoginDAO();
		}
		return dao;
	}
	
	public boolean isMember(String email, String pwd) {
		boolean re = false;
		String sql = "select a_pwd from account where a_email=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString(1).equals(pwd)) {
					re=true;
				}
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		return re;
	}
}
