package com.foodybuddy.foody.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/foody/view")
public class FoodyViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 필요한 데이터 로직 구현
        // 예를 들어, foody_no를 request.getParameter("foody_no")로 받아와서 데이터를 조회할 수 있도록 설정
        
        // 예시로 foody_no를 받아서 view.jsp로 전달
        String foody_no = request.getParameter("foody_no");
        request.setAttribute("foody_no", foody_no);
        
        RequestDispatcher rd = request.getRequestDispatcher("/foody/view?foody_no=<%= list.get(i).getFoody_no() %>");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
