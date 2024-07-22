package com.foodybuddy.user.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.user.service.UserService;
import com.foodybuddy.user.vo.User;

@WebServlet(name="userLoginEnd", urlPatterns="/user/loginEnd")
public class UserLoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserLoginEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		User u = new UserService().loginUser(id,pw);
		
		if(u != null) {
			HttpSession session = request.getSession(true);
			if(session.isNew() || session.getAttribute("user") == null) {
				session.setAttribute("user", u);
				session.setMaxInactiveInterval(60*30);
				System.out.println("로그인 성공");
				
				if(u.getGrade_no()==4) {
					// 관리자 화면
					RequestDispatcher view = request.getRequestDispatcher("/views//user/adminpage.jsp");
					view.forward(request, response);
				} else {
					// 회원 화면
					if(u.getUser_warn()==0) {
						// 경고 0회
						response.sendRedirect("/");
					} else if(u.getUser_warn()>0) {
						// 경고 1회 이상
						LocalDateTime warn_date = u.getWarn_date();
						LocalDateTime base_date = LocalDateTime.now();
						if(warn_date.isAfter(base_date)) {
							// 현재보다 경고기간이 뒤일때 -> 로그인불가
							RequestDispatcher view = request.getRequestDispatcher("/views/user/login_warn.jsp");
							view.forward(request, response);
						} else {
							// 현재보다 경고기간이 앞일 때 -> 로그인 가능
							response.sendRedirect("/");
						}
					}
				}
			}
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/views/user/login_fail.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}