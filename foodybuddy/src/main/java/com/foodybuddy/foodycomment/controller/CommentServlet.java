package com.foodybuddy.foodycomment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.foodycomment.service.FcommentService;
import com.foodybuddy.foodycomment.vo.Comment;
import com.foodybuddy.user.vo.User;


@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CommentServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foody_no = request.getParameter("foody_no");
        String comment_text = request.getParameter("comment_text");
		// doGet 메서드 내에서 세션을 통해 사용자 객체 가져오기
		HttpSession session = request.getSession(false);
		if (session != null) {
		    User loggedInUser = (User) session.getAttribute("user");
		    if (loggedInUser != null) {
		        // 세션에서 사용자의 고유 번호를 가져와서 Comment 객체에 설정
		        int user_no = loggedInUser.getUser_no();
		        Comment comment = new Comment();
		        comment.setFoody_no(Integer.parseInt(foody_no));
		        comment.setUser_no(user_no);
		        comment.setComment_text(comment_text);

		        // 댓글 서비스를 이용하여 댓글 추가
		        FcommentService fcommentService = new FcommentService();
		        fcommentService.addComment(comment);

		        // 댓글 작성 후 다시 view.jsp로 돌아가기
		        request.setAttribute("foody_no", foody_no);
		        request.getRequestDispatcher("/foody/view?foody_no=" + foody_no ).forward(request, response);
		    } else {
		        // 로그인되지 않은 경우 처리
		        response.sendRedirect("login.jsp");
		    }
		} else {
		    // 세션이 null인 경우, 로그인되지 않은 상태
		    response.sendRedirect("/board/foody");
		}
	    
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
