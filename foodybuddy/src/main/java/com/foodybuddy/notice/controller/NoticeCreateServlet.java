package com.foodybuddy.notice.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.foodybuddy.notice.service.NoticeService;
import com.foodybuddy.notice.vo.Notice;

@WebServlet("/notices/create")
public class NoticeCreateServlet extends HttpServlet {
    private NoticeService noticeService = new NoticeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/notice/noticeForm.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("notice_title");
        String content = request.getParameter("notice_content");
        
        // 현재 시간 설정
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String date = now.format(formatter);

        // 조회수는 0으로 설정
        int viewCount = 0;

        Notice notice = new Notice(0, title, content, date, viewCount);
        noticeService.saveNotice(notice);
        response.sendRedirect("/notices");
    }
}
