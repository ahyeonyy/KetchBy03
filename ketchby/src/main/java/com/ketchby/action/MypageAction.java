package com.ketchby.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.MypageDAO;
import com.ketchby.vo.AccClubVO;
import com.ketchby.vo.AccLikeVO;
import com.ketchby.vo.AccReviewVO;
import com.ketchby.vo.AccountVO;
import com.ketchby.vo.CourseDetailVO;

public class MypageAction implements KetchbyAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * content 1 = 수강내역
		 * content 2 = 리뷰
		 * content 3 = 좋아요
		 * content 4 = 소모임
		 */
		
		MypageDAO dao = MypageDAO.getInstance();
	//	int a_no = 6001;
		HttpSession session = request.getSession();
		int a_no = (int)(session.getAttribute("a_no"));
		int menu = 1;
		String content = "mypage_reservation.jsp";
		if(request.getParameter("menu")!=null) {
			menu = Integer.parseInt(request.getParameter("menu"));
			System.out.println(menu);
			if(menu==2) {
				ArrayList<AccReviewVO> list = dao.findReview(a_no);
				content = "mypage_review.jsp";
				request.setAttribute("rlist", list);
			}else if(menu == 3) {
				ArrayList<AccLikeVO> list = dao.findLike(a_no);
				content = "mypage_like.jsp";
				request.setAttribute("llist", list);
				
			}else if(menu==4) {
				ArrayList<AccClubVO> list = dao.findClub(a_no);
				content = "mypage_club.jsp";
				request.setAttribute("clist", list);
			}
					
					
		}else {
			ArrayList<CourseDetailVO> list = dao.findCourse(a_no); // 회원번호 수정 필요 !!!!
			request.setAttribute("list", list);
				
			}
		
		AccountVO a = dao.findImage(a_no);
	//	String view = "mypage.jsp";
		request.setAttribute("img", a.getA_img());
		request.setAttribute("nick", a.getA_nick());
		request.setAttribute("content", content);
		//request.setAttribute("viewPage", view);
		return "mypage_main.jsp";
	}

}
