package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.ClassMainDAO;

public class ClassMainAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String keyword = null;
		String a_level = null;
		String cl_level = null;
		String bca_name = null;
		
		if(session.getAttribute("keyword")!=null) {
			keyword = (String)request.getAttribute("keyword");
		}
		
		if(request.getParameter("keyword")!= null) {
			keyword = request.getParameter("keyword");
		}
		
		if(request.getParameter("bca_name")!= null) {
			bca_name = request.getParameter("bca_name");
		}
		
		if(request.getParameter("a_level")!= null) {
			a_level = request.getParameter("a_level");
		}
		
		if(request.getParameter("cl_level")!= null) {
			cl_level = request.getParameter("cl_level");
		}
		
		
		System.out.println("keyword:"+keyword);
		System.out.println("a_level:"+a_level);
		System.out.println("cl_level:"+cl_level);
		System.out.println("bca_name:"+bca_name);
		
		session.setAttribute("keyword", keyword);

		int bca_no = 1001;
		if(session.getAttribute("bca_no") !=null) {
			bca_no = Integer.parseInt (request.getParameter("bca_no"));
		}
		
		ClassMainDAO dao = ClassMainDAO.getInstance();
		request.setAttribute("list", dao.findAllClass(bca_no, bca_name, keyword, a_level, cl_level));
		request.setAttribute("bca_no", bca_no);
		request.setAttribute("bca_name", bca_name);
		return "classmain.jsp";
	}
}
