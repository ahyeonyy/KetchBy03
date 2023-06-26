<%@page import="com.google.gson.Gson"%>
<%@page import="com.ketchby.vo.MainClassVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ketchby.dao.ClassMainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String bca_name = request.getParameter("bca_name");
	System.out.print("bca_name:"+bca_name);
	int bca_no = Integer.parseInt( request.getParameter("bca_no"));
	
	ClassMainDAO dao = ClassMainDAO.getInstance();
	ArrayList<MainClassVO> list = dao.findAllClass(bca_no, bca_name, null, null, null);
	Gson gson = new Gson();
	String str = gson.toJson(list);
%>
<%= str %>