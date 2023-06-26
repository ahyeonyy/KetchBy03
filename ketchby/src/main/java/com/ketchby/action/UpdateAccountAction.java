package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.AccountDAO;
import com.ketchby.vo.AccountVO;

public class UpdateAccountAction implements KetchbyAction{

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AccountDAO dao = AccountDAO.getInstance();
		//int a_no = Integer.parseInt(request.getAttribute("a_no"));
		HttpSession session = request.getSession();
		int a_no = (int)session.getAttribute("a_no");
		AccountVO a = dao.findAccountInfo(a_no);
		System.out.println("no:"+a.getA_no());
		request.setAttribute("a", a);
		
		return "updateAccount.jsp";
	}

}
