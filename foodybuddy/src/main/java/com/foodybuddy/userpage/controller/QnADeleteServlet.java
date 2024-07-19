package com.foodybuddy.userpage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.userpage.service.QnAService;


@WebServlet("/qna/delete")
public class QnADeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public QnADeleteServlet() {
        super();
     
    }

	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		
//		RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userqna/qnadelete.jsp");
//		view.forward(request, response);
//	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");

	        String qnaNoStr = request.getParameter("qna_no");
	        // 유효성검사를 하는거야 , 전송되지 않았거나, 문자열이 비어있다면
	        if (qnaNoStr == null || qnaNoStr.isEmpty()) {
	            response.sendRedirect(request.getContextPath() + "/qna/deleteFail");
	            return;
	        }

	        int qnaNo;
	        try {
	            qnaNo = Integer.parseInt(qnaNoStr);
	        } catch (NumberFormatException e) {
	            response.sendRedirect(request.getContextPath() + "/qna/deleteFail");
	            return;
	        }

	        QnAService qnaService = new QnAService();
	        try {
	            int result = qnaService.deleteQnA(qnaNo);

	            if (result > 0) {
	                response.sendRedirect(request.getContextPath() + "/qna/list");
	            } else {
	                response.sendRedirect(request.getContextPath() + "/qna/deleteFail");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect(request.getContextPath() + "/qna/deleteFail");
	        }
	    }
		
	}


