<%@page import="com.ketchby.dao.AccountDAO"%>
<%@page import="com.google.gson.Gson"%>

<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nick = request.getParameter("nick");
	int re = AccountDAO.getInstance().nickDoubleCheck(nick);
	Gson gson = new Gson();
	out.print(gson.toJson(re==-1?"T":"F"));
%>