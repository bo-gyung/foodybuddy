package com.foodybuddy.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.notice.service.NoticeService;

@WebServlet("/notices/delete")
public class NoticeDeleteServlet extends HttpServlet {
    private NoticeService noticeService = new NoticeService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noticeId = Integer.parseInt(request.getParameter("notice_id"));
        
        boolean success = noticeService.deleteNotice(noticeId);
        
        if (success) {
            response.sendRedirect("/notices");
        } else {
            // Handle case where deletion fails
            response.sendRedirect("/notices/detail?id=" + noticeId);
        }
    }
}