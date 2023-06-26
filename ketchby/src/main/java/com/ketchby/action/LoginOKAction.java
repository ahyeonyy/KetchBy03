package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.AccountDAO;
import com.ketchby.dao.LoginDAO;
import com.ketchby.vo.AccountVO;

public class LoginOKAction implements KetchbyAction{

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		String view="mainpage.do";
		LoginDAO dao = LoginDAO.getInstance();
		Boolean re = dao.isMember(email, pwd);
		if(re) {
			
			int no = AccountDAO.getInstance().findAccountNo(email);
			view="mainpage.do";
	        HttpSession session = request.getSession();
	        session.setAttribute("a_no", no);
	        
	        System.out.println(no);
		}else {
			view="login.jsp";
		}
		return view;
	}

}
