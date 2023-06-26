package com.ketchby.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.HotBoardVO;
import com.ketchby.vo.HotClubVO;
import com.ketchby.vo.MainClassVO;

public class MainpageDAO {
   private static MainpageDAO dao;

   private MainpageDAO() {
   }

   public static MainpageDAO getInstance() {
      if (dao == null) {
         dao = new MainpageDAO();
      }
      return dao;
   }

   public ArrayList<MainClassVO> findRecClass(int a_no) {
      String sql = "select cl_info.cl_no, cl_info.cl_title, cl_info.city_and_district,  "
            + "cl_info.cl_img, cl_info.cl_level, cl_info.cl_price, cl_info.bca_name, cl_info.sca_name,  cl_info.a_level "
            + "from ( " + "  select c.cl_no, c.cl_title, substr(c.cl_addr, 1, instr(c.cl_addr, ' ', 1, 2) - 1)  "
            + "   as city_and_district, c.cl_img, c.cl_level, c.cl_price, a.a_level, b.bca_name, s.sca_name "
            + "  from class c, account a, scategory s, bcategory b "
            + "  where c.a_no = a.a_no and c.sca_no = s.sca_no and b.bca_no = s.bca_no " + ") cl_info "
            + "where cl_info.cl_no in ( " + " select cl_no " + "  from ( " + " select distinct cl_no "
            + " from reservation " + "    where a_no in ( " + " select a_no " + " from ( "
            + " select a_no, count(a_no) " + " from reservation " + " where cl_no in ( "
            + " select c.cl_no " + " from account a, reservation rs, class c "
            + " where a.a_no = rs.a_no and rs.cl_no = c.cl_no and rs.a_no in  "
            + "   (select a.a_no from account where a.a_no = ?) "
            + "  ) and a_no != ? " + "        group by a_no " + "        order by count(a_no) desc "
            + "  ) " + " where rownum <= 3 " + "    ) " + "    and cl_no not in ( " + "      select cl_no "
            + "  from reservation " + " where a_no = ? " + " ) " + "    union "
            + "  select cl_no " + " from ( " + "      select cl_no, count(cl_no) " + "      from reservation "
            + "  group by cl_no " + "  order by count(cl_no) desc " + "    ) " + "    where rownum <= 5 "
            + "  ) " + ") " + "and rownum <= 7";

      System.out.println("sql1:" + sql);

      ArrayList<MainClassVO> list = new ArrayList<MainClassVO>();
      try {
         Connection conn = ConnectionProvider.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, a_no);
         pstmt.setInt(2, a_no);
         pstmt.setInt(3, a_no);
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
   
   public ArrayList<MainClassVO> findHotClass(){
      ArrayList<MainClassVO> list2 = new ArrayList<MainClassVO>();
      String sql="select c.cl_no, c.cl_title, substr(c.cl_addr, 1, instr(c.cl_addr, ' ', 1, 2) - 1) as city_and_district, "
            + "c.cl_img, c.cl_level, c.cl_price, b.bca_name,  s.sca_name, a.a_level "
            + "from class c, account a, scategory s, bcategory b "
            + "where c.a_no = a.a_no and c.sca_no = s.sca_no and b.bca_no = s.bca_no "
            + "and c.cl_no in (select cl_no from ( select cl_no from reservation group by cl_no "
            + "order by  count(cl_no) desc) where rownum <= 7)";
      System.out.println("sql2:" + sql);
      
      try {
         Connection conn = ConnectionProvider.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         while(rs.next()){
            MainClassVO n = new MainClassVO();
            n.setCl_no(rs.getInt(1));
            n.setCl_title(rs.getString(2));
            n.setAddr(rs.getString(3));
            n.setCl_img(rs.getString(4));
            n.setCl_level(rs.getString(5));
            n.setCl_price(rs.getInt(6));
            n.setBca_name(rs.getString(7));
            n.setSca_name(rs.getString(8));
            n.setA_level(rs.getString(9));
            list2.add(n);
         }
         ConnectionProvider.close(conn, stmt, rs);
         
      }catch (Exception e) {
         System.out.println("예외발생:" + e.getMessage());
      }
      
      return list2;
   }
   
   public ArrayList<HotClubVO> findHotClub(){
      ArrayList<HotClubVO> list3 = new ArrayList<HotClubVO>();
      String sql="SELECT * "
            + "FROM (SELECT cb.cb_no, cb.cb_title, cb.cb_people, COUNT(ca.cb_ap_no) AS ap_cnt, cb.cb_img, bc.bca_name, sc.sca_name, to_char(cb.cb_cls_date,'yyyy/mm/dd'), sl.sloc_no "
            + "FROM club cb "
            + "LEFT JOIN club_application ca ON cb.cb_no = ca.cb_no "
            + "JOIN scategory sc ON cb.sca_no = sc.sca_no "
            + "JOIN bcategory bc ON sc.bca_no = bc.bca_no "
            + "JOIN slocation sl ON cb.sloc_no = sl.sloc_no "
            + "GROUP BY cb.cb_no, cb.cb_title, cb.cb_people, cb.cb_img, bc.bca_name, sc.sca_name, cb.cb_cls_date, sl.sloc_no "
            + "ORDER BY COUNT(ca.cb_ap_no) / cb.cb_people DESC) WHERE ROWNUM <= 3";
      System.out.println("sql3:" + sql);
      try {
         Connection conn = ConnectionProvider.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         while(rs.next()) {
            HotClubVO h = new HotClubVO();
            h.setCb_no(rs.getInt(1));
            h.setCb_title(rs.getString(2));
            h.setCb_people(rs.getInt(3));
            h.setAp_cnt(rs.getInt(4));
            h.setCb_img(rs.getString(5));
            h.setBca_name(rs.getString(6));
            h.setSca_name(rs.getString(7));
            h.setCb_cls_date(rs.getString(8));
            h.setSloc_no(rs.getInt(9));
            list3.add(h);
         }
      }catch (Exception e) {
         System.out.println("예외발생:" + e.getMessage());
      }
      return list3;
   }
      public ArrayList<HotBoardVO> findHotBoard(){
         ArrayList<HotBoardVO> list4 = new ArrayList<HotBoardVO>();
         String sql="select * "
               + "from ( "
               + "  select b.b_no, b.b_title, b.b_content, b.b_date, a.a_no, a.a_nick, a.a_img, bc.bc_name "
               + "  from board b, boardcategory bc, comments c, account a "
               + "  where b.bc_no = bc.bc_no and b.b_no = c.b_no and b.a_no = a.a_no "
               + "  group by b.b_no, b.b_title, b.b_content, b.b_date, a.a_no, a.a_nick, a.a_img, bc.bc_name "
               + "  order by count(c.co_no) desc "
               + ") "
               + "where rownum <= 3";
         System.out.println("sql4:" + sql);
         try {
            Connection conn = ConnectionProvider.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
               HotBoardVO b = new HotBoardVO();
               b.setB_no(rs.getInt(1));
               b.setB_title(rs.getString(2));
               b.setB_content(rs.getString(3));
               b.setB_date(rs.getString(4));
               b.setA_no(rs.getInt(5));
               b.setA_nick(rs.getString(6));
               b.setA_img(rs.getString(7));
               b.setBc_name(rs.getString(8));
               list4.add(b);
            }
         }catch (Exception e) {
            System.out.println("예외발생:" + e.getMessage());
         }
         return list4;
   }

}