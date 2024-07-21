package com.foodybuddy.buddy_manage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.buddy_manage.service.BuddyService;

@WebServlet("/buddy_reject")
public class RejectBuddyServlet extends HttpServlet {
    private BuddyService buddyService = new BuddyService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");  // 요청 인코딩 설정
        response.setContentType("text/html;charset=UTF-8");  // 응답 인코딩 설정

        int buddyNo = Integer.parseInt(request.getParameter("buddy_no"));
        boolean result = buddyService.rejectBuddyPost(buddyNo);

        if (result) {
            response.sendRedirect(request.getContextPath() + "/buddy_list");  // 반려 후 목록 페이지로 리다이렉트
        } else {
            response.getWriter().write("<html><body><h2>반려 실패</h2></body></html>");
        }
    }
}
