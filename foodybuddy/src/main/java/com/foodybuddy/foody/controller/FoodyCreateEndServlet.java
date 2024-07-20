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

@WebServlet("/board/createEnd")
public class FoodyCreateEndServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FoodyCreateEndServlet() {
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

            String title = mr.getParameter("foody_title");
            String name = mr.getParameter("foody_name");
            int tasteInt = Integer.parseInt(mr.getParameter("foody_taste"));
            int cleanInt = Integer.parseInt(mr.getParameter("foody_clean"));
            String parking = mr.getParameter("foody_parking");
            String delivery = mr.getParameter("foody_delivery");
            String main = mr.getParameter("foody_main");
            String address = mr.getParameter("foody_address");

            Foody f = new Foody();
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

            int result = new FoodyService().createBoard(f);
            int findKey = new FoodyService().findKey(f);
            
            if (result > 0) {
                System.out.println("게시글 등록에 성공 key 찾을 예정");
                System.out.println("key 확인 완료");
                System.out.println("파일 등록 시작");

                boolean mainPic = true;
                for (int i = 1; i <= 5; i++) {
                    String paramName = "foody_picture" + i;
                    String oriName = mr.getOriginalFileName(paramName);
                    String reName = mr.getFilesystemName(paramName);
                    if (reName != null) {
                        System.out.println("파일 이름: " + reName + ", 원본 이름: " + oriName);
                        int success = new FoodyService().insertPic(findKey, reName, mainPic);
                        if (success > 0) {
                            System.out.println("파일 등록 성공: " + reName);
                        } else {
                            System.out.println("파일 등록 실패: " + reName);
                        }
                        mainPic = false;
                    }
                }
            }

            RequestDispatcher view = request.getRequestDispatcher("/views/foody/create_fail.jsp");
            if (result > 0) {
                view = request.getRequestDispatcher("/views/foody/create_success.jsp");
            }
            view.forward(request, response);

        } else {
            response.sendRedirect("/foody/create");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
