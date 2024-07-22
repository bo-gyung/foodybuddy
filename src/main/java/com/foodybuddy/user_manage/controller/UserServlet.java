package com.foodybuddy.user_manage.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.foodybuddy.user_manage.service.UserService;
import com.foodybuddy.user_manage.vo.User;

@WebServlet("/user_manage/list")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    public UserServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            listUsers(request, response);
        } else {
            switch (action) {
                case "view":
                    viewUser(request, response);
                    break;
                default:
                    listUsers(request, response);
                    break;
            }
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userService.getAllUsers();
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user_manage/list.jsp");
        dispatcher.forward(request, response);
    }

    private void viewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userNo = Integer.parseInt(request.getParameter("userNo"));
        User user = userService.getUserById(userNo);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user_manage/view.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }	
}
