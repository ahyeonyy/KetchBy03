package com.ketchby.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.ketchby.db.ConnectionProvider;
import com.ketchby.vo.ScategoryVO;
import com.ketchby.vo.SlocationVO;

public class ChoiceDAO {
   private static ChoiceDAO dao;
   private ChoiceDAO() {   
   }
   
   public static ChoiceDAO getInstance() {
      if(dao==null) {
         dao=new ChoiceDAO();
      }
      return dao;
   }
   public ArrayList<ScategoryVO> findScaName(int bca_no){
      ArrayList<ScategoryVO> list = new ArrayList<>();
      String sql = "select sca_no, bca_no, sca_name from scategory where bca_no="+bca_no;
      try {
         Connection conn = ConnectionProvider.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()) {
            ScategoryVO sca = new ScategoryVO();
            sca.setSca_no(rs.getInt(1));
            sca.setBca_no(rs.getInt(2));
            sca.setSca_name(rs.getString(3));
            list.add(sca);
         }
         ConnectionProvider.close(conn, pstmt, rs);
      } catch (Exception e) {
         System.out.println("findScaName error: "+e.getMessage());
      }
      return list;
   }
   
   public ArrayList<SlocationVO> findSlocName(int bloc_no){
      ArrayList<SlocationVO> list = new ArrayList<>();
      String sql = "select sloc_name,sloc_no,bloc_no from slocation where bloc_no="+bloc_no;
      try {
         Connection conn = ConnectionProvider.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()) {
            SlocationVO sloc=new SlocationVO();
            sloc.setSloc_name(rs.getString(1));
            sloc.setSloc_no(rs.getInt(2));
            sloc.setBloc_no(rs.getInt(3));
            list.add(sloc);
         }
         ConnectionProvider.close(conn, pstmt, rs);
      } catch (Exception e) {
         System.out.println("findSlocName error: "+e.getMessage());
      }
      return list;
   }
   
   public int FindScaNo(String sca_name) {
      int re = -1;
      String sql = "select sca_no from scategory where sca_name='"+sca_name+"'";
      try {
         Connection conn = ConnectionProvider.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         if(rs.next()) {
            re = rs.getInt(1);
         }
      } catch (Exception e) {
      System.out.println("FindScaNo error: "+e.getMessage());
      }
      return re;
   }
   
   
   public int FindSlocNo(String sloc_name) {
      int re = -1;
      String sql = "select sloc_no from slocation where sloc_name='"+sloc_name+"'";
      try {
         Connection conn = ConnectionProvider.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         if(rs.next()) {
            re = rs.getInt(1);
         }
      } catch (Exception e) {
         System.out.println("FindSlocNo error: "+e.getMessage());
      }
      return re;
   }
   
   public int insertPlace(int a_no, int sloc_no) {
	      int re=-1;
	      String sql="insert into place values(seq_place.nextval,?,?)";
	      try {
	         Connection conn = ConnectionProvider.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, a_no);
	         pstmt.setInt(2, sloc_no);
	         re = pstmt.executeUpdate();
	         ConnectionProvider.close(conn, pstmt);
	         
	      }catch (Exception e) {
	         System.out.println("예외발생:"+e.getMessage());
	      }
	      return re;
	   }
	   public int insertFavorite(int a_no, int sca_no) {
	      int re=-1;
	      String sql="insert into favorite values(seq_favorite.nextval,?,?)";
	      try {
	         Connection conn = ConnectionProvider.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, sca_no);
	         pstmt.setInt(2, a_no);
	         re = pstmt.executeUpdate();
	         ConnectionProvider.close(conn, pstmt);
	         
	      }catch (Exception e) {
	         System.out.println("예외발생:"+e.getMessage());
	      }
	      return re;
	   }
	   public int deleteFavorite(int a_no) {
	      int re=-1;
	      String sql="delete favorite where a_no=?";
	      try {
	         Connection conn = ConnectionProvider.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, a_no);
	         re = pstmt.executeUpdate();
	         ConnectionProvider.close(conn, pstmt);
	         
	      }catch (Exception e) {
	         System.out.println("예외발생:"+e.getMessage());
	      }
	      return re;
	   }
	   public int deletePlace(int a_no) {
	      int re=-1;
	      String sql="delete place where a_no=?";
	      try {
	         Connection conn = ConnectionProvider.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, a_no);
	         re = pstmt.executeUpdate();
	         ConnectionProvider.close(conn, pstmt);
	         
	      }catch (Exception e) {
	         System.out.println("예외발생:"+e.getMessage());
	      }
	      return re;
	   }


}