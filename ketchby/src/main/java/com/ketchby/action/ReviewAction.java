package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.ReviewDAO;
import com.ketchby.vo.ReClassVO;
import com.ketchby.vo.ReviewVO;

public class ReviewAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cl_no = Integer.parseInt( request.getParameter("cl_no"));
		//int a_no = 6001;
		HttpSession session = request.getSession();
		int a_no = (int)session.getAttribute("a_no");
		ReviewDAO dao = ReviewDAO.getInstance();
		ReClassVO  rc = dao.findClassInfo(cl_no);
		request.setAttribute("rc", rc);
		request.setAttribute("a_no", a_no);

		return "review.jsp";
	}

}
