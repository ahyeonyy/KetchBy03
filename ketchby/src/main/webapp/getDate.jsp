<%@page import="com.google.gson.Gson"%>
<%@page import="com.ketchby.vo.DateVO"%>
<%@page import="com.ketchby.dao.ReservationDAO"%>
<%@ page language="java"  contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int cl_no = Integer.parseInt( request.getParameter("cl_no"));
ReservationDAO dao = ReservationDAO.getInstance();
DateVO d = dao.findClDate(cl_no);

Gson gson = new Gson();
String data = gson.toJson(d);
System.out.println(data);
out.print(data);


%>
