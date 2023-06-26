<%@page import="com.google.gson.Gson"%>
<%@page import="com.ketchby.dao.ChoiceDAO"%>
<%@page import="com.ketchby.vo.ScategoryVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bca_no = Integer.parseInt(request.getParameter("bca_no"));

	ChoiceDAO dao = ChoiceDAO.getInstance();
	ArrayList<ScategoryVO> list = dao.findScaName(bca_no);
	Gson gson = new Gson();
	String data = gson.toJson(list);
	out.print(data);
%>