package com.foodybuddy.userpage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.userpage.service.UserPageService;


@WebServlet("/user/delete")
public class UserPageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UserPageDeleteServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 // 입력된 비밀번호 가져오기
        String password = request.getParameter("user_pw");
        
        // 사용자 세션에서 사용자 ID 가져오기 (로그인된 사용자 ID)
        String userId = (String) request.getSession().getAttribute("user_id");
        
        if (userId == null) {
            // 사용자 ID가 세션에 없으면 로그인 페이지로 리다이렉트
            response.sendRedirect("/user/login");
            return;
        }
        
        // 사용자 비밀번호 확인
        UserPageService userService = new UserPageService();
        boolean isPasswordCorrect = userService.checkPassword(userId, password);
        
        if (isPasswordCorrect) {
            // 비밀번호가 올바른 경우 회원 정보 삭제
            boolean isDeleted = userService.deleteUser(userId);
            
            if (isDeleted) {
                // 회원 탈퇴 성공, 세션 무효화 후 리다이렉트
                request.getSession().invalidate();
                response.sendRedirect("/goodbye");
            } else {
                // 회원 탈퇴 실패 시 에러 페이지로 리다이렉트
                response.sendRedirect("/error?message=회원탈퇴에 실패했습니다.");
            }
        } else {
            // 비밀번호가 올바르지 않은 경우 에러 페이지로 리다이렉트
            response.sendRedirect("/error?message=비밀번호가 올바르지 않습니다.");
        }
    }

	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
