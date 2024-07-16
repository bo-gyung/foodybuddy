package com.foodybuddy.foody.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.foodybuddy.foody.service.FoodyService;
import com.foodybuddy.foody.vo.Foody;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/board/createEnd")
public class FoodyCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FoodyCreateEndServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			String uploadPath = request.getServletContext().getRealPath("/upload");
//			String dir = request.getServletContext().getRealPath("/upload");
			int maxSize = 1024 * 1024 * 10;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy dtf = new DefaultFileRenamePolicy();
			MultipartRequest mr = new MultipartRequest(request,uploadPath,maxSize,encoding,dtf);
			
			String oriName = mr.getParameter("foddy_picture");
			String reName = mr.getFilesystemName("foody_picture");
			
			String title = mr.getParameter("foody_title");
			String store = mr.getParameter("foody_store");
			String taste = mr.getParameter("foody_taste");
			int tasteInt = Integer.parseInt(taste);
			String clean = mr.getParameter("foody_clean");
			int cleanInt = Integer.parseInt(clean);
			LocalDateTime submitTime = LocalDateTime.now();
			
//			선택사항
			String parking = mr.getParameter("foody_parking");
			String delivery = mr.getParameter("foody_delivery");
			
//			상세설명
			String content = mr.getParameter("foody_content");
			String address = mr.getParameter("foody_address");
			
			Foody f = new Foody();
			f.setFoody_title(title);
			f.setFoody_name(store);
			f.setFoody_taste(tasteInt);
			f.setFoody_clean(cleanInt);
			f.setReg_date(submitTime);
			f.setFoody_parking(parking);
			f.setFoody_delivery(delivery);
			f.setFoody_content(content);
			f.setFoody_address(address);

			
			//			계정 연동시 작성
//			HttpSession session = request.getSession(false);
//			if(session != null) {
//				User u = (User)session.getAttribute("user");
//				int user_No = u.getUser_no();
//				b.set_writer(user_No);
//			}
			
			f.setOri_picture(oriName);
			f.setNew_picture(reName);
			
			
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			int result = new FoodyService().createBoard(f);
			RequestDispatcher view = request.getRequestDispatcher("/views/foody/create_fail.jsp");
			if(result > 0) {
				view = request.getRequestDispatcher("/views/foody/create_success.jsp");
			}
			view.forward(request, response);
			
		}else {
			response.sendRedirect("/foody/create");
		}
		
	}

	



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
