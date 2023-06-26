package com.ketchby.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.dao.ChoiceDAO;
import com.ketchby.dao.ClubApplyDAO;
import com.ketchby.vo.ClubVO;
import com.oreilly.servlet.MultipartRequest;

public class ClubopenOKAction implements KetchbyAction {

   @Override
   public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      String path = request.getRealPath("club");
      System.out.println("path 경로:"+path);
      MultipartRequest multi = new MultipartRequest(request,path, 1024*1024*5, "utf-8");
      
      int sca_no = Integer.parseInt(multi.getParameter("sca_no"));
      int sloc_no=Integer.parseInt(multi.getParameter("sloc_no"));
      HttpSession session=request.getSession();
      int a_no=(int) session.getAttribute("a_no");
      System.out.println("sca_no: "+sca_no);
      System.out.println("sloc_no: "+sloc_no);
      
      ClubVO c=new ClubVO();
      c.setA_no(a_no); 
      c.setSca_no(sca_no);
      c.setCb_title(multi.getParameter("cb_title"));
      
      String cb_img = "defaultclass.jpg";
      if(multi.getFilesystemName("file") != null) {
    	  cb_img = multi.getFilesystemName("file");
      }
      
      c.setCb_img(cb_img);
      c.setCb_content(multi.getParameter("cb_content"));
      c.setSloc_no(sloc_no);
      c.setCb_people(Integer.parseInt(multi.getParameter("cb_people")));
      c.setCb_cls_date(multi.getParameter("s_date"));
      
      System.out.println("s_date: "+multi.getParameter("s_date"));
      
      System.out.println(c.toString());
      ClubApplyDAO dao=ClubApplyDAO.getInstance();
      int re=dao.insertClubApply(c);
      if(re == 1) {
         request.setAttribute("msg", "게시물 등록에 성공!");
      }else {
         request.setAttribute("msg", "게시물 등록에 실패!");
      }
      return "clubopenOK.jsp";
   }

}