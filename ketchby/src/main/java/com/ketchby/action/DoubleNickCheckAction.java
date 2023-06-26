package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ketchby.dao.AccountDAO;

public class DoubleNickCheckAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AccountDAO dao = AccountDAO.getInstance();
		String nick = request.getParameter("nick");
		int r = dao.nickDoubleCheck(nick);
		
		String msg = "";
		if(r==1) {
			msg= nick+"은 이미 존재하는 닉네임입니다.";
		}else {
			msg= nick+"은 사용가능한 닉네임입니다.";
		}
		request.setAttribute("msg", msg);
		System.out.println(msg);
		return "doubleNickCheck.jsp";
	}

}
