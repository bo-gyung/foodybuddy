package com.foodybuddy.message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.user.vo.User;

@WebServlet("/message/main")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MessageServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		try {
			if(session!=null) {
				User u = (User)session.getAttribute("user");
				if(u.getGrade_no() < 2) {
					// 준회원 열람불가
					RequestDispatcher view = request.getRequestDispatcher("/views/include/limit_regular.jsp");
					view.forward(request, response);
				}else {
					// 연결
					RequestDispatcher view = request.getRequestDispatcher("/views/message/main.jsp");
					view.forward(request, response);
				}
			}
		} catch(NullPointerException e) {
			// 비회원 열람불가
			RequestDispatcher view = request.getRequestDispatcher("/views/include/limit_user.jsp");
			view.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
