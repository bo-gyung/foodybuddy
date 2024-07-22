package com.foodybuddy.userpage.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.user.vo.User;
import com.foodybuddy.userpage.service.UserPageService;


@WebServlet("/user/update")
public class UserPageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserPageUpdateServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//세션
				HttpSession session = request.getSession(false);
				
				if(session!=null) {
					User u = (User)session.getAttribute("user");
					
					Map<String,Object> resultMap = new UserPageService().selectMyInfo(u);
						
					request.setAttribute("userInfo", resultMap);
						
					RequestDispatcher view = request.getRequestDispatcher("/views/userpage/user_update_views.jsp");
					view.forward(request, response);
				}
				
//				int userNo = Integer.parseInt(request.getParameter("user_no"));
//				String userName = request.getParameter("user_name");
//				String userAddr = request.getParameter("user_addr");
//				String userDetailAddr = request.getParameter("user_detailAddr");
//				String userExtraAddr = request.getParameter("user_extraAddr");
//				String userPhone = request.getParameter("user_phone");
//				String userEmail = request.getParameter("user_email");
				
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
