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
import javax.servlet.http.HttpSession;

import com.foodybuddy.message.service.MessageService;
import com.foodybuddy.user.vo.User;


@WebServlet("/MoveToDeleteServlet")
public class MoveToDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MoveToDeleteServlet() {
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

            MessageService messageService = new MessageService();
            boolean success = messageService.moveToTrash(messageIdList, logId);
            
            // 휴지통으로 이동된 메시지 목록 가져오기
            List<Map<String, Object>> trashedMessages = messageService.getTrashedMessages(logId);
            request.setAttribute("messages", trashedMessages);

            RequestDispatcher view = request.getRequestDispatcher("/views/message/temporary.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect("/errorPage.jsp");
        }
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
