package com.foodybuddy.notice.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.foodybuddy.notice.service.NoticeService;
import com.foodybuddy.notice.vo.Notice;

@WebServlet("/notices/detail")
public class NoticeDetailServlet extends HttpServlet {
    private NoticeService noticeService = new NoticeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noticeId = Integer.parseInt(request.getParameter("id"));
        Notice notice = noticeService.getNoticeById(noticeId);

        if (notice != null) {
            request.setAttribute("notice", notice);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/notice/noticeDetail.jsp");
            dispatcher.forward(request, response);
        } else {
            // Handle case where notice with given id is not found
            response.sendRedirect("/notices"); // Redirect to notice list page
        }
    }
}
