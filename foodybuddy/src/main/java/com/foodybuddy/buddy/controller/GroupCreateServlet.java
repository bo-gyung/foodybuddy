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
import javax.servlet.http.HttpSession;

import com.foodybuddy.buddy.service.BuddyService;
import com.foodybuddy.buddy_comment.service.BuddyCommentService;
import com.foodybuddy.buddy_comment.vo.BuddyComment;

@WebServlet("/group/create")
public class GroupCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GroupCreateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("서블릿으로 넘어왔다!~");
		
		// 클릭한 글번호 받아오기
		int buddy_no = Integer.parseInt(request.getParameter("buddy_no"));
		// 글번호에 해당하는 글내용 받아오기
		Map<String,Object> resultMap = new BuddyService().buddyPost(buddy_no);
		request.setAttribute("post", resultMap);
		
		HttpSession session = request.getSession(true);
		// 글번호에 해당하는 댓글 목록 받아오기
		List<BuddyComment> c_list = new BuddyCommentService().selectComment(buddy_no);
		session.setAttribute("c_list", c_list);
		session.setMaxInactiveInterval(60*30);

		
		RequestDispatcher view = request.getRequestDispatcher("/views/buddy/buddy_post.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		doGet(request, response);
	}

}
