package com.foodybuddy.buddy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.buddy.service.BuddyService;
import com.foodybuddy.buddy.vo.Buddy;

@WebServlet("/board/buddy")
public class BuddyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BuddyListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("연결");
		
		// 검색 및 목록출력
		String title = request.getParameter("buddy_title");
		Buddy keyword = new Buddy();
		keyword.setBuddy_title(title);
		
		List<Buddy> list = new BuddyService().selectBoardList(keyword);
		request.setAttribute("resultList", list);
		
		// 연결
		RequestDispatcher view = request.getRequestDispatcher("/views/buddy/buddy_list.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
