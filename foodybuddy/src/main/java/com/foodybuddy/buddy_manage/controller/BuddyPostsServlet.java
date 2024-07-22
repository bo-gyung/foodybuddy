package com.foodybuddy.buddy_manage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.buddy_manage.service.BuddyService;
import com.foodybuddy.buddy_manage.vo.BuddyPosts;

@WebServlet("/buddy_list")
public class BuddyPostsServlet extends HttpServlet {
    private BuddyService buddyService = new BuddyService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BuddyPosts> pendingBuddyPosts = buddyService.getBuddyPosts("N");
        List<BuddyPosts> approvedBuddyPosts = buddyService.getBuddyPosts("Y");

        request.setAttribute("pendingBuddyPosts", pendingBuddyPosts);
        request.setAttribute("approvedBuddyPosts", approvedBuddyPosts);

        request.getRequestDispatcher("/views/buddy_manage/BuddyList.jsp").forward(request, response);
    }
}
