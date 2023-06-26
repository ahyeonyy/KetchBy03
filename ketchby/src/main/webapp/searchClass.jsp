<%@page import="com.google.gson.Gson"%>
<%@page import="com.ketchby.vo.MainClassVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ketchby.dao.ClassMainDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String a_level = request.getParameter("a_level");
	String cl_level = request.getParameter("cl_level");
	System.out.print("a_level:"+a_level);
	System.out.print("cl_level:"+cl_level);
	int bca_no = Integer.parseInt( request.getParameter("bca_no"));
	
	ClassMainDAO dao = ClassMainDAO.getInstance();
	ArrayList<MainClassVO> list = dao.findAllClass(bca_no, null, null, a_level, cl_level);
	Gson gson = new Gson();
	String str = gson.toJson(list);

%>
<%= str %>