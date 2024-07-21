package com.foodybuddy.user_manage.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.foodybuddy.user_manage.service.UserService;
import com.foodybuddy.user_manage.vo.User;

@WebServlet("/user/list")
public class UserListServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<User> userList;
        if (search != null && !search.trim().isEmpty()) {
            userList = userService.getUsersByName(search);
        } else {
            userList = userService.getAllUsers();
        }
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/views/user_manage/userList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
