package com.foodybuddy.foodycomment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.foodycomment.service.FcommentService;
import com.foodybuddy.foodycomment.vo.Comment;


@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CommentServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	        String foody_no = request.getParameter("foody_no");
	        String user_name = (String) request.getSession().getAttribute("user_name"); // 세션에서 사용자 이름 가져오기
	        String comment_text = request.getParameter("comment_text");

	        Comment comment = new Comment();
	        comment.setFoody_no(Integer.parseInt(foody_no));
	        comment.setUser_name(user_name);
	        comment.setComment_text(comment_text);

	        FcommentService fcommentService = new FcommentService();
	        fcommentService.addComment(comment);

	        response.sendRedirect("view?foody_no=" + foody_no);
	    
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
