package com.foodybuddy.userpage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.userpage.service.UserPageService;


@WebServlet("/user/delete")
public class UserPageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UserPageDeleteServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    	       
	}
}
