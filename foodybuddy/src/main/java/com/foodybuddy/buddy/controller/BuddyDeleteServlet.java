package com.foodybuddy.buddy.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.buddy.service.BuddyService;

@WebServlet("/board/buddy/delete")
public class BuddyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BuddyDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int buddy_no = Integer.parseInt(request.getParameter("buddy_no"));
		int result = new BuddyService().deleteBuddy(buddy_no);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/include/create_fail.jsp");
		String url = "/board/buddy";
		
		if(result>0) {
			// 작성 성공
			System.out.println("삭제 성공");
			// 성공 페이지 연결
			view = request.getRequestDispatcher("/views/include/create_success.jsp");
			// 성공 페이지에서 모임 게시판으로 돌아갈 수 있는 url 부여
			request.setAttribute("servletUrl", url);
			
		}else {
			// 작성 실패
			System.out.println("삭제 실패");
			// 실패 페이지 연결
			view = request.getRequestDispatcher("/views/include/create_fail.jsp");
			// 실패 페이지에서 모임 게시판으로 돌아갈 수 있는 url 부여
			request.setAttribute("servletUrl", url);
		}
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
