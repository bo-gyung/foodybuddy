package com.foodybuddy.foody.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.foody.service.FoodyService;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.foodyPic.vo.Foody_Pic;


@WebServlet("/buddy/create")
public class BuddyChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BuddyChangeServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int foody_no = Integer.parseInt(request.getParameter("foody_no"));
        
        FoodyService foodyService = new FoodyService();
        Foody foody = foodyService.viewFoody1(foody_no).get(0);
        List<Foody_Pic> picPhoto = foodyService.pick_Pic1(foody_no);
        
        request.setAttribute("foody", foody);
        request.setAttribute("picPhoto", picPhoto);

        RequestDispatcher view = request.getRequestDispatcher("/views/buddy/buddy_create.jsp");
        view.forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
