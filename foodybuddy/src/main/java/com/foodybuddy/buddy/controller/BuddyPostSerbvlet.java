package com.foodybuddy.buddy.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.buddy.service.BuddyService;

@WebServlet("/board/buddy/post")
public class BuddyPostSerbvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BuddyPostSerbvlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클릭한 글번호 받아오기
		int buddy_no = Integer.parseInt(request.getParameter("buddy_no"));
		// 글번호에 해당하는 글내용 받아오기
		Map<String,Object> resultMap = new BuddyService().buddyPost(buddy_no);
		request.setAttribute("post", resultMap);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/buddy/buddy_post.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
