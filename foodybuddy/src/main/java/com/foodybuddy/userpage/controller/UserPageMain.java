package com.foodybuddy.userpage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.user.vo.User;


@WebServlet("/userpage/userpagemain")
public class UserPageMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UserPageMain() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		try {
			if(session!=null) {
				User u = (User)session.getAttribute("user");
			}
		} catch(NullPointerException e) {
			// 비회원 열람불가
			RequestDispatcher view = request.getRequestDispatcher("/views/buddy/buddy_unmath.jsp");
			view.forward(request, response);
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userpagemain.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
