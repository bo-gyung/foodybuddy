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


@WebServlet("/qna/detail")
public class QnADetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public QnADetail() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글번호로 정보가져온것 
		int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
		
//		QnAService qnaService = new QnAService();
//		QnA qna = qnaService.getQnAByNo(qnaNo);
		
//		 request.setAttribute("qna", qna);
	        RequestDispatcher view = request.getRequestDispatcher("/views/qna/qnaDetail.jsp");
	        view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
