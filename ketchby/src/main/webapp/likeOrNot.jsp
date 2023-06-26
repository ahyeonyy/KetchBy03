<%@page import="com.google.gson.Gson"%>
<%@page import="com.ketchby.dao.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cl_no = Integer.parseInt(request.getParameter("cl_no"));

	int a_no = Integer.parseInt(request.getParameter("a_no"));

	ClassDAO dao = ClassDAO.getInstance();
	Gson gson = new Gson();
	int r = dao.checkLike(a_no, cl_no);
	int count = dao.countLike(cl_no);
	
	if(r==1){
		r = dao.deleteLike(a_no, cl_no);
		count = dao.countLike(cl_no);
		out.print(count);
	}else{
		r = dao.insertLikes(a_no, cl_no);
		count = dao.countLike(cl_no);
		out.print(count);
	}
%>