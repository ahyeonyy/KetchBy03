package com.ketchby.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ketchby.dao.ReservationDAO;
import com.ketchby.vo.DateVO;
import com.ketchby.vo.TimeVO;

public class ReservationAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cl_no = Integer.parseInt( request.getParameter("cl_no"));
		//int cl_no = 5001;
		System.out.println("cl_no"+cl_no);
		ReservationDAO dao = ReservationDAO.getInstance();
		ArrayList<TimeVO> list = dao.findClTime(cl_no);
		ArrayList daylist = new ArrayList();
		String s_time = "";
		String e_time = "";
		
		for (TimeVO t : list) {
		    String day = t.getDay();
		    System.out.println("day"+day);
		    int dayNumber;
		    s_time = t.getS_time();
		    e_time = t.getE_time();
		    System.out.println("for in s_time:"+s_time);
		    switch (day) {
		        case "일":
		            dayNumber = 0;
		            break;
		        case "월":
		            dayNumber = 1;
		            break;
		        case "화":
		            dayNumber = 2;
		            break;
		        case "수":
		            dayNumber = 3;
		            break;
		        case "목":
		            dayNumber = 4;
		            break;
		        case "금":
		            dayNumber = 5;
		            break;
		        case "토":
		            dayNumber = 6;
		            break;
		        default:
		            dayNumber = -1; // 처리할 수 없는 요일이라면 -1로 설정
		            break;
		    }

		    if (dayNumber != -1) {
		        daylist.add(dayNumber);
		        System.out.println(dayNumber);
		    }
		}
		System.out.println("daylist"+daylist);
		DateVO d = dao.findClDate(cl_no);
		System.out.println("dao:"+d.getE_date());
		request.setAttribute("d", d);
		request.setAttribute("daylist", daylist);
		request.setAttribute("cl_no", cl_no);
		request.setAttribute("s_time", s_time);
		System.out.println("s_time:"+s_time);
		request.setAttribute("e_time", e_time);
		return "reservation_popup.jsp";
	}

}