package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.ReservationDAO;
import com.ketchby.vo.ReservationVO;

public class ReservationOKAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		int cl_no = Integer.parseInt(request.getParameter("cl_no"));
		HttpSession session = request.getSession();
		//int a_no =(int)session.getAttribute("a_no") ;
		
		int a_no = (int)session.getAttribute("a_no");
		
		ReservationVO r  = new ReservationVO(1,a_no, cl_no, date, 1);
		ReservationDAO dao = ReservationDAO.getInstance();
		int re = dao.insertReservation(r);
		System.out.println(re);
		if (re>0) {
			request.setAttribute("msg","예약에 성공했습니다!");
		}else {
			request.setAttribute("msg","예약에 실패했습니다!");
			
		}
		return "classMain.do";
	}

}
