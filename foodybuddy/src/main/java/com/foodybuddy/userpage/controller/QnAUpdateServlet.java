package com.foodybuddy.userpage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.userpage.service.QnAService;
import com.foodybuddy.userpage.vo.QnA;

@WebServlet("/qna/update")
public class QnAUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public QnAUpdateServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글번호를 입력받아왔어.
		 String qnaNoStr = request.getParameter("qna_no");
		 int qnaNo;
		 // 왜 아직도 null이지
		 System.out.println("servlet (1): " + qnaNoStr);
		 
	        if (qnaNoStr == null || qnaNoStr.isEmpty()) {
	            response.sendRedirect(request.getContextPath() + "/qna/updateFail");
	            
	            System.out.println("servlet (2): " + qnaNoStr);
	            
	            return;
	            
	        }

	        try {
	            qnaNo = Integer.parseInt(qnaNoStr);
	        } catch (NumberFormatException e) {
	            response.sendRedirect(request.getContextPath() + "/qna/updateFail");
	            
	            System.out.println("servlet (3): " + qnaNoStr);
	            
	            return;
	        }

	        QnAService qnaService = new QnAService();
	        Map<String, Object> resultM = qnaService.qnaDetail(qnaNo);

	        if (resultM == null) {
	            response.sendRedirect(request.getContextPath() + "/qna/updateFail");
	            
	            System.out.println("servlet (4): " + resultM);
	            
	            return;
	        }

	        request.setAttribute("detail", resultM);

	        // 디버깅을 위해 콘솔에 출력
	        System.out.println("resultM: (5)" + resultM);

	        // 다시 돌려줘야지
	        RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userqna/qnaupdate.jsp");
	        view.forward(request, response);
	        response.sendRedirect("qna/list");
	    }
		
	
	
		  
	 
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}



