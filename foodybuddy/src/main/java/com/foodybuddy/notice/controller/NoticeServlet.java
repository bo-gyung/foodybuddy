package com.foodybuddy.notice.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.notice.service.NoticeService;
import com.foodybuddy.notice.vo.Notice;

@WebServlet("/Notice/notices")
public class NoticeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private NoticeService noticeService = new NoticeService();

    public NoticeServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 request.setCharacterEncoding("UTF-8");
    	    response.setContentType("text/html; charset=UTF-8");
    	    response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        try {
            if (action == null) {
                listNotices(request, response);
            } else {
                switch (action) {
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteNotice(request, response);
                        break;
                    case "create":
                        showCreateForm(request, response);
                        break;
                    case "update":
                        updateNotice(request, response);
                        break;
                    case "insert":
                        createNotice(request, response);
                        break;
                    default:
                        listNotices(request, response);
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void listNotices(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Notice> notices = noticeService.getAllNotices();
        request.setAttribute("notices", notices);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/notice/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                Notice notice = noticeService.getNoticeById(id);
                if (notice != null) {
                    request.setAttribute("notice", notice);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/notice/editForm.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Notice not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid notice ID");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid notice ID");
        }
    }

    private void deleteNotice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                noticeService.deleteNotice(id);
                response.sendRedirect(request.getContextPath() + "/Notice/notices");
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid notice ID");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid notice ID");
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/notice/createForm.jsp");
        dispatcher.forward(request, response);
    }

    private void createNotice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Notice notice = new Notice();
        notice.setNotice_title(request.getParameter("title"));
        notice.setNotice_content(request.getParameter("content"));
        notice.setNotice_date(request.getParameter("date"));
        notice.setNotice_view_count(0);
        noticeService.createNotice(notice);
        response.sendRedirect(request.getContextPath() + "/Notice/notices"); // 목록 페이지로 리다이렉트
    }

    private void updateNotice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                Notice notice = noticeService.getNoticeById(id);
                if (notice != null) {
                    notice.setNotice_title(request.getParameter("title"));
                    notice.setNotice_content(request.getParameter("content"));
                    notice.setNotice_date(request.getParameter("date"));
                    noticeService.updateNotice(id, notice);
                    response.sendRedirect(request.getContextPath() + "/Notice/notices"); // 목록 페이지로 리다이렉트
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Notice not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid notice ID");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid notice ID");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
