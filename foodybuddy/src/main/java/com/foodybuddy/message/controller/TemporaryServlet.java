package com.foodybuddy.message.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.message.service.MessageService;
import com.foodybuddy.user.vo.User;

@WebServlet("/msgTemp")
public class TemporaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public TemporaryServlet() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		
		int logId = u.getUser_no();
		List<Map<String,Object>> messages = new MessageService().tempMessage(logId); 
		
		request.setAttribute("messages", messages);
		RequestDispatcher view = request.getRequestDispatcher("views/message/temporary.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
