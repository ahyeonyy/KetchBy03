<%@page import="com.ketchby.dao.ReviewDAO"%>
<%@page import="com.ketchby.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
int cl_no = Integer.parseInt(request.getParameter("cl_no"));

HttpSession sessionObj = request.getSession(); // 변수 이름 변경
int a_no = (int) sessionObj.getAttribute("a_no"); // 변수 이름 변경
ReviewDAO dao = ReviewDAO.getInstance();
String content = request.getParameter("content");
int star = Integer.parseInt(request.getParameter("star"));
ReviewVO r = new ReviewVO(cl_no, content, a_no, star, null);
int re = dao.insertReview(r);


%>