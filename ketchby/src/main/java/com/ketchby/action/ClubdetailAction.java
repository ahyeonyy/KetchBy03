package com.ketchby.action;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ketchby.dao.ClubDetailDAO;

public class ClubdetailAction implements KetchbyAction {
	
	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClubDetailDAO dao=ClubDetailDAO.getInstance();
		int cb_no=0;
		try {
			cb_no=Integer.parseInt(request.getParameter("cb_no"));
		} catch (Exception e) {
			System.out.println("cb_no 변환 error: "+e.getMessage());
		}
		System.out.println("지금 하고 있는 클래스 번호 "+cb_no);
		int sloc_no=Integer.parseInt(request.getParameter("sloc_no"));
		request.setAttribute("cb_no", cb_no);
		request.setAttribute("recommand", dao.findRecommandClub(sloc_no, cb_no));
		request.setAttribute("info", dao.findClubInfo(cb_no));
		return "clubdetail.jsp";
	}
}
