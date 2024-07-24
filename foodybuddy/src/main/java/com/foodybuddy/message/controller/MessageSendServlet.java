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
		
		
		if (result) {
		out.println("<html><head>");
		out.println("<style>");
		out.println("body {");
		out.println("    font-family: Arial, sans-serif;");
		out.println("    background-color: #f4f4f4;");
		out.println("    display: flex;");
		out.println("    justify-content: center;");
		out.println("    align-items: center;");
		out.println("    height: 100vh;");
		out.println("    margin: 0;");
		out.println("}");
		out.println(".modal-container {");
		out.println("    background: #fff;");
		out.println("    padding: 20px;");
		out.println("    border-radius: 8px;");
		out.println("    box-shadow: 0 0 10px rgba(0,0,0,0.1);");
		out.println("    text-align: center;");
		out.println("}");
		out.println("h1 {");
		out.println("    color: #333;");
		out.println("}");
		out.println(".close-btn {");
		out.println("    background-color: #FEA116;");
		out.println("    color: white;");
		out.println("    border: none;");
		out.println("    padding: 10px 20px;");
		out.println("    border-radius: 5px;");
		out.println("    cursor: pointer;");
		out.println("    font-size: 16px;");
		out.println("    margin-top: 20px;");
		out.println("}");
		out.println(".close-btn:hover {");
		out.println("    background-color: darkorange;");
		out.println("}");
		out.println("</style>");
		out.println("</head><body>");
		out.println("<div class='modal-container'>");
			out.println("<h1>쪽지가 성공적으로 전송되었습니다.</h1>");
			out.println("<button class='close-btn' onclick='window.close()'>닫기</button>");
			out.println("</div>");
			out.println("</body></html>");
		} else {
			out.println("<h1>쪽지 전송에 실패했습니다.</h1>");
		}
		
			
	    
		 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
