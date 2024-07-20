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
		
		HttpSession session = request.getSession(false);
		if (session != null) {
		    User loggedInUser = (User) session.getAttribute("user");
		    if (loggedInUser != null) {
		
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
		    	response.setContentType("text/html;charset=UTF-8");
                response.getWriter().write("<script>alert('로그인이 필요합니다.'); history.back();</script>");
		    }
		} else {
			response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("<script>alert('오류가 발생했습니다 관리자에게 문의 해주세요.'); history.back();</script>");
		}
	    
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
