<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getRealPath("account");
	System.out.println("uploadImage 동작함:"+path);
	MultipartRequest multi 
	= new MultipartRequest(request, 
			path, 
			1024*1024*5, 
			"utf-8");
	String fname = multi.getFilesystemName("file");
	System.out.println("file:"+fname);
%>
<%=fname%>