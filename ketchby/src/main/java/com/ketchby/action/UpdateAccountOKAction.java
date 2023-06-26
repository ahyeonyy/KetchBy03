package com.ketchby.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ketchby.dao.AccountDAO;
import com.ketchby.dao.ChoiceDAO;
import com.ketchby.vo.AccountVO;
import com.oreilly.servlet.MultipartRequest;

public class UpdateAccountOKAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String path = request.getRealPath("account");
		System.out.println("path"+path);
		MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5,"utf-8");
		AccountVO a = new AccountVO();
	    String email = multi.getParameter("email"); 
		String password = multi.getParameter("password"); 
		String nick = multi.getParameter("nick"); 
		String phone = multi.getParameter("phone"); 
		String img = multi.getFilesystemName("file");
		String sloc_no1 = multi.getParameter("sloc_no1");
		String sloc_no2 = multi.getParameter("sloc_no2");
	
		String sca_no1 = multi.getParameter("sca_no1");
		String sca_no2 = multi.getParameter("sca_no2");
		String sca_no3 = multi.getParameter("sca_no3");
		System.out.println("장소:"+ sloc_no1);
		System.out.println("취미"+sca_no1);
		System.out.println(nick);
		int no = Integer.parseInt(multi.getParameter("h_no"));
		System.out.println(no);
		String h_img = multi.getParameter("h_img");
		
		 if (email==null || email.equals("")) {
		   email = multi.getParameter("h_email");
		 }
		 if (img==null || img.equals("")) {
			 img = multi.getParameter("h_img");
		 }

	     if (password==null||password.equals("")) {
	      password = multi.getParameter("h_password");
	     }
		    
	    if (nick==null||nick.equals("")) {
	      nick = multi.getParameter("h_nick");
	    }
	    if ( phone==null||phone.equals("")) {
	      phone = multi.getParameter("h_phone");
	    }
	    a.setA_email(email);
		a.setA_nick(nick);
		a.setA_phone(phone);
		a.setA_pwd(password);
		a.setA_no(no);
		a.setA_img(img);
		AccountDAO dao = AccountDAO.getInstance();
		int r = dao.updateAccount(a);
		System.out.println(r);
		System.out.println(nick);
		System.out.println(phone);
		if(img != null||!img.equals("")) {
			File file = new File(path+"/"+h_img);
			file.delete();
		}
		int a_no = dao.findA_no(nick);
		System.out.println(a_no);
		ChoiceDAO daop = ChoiceDAO.getInstance();
		int df = daop.deleteFavorite(a_no);
		request.setAttribute("a", a);
		
		
		return "mypage_main.jsp";
	}

}
