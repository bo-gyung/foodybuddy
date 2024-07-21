package com.foodybuddy.foody.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.foody.service.FoodyService;


@WebServlet("/foody/delete")
public class FoodyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FoodyDeleteServlet() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String foody_no = request.getParameter("foody_no");
		int foodyDel = Integer.parseInt(foody_no);
		
		int delView = new FoodyService().deleteFoody(foodyDel);
		
		
		
		RequestDispatcher view = request.getRequestDispatcher("/views/foody/del_fail.jsp");
        if (delView > 0) {
            view = request.getRequestDispatcher("/views/foody/del_success.jsp");
        }
        view.forward(request, response);

    	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
