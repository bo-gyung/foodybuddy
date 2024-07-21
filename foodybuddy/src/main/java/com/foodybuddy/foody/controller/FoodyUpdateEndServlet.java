package com.foodybuddy.foody.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.foodybuddy.foody.service.FoodyService;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.user.vo.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/foody/updateEnd")
public class FoodyUpdateEndServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FoodyUpdateEndServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (ServletFileUpload.isMultipartContent(request)) {
            HttpSession session = request.getSession(false);

            String dir = request.getServletContext().getRealPath("/upload");
            System.out.println("폴더 위치  : " + dir);
            File uploadDir = new File(dir);
            if (!uploadDir.exists()) {
                System.out.println("업로드 폴더 생성");
                uploadDir.mkdirs();
            }

            int maxSize = 1024 * 1024 * 10;
            String encoding = "UTF-8";
            DefaultFileRenamePolicy dtf = new DefaultFileRenamePolicy();
            MultipartRequest mr = new MultipartRequest(request, dir, maxSize, encoding, dtf);

            int foody_no = Integer.parseInt(mr.getParameter("foody_no"));
            String title = mr.getParameter("foody_title");
            String name = mr.getParameter("foody_name");
            int tasteInt = Integer.parseInt(mr.getParameter("foody_taste"));
            int cleanInt = Integer.parseInt(mr.getParameter("foody_clean"));
            String parking = mr.getParameter("foody_parking");
            String delivery = mr.getParameter("foody_delivery");
            String main = mr.getParameter("foody_main");
            String address = mr.getParameter("foody_address");

            Foody f = new Foody();
            f.setFoody_no(foody_no);
            f.setFoody_title(title);
            f.setFoody_name(name);
            f.setFoody_taste(tasteInt);
            f.setFoody_clean(cleanInt);
            f.setFoody_parking(parking);
            f.setFoody_delivery(delivery);
            f.setFoody_main(main);
            f.setFoody_address(address);

            if (session != null) {
                User u = (User) session.getAttribute("user");
                int user_No = u.getUser_no();
                f.setUser_no(user_No);
            } else {
                System.out.println("사용자 세션 문제발생");
            }

            int result = new FoodyService().updateBoard(f);

            RequestDispatcher view = request.getRequestDispatcher("/views/foody/update_fail.jsp");
            if (result > 0) {
                view = request.getRequestDispatcher("/views/foody/update_success.jsp");
            }
            view.forward(request, response);

        } else {
            response.sendRedirect("/foody/update");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
