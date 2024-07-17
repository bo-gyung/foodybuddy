package com.foodybuddy.foody.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.foody.service.FoodyService;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.foodycomment.service.FcommentService;
import com.foodybuddy.foodycomment.vo.Comment;

@WebServlet("/foody/view")
public class FoodyViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String foody_no = request.getParameter("foody_no");
        
        Foody foody = new Foody();
        foody.setFoody_no(Integer.parseInt(foody_no));
        
        
        FoodyService foodyService = new FoodyService();
        List<Foody> foodyList = foodyService.viewFoody(Integer.parseInt(foody_no));
        
        FcommentService commentService = new FcommentService();
        List<Comment> commentList = commentService.getCommentsByFoodyNo(Integer.parseInt(foody_no));
        
        request.setAttribute("foodyList", foodyList);
        request.setAttribute("commentList", commentList);
        RequestDispatcher rd = request.getRequestDispatcher("/views/foody/view.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
