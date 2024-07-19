package com.foodybuddy.userpage.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.userpage.service.QnAService;


@WebServlet("/qna/detail")
public class QnADetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public QnADetail() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글제목클릭시 글 번호로 받아오기
		int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
		// 글 번호로 내용을 가져오기
		Map<String,Object> resultM = new QnAService().qnaDetail(qnaNo);
		request.setAttribute("detail",resultM);
		
				
	        RequestDispatcher view = request.getRequestDispatcher("/views/qna/qnadetail.jsp");
	        view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
