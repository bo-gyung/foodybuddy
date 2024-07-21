package com.foodybuddy.buddy_manage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.buddy_manage.service.BuddyService;
import com.foodybuddy.buddy_manage.vo.BuddyPosts;

@WebServlet("/buddy_detail")
public class BuddyPostsDetailServlet extends HttpServlet {
    private BuddyService buddyService = new BuddyService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String buddyNoStr = request.getParameter("buddy_no");
        if (buddyNoStr != null) {
            int buddyNo = Integer.parseInt(buddyNoStr);
            BuddyPosts buddyPost = buddyService.getBuddyPostByNo(buddyNo);
            request.setAttribute("buddyPost", buddyPost);
            request.getRequestDispatcher("/views/buddy_manage/BuddyDetail.jsp").forward(request, response);
        }
    }
}
