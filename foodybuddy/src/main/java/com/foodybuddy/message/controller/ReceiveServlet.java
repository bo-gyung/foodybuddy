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

@WebServlet("/msgReceive")
public class ReceiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ReceiveServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		
		if(u == null) {
			response.sendRedirect("/user/login");
			return;
		}
		
		int receiverId = u.getUser_no();
		List<Map<String,Object>> messages2 = new MessageService().receiveMessage(receiverId); 
		
		request.setAttribute("messages2", messages2);
		RequestDispatcher view = request.getRequestDispatcher("views/message/receive.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
