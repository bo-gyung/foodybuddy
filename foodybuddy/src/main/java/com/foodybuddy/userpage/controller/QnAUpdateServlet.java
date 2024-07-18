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

@WebServlet("/qna/update")
public class QnAUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public QnAUpdateServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글번호를 입력받아왔어.
		String qnaNoStr = request.getParameter("qna_no");
		
		//만약 qnaNostr이 비어있거나, null값이라면
		if(qnaNoStr == null || qnaNoStr.isEmpty()) {
			// 응답받은걸 절로 보내라
			response.sendRedirect("/qna");
			return;
		}
		int qnaNo;
		try {
			qnaNo = Integer.parseInt(qnaNoStr);
		}catch(NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect("/qna/updateFail");
			return;
		}
		// qnaNo를 기준으로 QnA값 게시글 내용 로직
		QnAService qnaService = new QnAService();
		Map<String, Object> resultM = qnaService.qnaDetail(qnaNo);
		if(resultM == null) {
			response.sendRedirect("/qna/updateFail");
			return;
		}
		// 제목,내용 가져오기
		String title =request.getParameter("title");
		String content = request.getParameter("content");
		try {
			int result = qnaService.updateQnA(title, content, qnaNo);
			if (result > 0) {
	            response.sendRedirect("/qna/detail?qna_no=" + qnaNo);
	        } else {
	            response.sendRedirect("/qna/updateFail");
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userqna/qnaupdate.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
