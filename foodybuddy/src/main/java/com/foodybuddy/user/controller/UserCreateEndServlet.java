package com.foodybuddy.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.user.service.UserService;
import com.foodybuddy.user.vo.User;

@WebServlet(name="userCreateEnd",urlPatterns="/user/createEnd")
public class UserCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserCreateEndServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String name = request.getParameter("user_name");
		String phone = request.getParameter("user_phone");
		String postcode = request.getParameter("user_postcode");
		String addr = request.getParameter("user_addr");
		String detailAddr = request.getParameter("user_detailAddr");
		String extraAddr = request.getParameter("user_extraAddr");   
		String email = request.getParameter("user_email");
		String questionStr = request.getParameter("user_question");
		String answer = request.getParameter("user_answer");
		
		int question = Integer.parseInt(questionStr);
		User u = new User();
		u.setUser_id(id);
		u.setUser_pw(pw);
		u.setUser_name(name);
		u.setUser_phone(phone);
		u.setUser_postcode(postcode);
		u.setUser_addr(addr);
		u.setUser_detailAddr(detailAddr);
		u.setUser_extraAddr(extraAddr);
		u.setUser_email(email);
		u.setUser_question(question);
		u.setUser_answer(answer);
		
		PrintWriter out = response.getWriter();
		int result = new UserService().createUser(u); 
		//RequestDispatcher view = request.getRequestDispatcher(email)
		if(result > 0) {
			out.println("<html><body>");
			System.out.println("성공");
			response.sendRedirect("/");
		}else {
			System.out.println("실패");
			out.println("<html><body>");
            out.println("alert(회원가입에 실패하였습니다.<br>메인으로 돌아갑니다.)");
            out.println("</body></html>");
			response.sendRedirect("/");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
