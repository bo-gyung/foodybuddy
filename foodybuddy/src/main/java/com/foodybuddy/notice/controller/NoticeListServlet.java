package com.foodybuddy.notice.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.foodybuddy.notice.service.NoticeService;
import com.foodybuddy.notice.vo.Notice;
import java.util.List;

@WebServlet("/notices")
public class NoticeListServlet extends HttpServlet {
    private NoticeService noticeService = new NoticeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Notice> notices = noticeService.getAllNotices();
        request.setAttribute("notices", notices);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/notice/noticeList.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
