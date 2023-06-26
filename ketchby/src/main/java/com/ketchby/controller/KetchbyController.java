package com.ketchby.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ketchby.action.KetchbyAction;


/**
 * Servlet implementation class KetchbyController
 */
@WebServlet("*.do")
public class KetchbyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KetchbyController() {
		super();
		// TODO Auto-generated constructor stub
	}

	HashMap<String, KetchbyAction> map;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String path = config.getServletContext().getRealPath("WEB-INF");
		map = new HashMap<String, KetchbyAction>();
		try {
			FileReader fr = new FileReader(path + "/ketchby.properties");
			Properties prop = new Properties();
			prop.load(fr);

			Iterator keyList = prop.keySet().iterator();
			while (keyList.hasNext()) {
				String key = (String) keyList.next();
				String clsName = (String) prop.get(key);
				map.put(key, (KetchbyAction) Class.forName(clsName).newInstance());
				System.out.println("key:" + key);
				System.out.println("clsName:" + clsName);
				System.out.println("-----------------------------------------------");
			}
			System.out.println(map);
			fr.close();
		} catch (Exception e) {
			System.out.println("예외발생 : " + e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		pro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		pro(request, response);
	}
	
	private void pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uri = request.getRequestURI();
	//	String cmd = uri.substring(uri.lastIndexOf("/")+1);
		int first = uri.indexOf("/")+1;
		
		String cmd = uri.substring(uri.indexOf("/",first)+1);
		System.out.println(cmd);
		KetchbyAction action = map.get(cmd);
		String view = action.pro(request,response);
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
