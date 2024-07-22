package com.foodybuddy.message.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.message.service.MessageService;
import com.foodybuddy.user.vo.User;


@WebServlet("/message/send")
public class MessageSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MessageSendServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
        out.println("<h1>잠시만 기다려 주세요...</h1>");
        out.println("</body></html>");
		
			
	    
		 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
	
		
		int senderNo = u.getUser_no();
		String msgReceiver = request.getParameter("receiver");
		String msgTitle = request.getParameter("subject");
		String msgText = request.getParameter("message");
		
		System.out.println("Receiver: " + msgReceiver);
		System.out.println("Title: " + msgTitle);
		System.out.println("Message: " + msgText);
		
		 if (msgReceiver == null || msgReceiver.isEmpty() || msgTitle == null || msgTitle.isEmpty() || msgText == null
	                || msgText.isEmpty()) {
	            out.println("<html><body>");
	            out.println("<h1>받는 사람, 제목, 내용을 모두 입력해주세요.</h1>");
	            out.println("</body></html>");
	            return;
	        }
		boolean result = new MessageService().sendMessage(senderNo,msgReceiver,msgTitle,msgText); 
		
		
		 out.println("<html><body>");
	        if (result) {
	            out.println("<h1>쪽지가 성공적으로 전송되었습니다.</h1>");
	        } else {
	            out.println("<h1>쪽지 전송에 실패했습니다.</h1>");
	        }
	        out.println("</body></html>");
		//doGet(request, response);
	}

}
