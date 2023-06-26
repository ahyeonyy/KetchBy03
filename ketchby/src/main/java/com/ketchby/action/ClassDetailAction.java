package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.ClassDAO;
import com.ketchby.vo.AreaClassVO;

public class ClassDetailAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClassDAO dao = ClassDAO.getInstance();
		HttpSession session = request.getSession();
		
		int cl_no = Integer.parseInt(request.getParameter("cl_no"));
		int a_no = (int) session.getAttribute("a_no");
		int likes = dao.countLike(cl_no);
		double avg = dao.findScore(cl_no);
		avg = Math.round(avg*100)/100.0;
		double times = dao.totalClassTime(cl_no);
		String addr = dao.findAllClass(cl_no).getCl_addr();
		
		System.out.println(addr);
		System.out.println("cl_no="+cl_no);
		
		
		request.setAttribute("r_list", dao.findReview(cl_no));
		request.setAttribute("cl_list", dao.findAllClass(cl_no));
		request.setAttribute("t_list", dao.findClassTime(cl_no));
		request.setAttribute("a_info", dao.findAccountInfo(cl_no));
		request.setAttribute("cl_no", cl_no);
		request.setAttribute("addr", addr);
		request.setAttribute("likes", likes);
		request.setAttribute("avg", avg);
		request.setAttribute("times", times);
		request.setAttribute("a_no", a_no);
		return "classdetail.jsp";
	}

}

