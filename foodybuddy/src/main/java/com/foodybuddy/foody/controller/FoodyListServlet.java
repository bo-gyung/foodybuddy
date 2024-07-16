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
import com.foodybuddy.common.sql.Paging;


@WebServlet("/board/foody")
public class FoodyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FoodyListServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String title = request.getParameter("Foody_title");
////		검색조건의 역할을 한다.
//		Foody option = new Foody();
//		option.setFoody_title(title);
//		
//		String nowPage = request.getParameter("nowPage");
//		if(nowPage != null) {
//			option.setNowPage(Integer.parseInt(nowPage));
//		}
////		전체 목록 개수 - > 페이징바 구성
//		option.setTotalData(new FoodyService().selectBoardCount(option));
//		
//		List<Foody> list = new FoodyService().selectBoardList(option);
//		
//		request.setAttribute("paging", option);
//		request.setAttribute("resultList",list);
		RequestDispatcher view = request.getRequestDispatcher("/views/foody/foodlist.jsp");
		
		view.forward(request, response);
//		/views/board/list.jsp
//		css 추가
//		화면이동 작성
//		화면이동할때 속성값 전달
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}