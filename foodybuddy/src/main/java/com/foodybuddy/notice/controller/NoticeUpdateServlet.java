package com.foodybuddy.notice.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.notice.service.NoticeService;
import com.foodybuddy.notice.vo.Notice;

@WebServlet("/notices/update")
public class NoticeUpdateServlet extends HttpServlet {
    private NoticeService noticeService = new NoticeService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noticeId = Integer.parseInt(request.getParameter("notice_id"));
        String title = request.getParameter("notice_title");
        String content = request.getParameter("notice_content");
        String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        int viewCount = 0;

        Notice notice = new Notice(noticeId, title, content, date, viewCount);
        noticeService.updateNotice(notice);

        response.sendRedirect(request.getContextPath() + "/notices");
    }
}
