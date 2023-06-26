package com.ketchby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.AccountInVO;
import com.ketchby.vo.AreaClassVO;
import com.ketchby.vo.ClassTimeVO;
import com.ketchby.vo.ClassVO;
import com.ketchby.vo.ReviewInfoVO;


public class ClassDAO {
	public static ClassDAO dao;
	private ClassDAO(){
	}
	
	public static ClassDAO getInstance() {
		if(dao == null) {
			dao = new ClassDAO();
		}
		return dao;
	}
	
	public ClassVO findAllClass(int cl_no) {
		ClassVO c = new ClassVO();
		String sql = "select c.cl_no, c.sca_no, c.a_no, c.cl_title, c.cl_img, c.cl_content, "
				+ "c.cl_level, c.cl_people, c.cl_price, c.cl_addr, c.cl_date, to_char(c.cl_s_date, 'yyyy/mm/dd'), to_char(c.cl_e_date, 'yyyy/mm/dd'), "
				+ "c.cl_type, bca_name, sca_name "
				+ "from class c, scategory s, bcategory b "
				+ "where c.sca_no=s.sca_no and s.bca_no=b.bca_no and cl_no="+cl_no;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				c.setCl_no(rs.getInt(1));
				c.setSca_no(rs.getInt(2));
				c.setA_no(rs.getInt(3));
				c.setCl_title(rs.getString(4));
				c.setCl_img(rs.getString(5));
				c.setCl_content(rs.getString(6));
				c.setCl_level(rs.getString(7));
				c.setCl_people(rs.getInt(8));
				c.setCl_price(rs.getInt(9));
				c.setCl_addr(rs.getString(10));
				c.setCl_date(rs.getString(11));
				c.setCl_s_date(rs.getString(12));
				c.setCl_e_date(rs.getString(13));
				c.setCl_type(rs.getString(14));
				c.setBca_name(rs.getString(15));
				c.setSca_name(rs.getString(16));
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("findAllClass error: "+e.getMessage());
		}
		return c;
	}
	
	public AccountInVO findAccountInfo(int cl_no) {
		AccountInVO a = new AccountInVO();
		String sql = "select a_nick, a_level, a_img "
				+ "from account a, class c "
				+ "where a.a_no=c.a_no and c.cl_no="+cl_no;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				a.setA_nick(rs.getString(1));
				a.setA_level(rs.getString(2));
				a.setA_img(rs.getString(3));
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("findAccountInfo error: "+e.getMessage());
		}
		return a;
	}
	
	public double totalClassTime(int cl_no) {
		double re = 0;
		String sql = "select distinct t_e_time, t_s_time from time where cl_no="+cl_no;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String end = rs.getString(1);
				String start = rs.getString(2);
				String end_t[] = end.split(":");
				String start_t[] = start.split(":");
				double end1 = (double)Integer.parseInt(end_t[0]);
				double end2 = (double)(Integer.parseInt(end_t[1])/60);
				double start1 = (double)Integer.parseInt(start_t[0]);
				double start2 = (double)(Integer.parseInt(start_t[1])/60);
				re += end1+end2-(start1-start2);
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("totalClassTime error: "+e.getMessage());
		}
		return re;
	}
	
	public ArrayList<ClassTimeVO> findClassTime(int cl_no) {
		ArrayList<ClassTimeVO> list = new ArrayList<>();
		String sql = "select t_day, t_s_time, t_e_time from time t, class c "
				+ "where t.cl_no=c.cl_no and c.cl_no="+cl_no;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ClassTimeVO c = new ClassTimeVO();
				c.setT_day(rs.getString(1));
				c.setT_s_time(rs.getString(2));
				c.setT_e_time(rs.getString(3));
				list.add(c);
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("findClassTime error: "+e.getMessage());
		}
		return list;
	}
	
	public double findScore(int cl_no) {
		double avg_score = 0.0;
		String sql = "select avg(r_star) from review where cl_no="+cl_no;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				avg_score = rs.getDouble(1);
			}
		} catch (Exception e) {
			System.out.println("findScore: "+e.getMessage());
		}
		return avg_score;
	}
	
	public ArrayList<ReviewInfoVO> findReview(int cl_no) {
		ArrayList<ReviewInfoVO> list = new ArrayList<>();
		String sql = "select r_content, r_date, a_nick, r_star "
				+ "from review r, account a, class c "
				+ "where a.a_no=c.a_no and c.cl_no=r.cl_no "
				+ "and r.a_no=a.a_no and c.cl_no="+cl_no;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ReviewInfoVO r = new ReviewInfoVO();
				r.setR_content(rs.getString(1));
				r.setR_date(rs.getDate(2));
				r.setA_nick(rs.getString(3));
				r.setR_star(rs.getDouble(4));
				list.add(r);
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("findReview error: "+e.getMessage());
		}
		return list;
	}
	
	//선호지역 중 한 지역의 인기 클래스 출력(4,5개까지만 받기(후기 없는거 제외됐기 떄문))
	public ArrayList<AreaClassVO> findAreaClass(int a_no) {
		ArrayList<AreaClassVO> list = new ArrayList<>();
		String sql = "select distinct x.cl_no, cl_title, cl_level, cl_img, cl_price, bca_name, sca_name, a_level, cnt, aver from "
				+ "(select cl_no,cl_title, cl_img, cl_level, cl_price, bca_name, sca_name, a_level "
				+ "from account a, class c, scategory s, bcategory b "
				+ "where a.a_no=c.a_no "
				+ "and s.sca_no=c.sca_no and s.bca_no=b.bca_no "
				+ "and c.cl_no in (select cl_no "
				+ "from class where cl_addr like '%'|| "
				+ "(select sloc_name from slocation s, place p "
				+ "where s.sloc_no=p.sloc_no and p.a_no="+a_no+" and rownum=1)|| '%')) x, "
				+ "(select r.cl_no cl_no, count(r.a_no) cnt, avg(r_star) aver "
				+ "from account a, review r, class c "
				+ "where a.a_no=c.a_no and r.cl_no=c.cl_no and c.cl_no in "
				+ "(select cl_no from class where cl_addr like '%'|| "
				+ "(select sloc_name from slocation s, place p "
				+ "where s.sloc_no=p.sloc_no and p.a_no="+a_no+" and rownum=1)|| '%') group by r.cl_no) y "
				+ "where x.cl_no=y.cl_no";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				AreaClassVO a = new AreaClassVO();
				a.setCl_no(rs.getInt(1));
				a.setCl_title(rs.getString(2));
				a.setCl_level(rs.getString(3));
				a.setCl_img(rs.getString(4));
				a.setCl_price(rs.getInt(5));
				a.setBca_name(rs.getString(6));
				a.setSca_name(rs.getNString(7));
				a.setA_level(rs.getString(8));
				a.setCnt(rs.getInt(9));
				a.setAver(rs.getDouble(10));
				list.add(a);
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("findAreaClass error: "+e.getMessage());
		}
		return list;
	}
	
	//지역 이름 추천
	public HashMap<String, String> findAreaName(int a_no) {
		HashMap<String, String> map = new HashMap<>();
		String sql = "select bloc_name, sloc_name \n"
				+ "from slocation s, place p, blocation b \n"
				+ "where s.sloc_no=p.sloc_no and s.bloc_no=b.bloc_no and p.a_no="+a_no+" and rownum=1";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				map.put("bloc", rs.getString(1));
				map.put("sloc", rs.getString(2));
			}
			
		} catch (Exception e) {
			System.out.println("findAreaName error: "+e.getMessage());
		}
		return map;
	}
	
	public int countLike(int cl_no) {
		int re = 0;
		String sql = "select count(a_no) from likes where cl_no="+cl_no;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				re = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("countLike error: "+e.getMessage());
		}
		return re;
	}
	
	public int insertLikes(int a_no, int cl_no) {
		int re = -1;
		String sql = "insert into likes (l_no,a_no,cl_no) values(seq_likes.NEXTVAL, ?, ?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			pstmt.setInt(2, cl_no);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("insertLikes error: "+e.getMessage());
		}
		return re;
	}
	
	public int deleteLike(int a_no, int cl_no) {
		int re = -1;
		String sql = "delete from likes where a_no="+a_no+" and cl_no="+cl_no;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);
			ConnectionProvider.close(conn, stmt);
		} catch (Exception e) {
			System.out.println("deleteLike error: "+e.getMessage());
		}
		return re;
	}
	
	public int checkLike(int a_no, int cl_no) {
		int re = 0;
		String sql = "select count(*) from likes where a_no="+a_no+" and cl_no="+cl_no;
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				re = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("checkLike error: "+e.getMessage());
		}
		return re;
	}
}