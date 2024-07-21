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
        // 글번호를 입력받아옴
        String qnaNoStr = request.getParameter("qna_no");
        String qnaTitle = request.getParameter("qna_title");
        String qnaContent = request.getParameter("qna_content");
        int qnaNo;

        try {
            if (qnaNoStr != null && !qnaNoStr.isEmpty() && qnaTitle != null && !qnaTitle.isEmpty() && qnaContent != null && !qnaContent.isEmpty()) {
                // 글번호와 수정된 내용을 가져와서 업데이트
                qnaNo = Integer.parseInt(qnaNoStr);
                QnAService qnaService = new QnAService();
                int result = qnaService.updateQnA(qnaTitle, qnaContent, qnaNo);

                if (result > 0) {
                    response.getWriter().write("수정 성공");
                    // 수정 성공하면 목록으로 이동
                    response.sendRedirect("/qna/list");
                } else {
                    response.getWriter().write("수정 실패");
                }
            } else if (qnaNoStr != null && !qnaNoStr.isEmpty()) {
                // 글번호로 기존 데이터를 가져옴
                qnaNo = Integer.parseInt(qnaNoStr);
                QnAService qnaService = new QnAService();
                Map<String, Object> resultM = qnaService.qnaDetail(qnaNo);

                if (resultM == null) {
                    response.sendRedirect(request.getContextPath() + "/qna/updateFail");
                    return;
                }

                request.setAttribute("detail", resultM);
                RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userqna/qnaupdate.jsp");
                view.forward(request, response);
                
            } else {
                response.sendRedirect(request.getContextPath() + "/qna/updateFail");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/qna/updateFail");
        }
    }
		
	
	
		  
	 
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}
}



