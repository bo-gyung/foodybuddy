package com.foodybuddy.user.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/logout")
public class UserLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserLogoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃 기능 구현
		HttpSession session = request.getSession(false);
		
	    if (session != null) {
	        if (session.getAttribute("user") != null) {
	            session.removeAttribute("user");
	        }
	        if (session.getAttribute("c_list") != null) {
	            session.removeAttribute("c_list");
	        }
	        session.invalidate();
	    }

	    response.sendRedirect("/");
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}