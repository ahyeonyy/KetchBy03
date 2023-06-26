package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.ketchby.dao.ClubApplyDAO;

public class Clubapply implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClubApplyDAO dao=ClubApplyDAO.getInstance();
		HttpSession session=request.getSession();
		int a_no=(int) session.getAttribute("a_no");
		int cb_no=Integer.parseInt(request.getParameter("cb_no"));
		int re=dao.insertwithClub(cb_no, a_no);
		if(re==1) {
			request.setAttribute("msg", "등록하였습니다");
		}else {
			request.setAttribute("msg", "등록에 실패하였습니다");
		}
		
		return "clubapplication.jsp";
	}

}
