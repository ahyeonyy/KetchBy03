package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ketchby.dao.AccountDAO;
import com.ketchby.dao.ChoiceDAO;
import com.ketchby.vo.AccountVO;

public class InsertAccountOKAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		String pwdcom = request.getParameter("passwordcom");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String sloc_no1 = request.getParameter("sloc_no1");
		String sloc_no2 = request.getParameter("sloc_no2");
		
		int sca_no1= 0;
		int sca_no2= 0;
		int sca_no3= 0;
		if(request.getParameter("sca_no1") != null) {
			sca_no1 = Integer.parseInt(request.getParameter("sca_no1"));
		}
		if(request.getParameter("sca_no2") != null) {
			sca_no1 = Integer.parseInt(request.getParameter("sca_no2"));
		}
		if(request.getParameter("sca_no3") != null) {
			sca_no1 = Integer.parseInt(request.getParameter("sca_no3"));
		}
		
		System.out.println(sloc_no1);
		System.out.println(sloc_no2);
		System.out.println(sca_no1);
		
		System.out.println("생일:"+birth);
		AccountDAO dao = AccountDAO.getInstance();
		AccountVO a = new AccountVO();
		a.setA_email(email);
		a.setA_pwd(pwd);
		a.setA_name(name);
		a.setA_nick(nick);
		a.setA_phone(phone);
		a.setA_birth(birth);
		int r = dao.insertAccount(a);
		int a_no = dao.findA_no(nick);
		System.out.println(a_no);
		ChoiceDAO daop = ChoiceDAO.getInstance();
		if (sloc_no1!=null && !sloc_no1.equals("")) {
			int p1_no = daop.FindSlocNo(sloc_no1);
			int p1 = daop.insertPlace(a_no, p1_no);
		 }
		if (sloc_no2!=null && !sloc_no2.equals("")) {
			int p2_no = daop.FindSlocNo(sloc_no2);
			int p2 = daop.insertPlace(a_no, p2_no);
		}
		
		if(sca_no1!=0) {
			int h1 = daop.insertFavorite(a_no, sca_no1);
		}
		if(sca_no2!=0) {
			int h2 = daop.insertFavorite(a_no, sca_no2);
		}
		if(sca_no3!=0) {
			int h3 = daop.insertFavorite(a_no, sca_no3);
		}
		
		return "login.jsp";
	}

}