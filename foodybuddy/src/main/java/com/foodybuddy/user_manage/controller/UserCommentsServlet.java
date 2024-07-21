package com.foodybuddy.user_manage.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.foodybuddy.user_manage.service.UserService;
import com.foodybuddy.user_manage.vo.Comment;

@WebServlet("/user/comments")
public class UserCommentsServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userNo = Integer.parseInt(request.getParameter("user_no"));
        List<Comment> foodyCommentList = userService.getCommentsByUser(userNo);
        List<Comment> buddyCommentList = userService.getBuddyCommentsByUser(userNo);

        request.setAttribute("foodyCommentList", foodyCommentList);
        request.setAttribute("buddyCommentList", buddyCommentList);

        request.getRequestDispatcher("/views/user_manage/userComments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
