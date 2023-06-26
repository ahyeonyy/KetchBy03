package com.ketchby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.MainClassVO;

public class ClassMainDAO {
	
	private static ClassMainDAO dao;

	private ClassMainDAO(){
	}

	public static ClassMainDAO getInstance() {
		if (dao == null) {
			dao = new ClassMainDAO();
		}
		return dao;
	}

	
	public ArrayList<MainClassVO> findAllClass(int bca_no, String bca_name, String keyword, String a_level, String cl_level) {
		String sql = "select distinct c.cl_no, c.cl_title, SUBSTR(c.cl_addr, 1, instr(c.cl_addr, ' ', 1, 2) - 1) as city_and_district,  "
				+ "c.cl_img, c.cl_level, c.cl_price, b.bca_name, s.sca_name, a.a_level  "
				+ "from class c, account a, scategory s, bcategory b "
				+ "where c.a_no = a.a_no and c.sca_no = s.sca_no and b.bca_no = s.bca_no  ";
				
				if (bca_name != null && !bca_name.isEmpty()) {
			        sql += "and b.bca_name = '"+bca_name+"' ";
			    }
		
				if (keyword != null && !keyword.isEmpty()) {
				    sql += "and c.cl_title like '%" + keyword + "%' or sca_name like '%" + keyword + "%'";
				}
				
				if (a_level != null && !a_level.isEmpty()) {
				        sql += "and a.a_level = '"+a_level+"'" ;
				    }

				if (cl_level != null && !cl_level.isEmpty()) {
				        sql += "and c.cl_level = '"+cl_level+"' ";
				    }
		
				sql+= "and b.bca_no = ?";

		System.out.println("sql:" + sql);

		ArrayList<MainClassVO> list = new ArrayList<MainClassVO>();
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bca_no);
		
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MainClassVO m = new MainClassVO();
				m.setCl_no(rs.getInt(1));
				m.setCl_title(rs.getString(2));
				m.setAddr(rs.getString(3));
				m.setCl_img(rs.getString(4));
				m.setCl_level(rs.getString(5));
				m.setCl_price(rs.getInt(6));
				m.setBca_name(rs.getString(7));
				m.setSca_name(rs.getString(8));
				m.setA_level(rs.getString(9));
				list.add(m);
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return list;
	}
}
