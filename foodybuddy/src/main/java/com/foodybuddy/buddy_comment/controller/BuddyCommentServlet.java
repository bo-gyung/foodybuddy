package com.foodybuddy.buddy_comment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.buddy_comment.service.BuddyCommentService;
import com.foodybuddy.buddy_comment.vo.BuddyComment;
import com.foodybuddy.user.vo.User;


@WebServlet("/insertBuddyComment")
public class BuddyCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuddyCommentServlet() {
        super();  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		int buddy_no = Integer.parseInt(request.getParameter("buddy_no"));
		String c_main = request.getParameter("comment_main");
        
        RequestDispatcher view = request.getRequestDispatcher("/views/include/create_fail.jsp");
        
		HttpSession session = request.getSession(false);
		if (session != null) {
			// 로그인 유지된 상태, 댓글 입력
		    User u = (User) session.getAttribute("user");
		    
		    BuddyComment c = new BuddyComment();
	        c.setBuddy_no((buddy_no));
	        c.setUser_no(u.getUser_no());
	        c.setComment_main(c_main);

	        // 댓글 서비스를 이용하여 댓글 추가
	        int result = new BuddyCommentService().insertComment(c);
	        
	        if(result>0) {
	        	// 댓글 insert 성공
	        	 // 댓글 작성 후 다시 view.jsp로 돌아가기
		        request.setAttribute("buddy_no", buddy_no);
		        view = request.getRequestDispatcher("/board/buddy/post?buddy_no=" + buddy_no);
	        }

		} else {
			// 세션없음
			// 로그인 세션 만료, 다시 로그인 요청하기
			System.out.println("로그인 세션 없음");
			// 로그인 페이지 연결
			view = request.getRequestDispatcher("/views/include/limit_user.jsp");
		}
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
