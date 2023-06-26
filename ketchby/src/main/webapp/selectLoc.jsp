<%@page import="com.ketchby.vo.SlocationVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.ketchby.dao.ChoiceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bloc_no = Integer.parseInt(request.getParameter("bloc_no"));

	System.out.println(bloc_no);	
	ChoiceDAO dao = ChoiceDAO.getInstance();
	ArrayList<SlocationVO> list = dao.findSlocName(bloc_no);
	Gson gson = new Gson();
	String data = gson.toJson(list);
	out.print(data);
%>