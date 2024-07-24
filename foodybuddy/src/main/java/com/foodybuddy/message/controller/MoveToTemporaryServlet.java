package com.foodybuddy.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.message.service.MessageService;
import com.foodybuddy.user.vo.User;


@WebServlet("/MoveToTemporaryServlet")
public class MoveToTemporaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MoveToTemporaryServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] messageIds = request.getParameterValues("messageIds");
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		int logId = u.getUser_no();
		
		if (messageIds != null && messageIds.length > 0) {
			List<Integer> messageIdList = new ArrayList<>();
			for (String id : messageIds) {
				try {
					messageIdList.add(Integer.parseInt(id));
				} catch (NumberFormatException e) {
					// 로그 또는 예외 처리
					e.printStackTrace();
				}
			}
			
			// MessageService를 사용하여 메시지 상태를 임시로 변경합니다.
			MessageService messageService = new MessageService();
			boolean success = messageService.moveMessages(messageIdList,logId);
			RequestDispatcher view = request.getRequestDispatcher("/views/message/sent.jsp");
			view.forward(request, response);
			
		} 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
	        doGet(request, response);

	            
	            
	}

}
