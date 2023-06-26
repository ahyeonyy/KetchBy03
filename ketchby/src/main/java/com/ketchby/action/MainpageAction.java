package com.ketchby.action;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.MainpageDAO;

public class MainpageAction implements KetchbyAction{

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int a_no = 6004;
		HttpSession session = request.getSession();
		if(session.getAttribute("a_no")!= null) {
			a_no= (int)session.getAttribute("a_no"); 
		}
		
		System.out.println(a_no);
		MainpageDAO dao = MainpageDAO.getInstance();
		request.setAttribute("list", dao.findRecClass(a_no));
		request.setAttribute("list2", dao.findHotClass());
		request.setAttribute("list3", dao.findHotClub());
		request.setAttribute("list4", dao.findHotBoard());
		return "mainpage.jsp";
	}	
}
