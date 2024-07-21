package com.foodybuddy.foody.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.foody.service.FoodyService;


@WebServlet("/foody/like")
public class FoodyGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodyGoodServlet() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	int foody_no = Integer.parseInt(request.getParameter("foody_no"));
	        int user_no = Integer.parseInt(request.getParameter("user_no"));

	        int good = new FoodyService().goodCount(foody_no , user_no);
	        
	        if(good > 0) {
	        	response.getWriter().write("좋아요!");
	        }else {
	        	response.getWriter().write("좋아요취소!");
	        }
	        
	}

}
