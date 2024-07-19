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
//		// 글번호를 입력받아왔어.
//		String qnaNoStr = request.getParameter("qna_no");
//		
//		//만약 qnaNostr이 비어있거나, null값이라면
//		if(qnaNoStr == null || qnaNoStr.isEmpty()) {
//			// 응답받은걸 절로 보내라
//			response.sendRedirect("/qna/updateFail");
//			return;
//		}
//		int qnaNo = 0;
//		try {
//			qnaNo = Integer.parseInt(qnaNoStr);
//		}catch(NumberFormatException e) {
//			e.printStackTrace();
//			response.sendRedirect("/qna/detail?qna_no=" + qnaNo);
//			return;
//		}
//		// qnaNo를 기준으로 QnA값 게시글 내용 로직
//		QnAService qnaService = new QnAService();
//		Map<String, Object> resultM = qnaService.qnaDetail(qnaNo);
//		if(resultM == null) {
//			response.sendRedirect("/qna/updateFail");
//			return;
//		}
//		// 제목,내용 가져오기
//		String title =request.getParameter("title");
//		String content = request.getParameter("content");
//		try {
//			int result = qnaService.updateQnA(title, content, qnaNo);
//			if (result > 0) {
//	            response.sendRedirect("/qna/detail?qna_no=" + qnaNo);
//	        } else {
//	            response.sendRedirect("/qna/updateFail");
//	        }
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//			
//		RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userqna/qnaupdate.jsp");
//		view.forward(request, response);
//	}
		 // GET 요청은 필요 없으므로 doPost로 포워딩
        doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");

	        String qnaNoStr = request.getParameter("qna_no");
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");
	        
	        //필수매개변수 검증 잘넘어왔는지, null값이나 비어있던지 
	        if (qnaNoStr == null || qnaNoStr.isEmpty() || title == null || content == null) {
	            response.sendRedirect(request.getContextPath() + "/qna/updateFail"); // 필수 매개 변수 누락 시 실패 페이지로 리다이렉트
	            return;
	            
	        }

	        int qnaNo = 0;
	        try {
	            qnaNo = Integer.parseInt(qnaNoStr);
	        } catch (NumberFormatException e) {
	            response.sendRedirect(request.getContextPath() + "/qna/updateFail"); // qna_no가 유효하지 않은 경우 실패 페이지로 리다이렉트
	            return;
	        }
	        // qna서비스를 통해서 데이터베이스랑 접촉
	        QnAService qnaService = new QnAService();
	        try {
	            int result = qnaService.updateQnA(title, content, qnaNo);

	            if (result > 0) {
	                response.sendRedirect(request.getContextPath() + "/qna/detail?qna_no=" + qnaNo); // update 성공 시 상세 페이지로 리다이렉트
	            } else {
	                response.sendRedirect(request.getContextPath() + "/qna/updateFail"); // update 실패 시
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect(request.getContextPath() + "/qna/updateFail"); // 예외 발생 시 실패 페이지로 리다이렉트
	        }
	    }
		
	
	}



