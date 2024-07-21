package com.foodybuddy.buddy.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.buddy.service.BuddyService;
import com.foodybuddy.user.vo.User;

@WebServlet("/board/buddy/edit")
public class BuddyEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BuddyEditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/views/include/create_fail.jsp");
		HttpSession session = request.getSession(false);
		if(session!=null) {
			// 로그인 세션 있음
			User u = (User)session.getAttribute("user");
			int session_user_no = u.getUser_no();
			int buddy_no = Integer.parseInt(request.getParameter("buddy_no"));
			int buddy_user_no = Integer.parseInt(request.getParameter("user_no"));
			if(session_user_no==buddy_user_no) {
				// 작성글의 user_no와 세션의 user_no가 일치 -> 수정 페이지에 기존의 글 내용 담아서 연결
				// 글 번호에 해당하는 글 조회 및 어트리뷰트에 추가
				Map<String,Object> resultMap = new BuddyService().buddyPost(buddy_no);
				request.setAttribute("post", resultMap);
				//수정 페이지로 연결
				view = request.getRequestDispatcher("/views/buddy/buddy_edit.jsp");
			} else {
				// 아니라면 비정상적인 접근
				view = request.getRequestDispatcher("/views/include/abnormal approach.jsp");
			}
			
		} else {
			// 세션 없음
			// 로그인창 연결
			view = request.getRequestDispatcher("/views/include/limit_user.jsp");
		}
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
