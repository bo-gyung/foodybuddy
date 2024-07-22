package com.foodybuddy.userpage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.user.vo.User;
import com.foodybuddy.userpage.service.QnAService;
import com.foodybuddy.userpage.vo.QnA;



@WebServlet("/qna/createEnd")
public class QnACreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    
    public QnACreateEndServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//객체생성 vo.qna꺼 가져온거
		QnA q = new QnA();
		
		//세션 넣기
		 HttpSession session = request.getSession(false);
	        if (session != null) {
	            User u = (User) session.getAttribute("user");
	            if (u != null) {
	                int userNo = u.getUser_no();
	                q.setUser_no(userNo);
	            } else {
	                // 사용자 정보가 없는 경우 로그인 페이지로 리다이렉트
	                response.sendRedirect("/login");
	                return;
	            }
	        } else {
	            // 세션이 없는 경우 로그인 페이지로 리다이렉트
	            response.sendRedirect("/login");
	            return;
	        }
			// 제목이랑 내용 요청받은거 가져오기
	        String title = request.getParameter("qna_title");
	        String content = request.getParameter("qna_content");
	        q.setQna_title(title);
	        q.setQna_content(content);
	        
	        
	        int result = new QnAService().createQnA(q);
	        // 결과 값에 따라 성공화면/ 실패화면 보내주기
			RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userqna/qnacreate_fail.jsp");
			if(result > 0) {
				
				view = request.getRequestDispatcher("/views/userpage/userqna/qnacreate_success.jsp");
			}
			view.forward(request, response);
	}
		



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
