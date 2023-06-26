package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ketchby.dao.ClubDetailDAO;

public class ClubmainAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ClubDetailDAO dao=ClubDetailDAO.getInstance();
		
		String keyword=null;
		String sortColum="new";
		
		if(request.getParameter("keyword")!=null) {
			keyword=request.getParameter("keyword");
		}

		if(request.getParameter("sortColum") != null  && !request.getParameter("sortColum").equals("")) {
			sortColum=request.getParameter("sortColum");
		}

		System.out.println("검색어"+keyword);
		System.out.println("sortColum: "+sortColum);
		request.setAttribute("list", dao.findMainList(keyword,sortColum));
		return "clubmain.jsp";
	}
}
