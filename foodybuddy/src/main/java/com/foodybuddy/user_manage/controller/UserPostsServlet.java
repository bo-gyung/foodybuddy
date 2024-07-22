package com.foodybuddy.user_manage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.user_manage.service.UserService;
import com.foodybuddy.user_manage.vo.BuddyPost;
import com.foodybuddy.user_manage.vo.FoodyPost;

@WebServlet("/user/posts")
public class UserPostsServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userNo = Integer.parseInt(request.getParameter("user_no"));
        List<FoodyPost> foodyPosts = userService.getFoodyPostsByUser(userNo);
        List<BuddyPost> buddyPosts = userService.getBuddyPostsByUser(userNo);
        request.setAttribute("foodyPosts", foodyPosts);
        request.setAttribute("buddyPosts", buddyPosts);
        request.getRequestDispatcher("/views/user_manage/userPosts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
