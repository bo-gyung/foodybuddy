package com.foodybuddy.userpage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.userpage.service.QnAService;
import com.foodybuddy.userpage.vo.QnA;


@WebServlet("/QnACreateEndServlet")
public class QnACreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public QnACreateEndServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnA q = new QnA();
		
		
		int result = new QnAService().createQnA(q);
		RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userqna/qnacreate_fail.jsp");
		if(result > 0) {
			view = request.getRequestDispatcher("/views/userpage/userqna/create_qnacreate_success.jsp");
		}
		view.forward(request, response);
		
//		넘어오지않았다면 , 게시글 등록화면으로 보내준다.
			response.sendRedirect("/qna/create");
	}



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
