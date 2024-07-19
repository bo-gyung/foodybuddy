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


@WebServlet("/board/foody")
public class FoodyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodyListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("board_title");
		
		String searchOption = request.getParameter("searchOption");
		String searchBar = request.getParameter("searchbar");
		String sort = request.getParameter("sort");
		
		Foody option = new Foody();
		option.setSearchOption(searchOption);
		option.setSearchBar(searchBar);
		option.setFoody_title(title);
		option.setSort(sort);

		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		// 전체 목록 개수 -> 페이징바 구성
		option.setTotalData(new FoodyService().selectBoardCount(option));
		List<Foody> list = new FoodyService().selectBoardList(option);
		
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);
		RequestDispatcher rd=request.getRequestDispatcher("/views/foody/foodlist.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
