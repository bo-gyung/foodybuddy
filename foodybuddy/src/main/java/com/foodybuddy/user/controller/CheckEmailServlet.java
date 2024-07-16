package com.foodybuddy.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.user.service.UserService;
import com.foodybuddy.user.vo.User;

@WebServlet("/checkEmail")
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CheckEmailServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("userEmail");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		User u = new UserService().selectByEmail(userEmail);
		try {
			if (u == null) {
				out.print("available");
			}else {
				out.print("unavailable");
			}
		}catch(Exception e) {
			e.printStackTrace();
			out.print("error");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
