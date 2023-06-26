package com.ketchby.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.ClassOpenDAO;
import com.ketchby.vo.ClassTimeVO;
import com.ketchby.vo.ClassVO;
import com.oreilly.servlet.MultipartRequest;

public class ClassOpenOKAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		ClassOpenDAO dao = ClassOpenDAO.getInstance();
		
		request.setCharacterEncoding("utf-8");
		String path = request.getRealPath("class");
		MultipartRequest multi =new MultipartRequest(request, path, 1024*1024*50, "utf-8");
		
		//int a_no = (int)session.getAttribute("a_no");
		int a_no = (int)session.getAttribute("a_no");
		String cl_title = multi.getParameter("cl_title");
		String cl_content ="";
		if(multi.getParameter("cl_content") != null) {
			cl_content = multi.getParameter("cl_content");
		}
		int sca_no = Integer.parseInt(multi.getParameter("sca"));
		String cl_level = multi.getParameter("cl_level");
		int cl_people = 0;
		if(multi.getParameter("cl_people") != null) {
			cl_people = Integer.parseInt(multi.getParameter("cl_people"));
		};
		int cl_price = 0;
		if(multi.getParameter("cl_price") != null) {
			cl_price = Integer.parseInt(multi.getParameter("cl_price"));
		}
		String cl_img = "defaultclass.jpg";
		if(multi.getFilesystemName("file") != null) {
			cl_img = multi.getFilesystemName("file");
		}
		String cl_addr = "";
		if(multi.getParameter("cl_addr") != null) {
			cl_addr = multi.getParameter("cl_addr")+", "+multi.getParameter("cl_addr_detail");
		}
		String cl_s_date = multi.getParameter("cl_s_date");
		String cl_e_date = multi.getParameter("cl_e_date");
		String cl_type = "정규";
		if(multi.getParameter("oneday_check") != null) {
			cl_type="원데이";
		}
		
		String t_s_time = multi.getParameter("t_s_time");
		String t_e_time = multi.getParameter("t_e_time");
		
		ArrayList<String> day_list = new ArrayList<>();
		day_list.add(multi.getParameter("cl_day_mon"));
		day_list.add(multi.getParameter("cl_day_tue"));
		day_list.add(multi.getParameter("cl_day_wed"));
		day_list.add(multi.getParameter("cl_day_thu"));
		day_list.add(multi.getParameter("cl_day_fri"));
		day_list.add(multi.getParameter("cl_day_sat"));
		day_list.add(multi.getParameter("cl_day_sun"));
		
		ClassVO c = new ClassVO();
		c.setSca_no(sca_no);
		c.setA_no(a_no);
		c.setCl_title(cl_title);
		c.setCl_content(cl_content);
		c.setCl_img(cl_img);
		c.setCl_level(cl_level);
		c.setCl_people(cl_people);
		c.setCl_price(cl_price);
		c.setCl_addr(cl_addr);
		c.setCl_s_date(cl_s_date);
		c.setCl_e_date(cl_e_date);
		c.setCl_type(cl_type);
		
		int re = dao.insertClassInfo(c);
		
		//문제점
		//+ day 값들 중 선택되지 않은 것들은 null값으로 입력되므로 null인 것들은 입력을 제외해야할 듯
		//시작시간,날짜가 끝나는 시간, 날짜보다 늦을 경우재입력받아야
		
		int time_set = 0;
		
		for(String day: day_list) {
			ClassTimeVO t = new ClassTimeVO();
			if(day != null) {
				t.setT_day(day);
				t.setT_s_time(t_s_time);
				t.setT_e_time(t_e_time);
				time_set += dao.insertClassTimeInfo(dao.findClassNo(c), t);
			}
		}
		if(re==1 && time_set!=0) {
			request.setAttribute("msg", "클래스 개설에 성공하였습니다.");
		}
		return "classopenok.jsp";
	}
}