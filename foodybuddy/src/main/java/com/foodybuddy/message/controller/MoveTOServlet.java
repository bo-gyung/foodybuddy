package com.foodybuddy.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.message.service.MessageService;

@WebServlet("/MoveServlet")
public class MoveTOServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MoveTOServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] messageIds = request.getParameterValues("messageIds");
		if (messageIds != null && messageIds.length > 0) {
            List<Map<String, Object>> messages = new ArrayList<>();
            MessageService messageService = new MessageService();
            for (String id : messageIds) {
                int messageId = Integer.parseInt(id);
                Map<String, Object> message = (Map<String, Object>) messageService.getMessageById(messageId);
                if (message != null) {
                    messages.add(message);
                }
            }
            // 메시지를 임시 보관함으로 이동시킵니다.
            messageService.moveMessages(messages);

            // 메시지 이동 후 목록 페이지로 리다이렉션합니다.
            response.sendRedirect("views/message/sent.jsp");
        } else {
            response.getWriter().println("No messages selected.");
        }
	}

}
