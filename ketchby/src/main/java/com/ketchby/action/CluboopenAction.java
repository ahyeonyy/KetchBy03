package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CluboopenAction implements KetchbyAction{

	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "clubopen.jsp";
	}

}
