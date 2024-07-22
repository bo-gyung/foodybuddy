package com.foodybuddy.user_manage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.common.Paging;
import com.foodybuddy.user_manage.service.UserService;
import com.foodybuddy.user_manage.vo.User;

@WebServlet("/user/list")
public class UserListServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentPage = 1;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }
        int numPerPage = 10;

        int totalData = userService.getTotalUserCount();
        Paging paging = new Paging();
        paging.setTotalData(totalData);
        paging.setNowPage(currentPage);
        paging.setNumPerPage(numPerPage);
        paging.calcPaging();

        List<User> userList = userService.getUsers(currentPage, numPerPage);
        request.setAttribute("userList", userList);
        request.setAttribute("paging", paging);

        request.getRequestDispatcher("/views/user_manage/userList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
