package com.foodybuddy.buddy_manage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.buddy_manage.service.BuddyService;

@WebServlet("/buddy_approve")
public class ApproveBuddyServlet extends HttpServlet {
    private BuddyService buddyService = new BuddyService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int buddyNo = Integer.parseInt(request.getParameter("buddy_no"));
        boolean result = buddyService.approveBuddyPost(buddyNo);

        if (result) {
            response.sendRedirect("/buddy_list");  // 승인 후 대기리스트로 리다이렉트
        } else {
            response.getWriter().write("승인 실패");
        }
    }
}
