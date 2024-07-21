package com.foodybuddy.userpage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/pageList")
public class UserpageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserpageListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이동할 페이지 이름 받아오기
		String menu = request.getParameter("menu");
		
		
		
		// 목록으로 진입-> 타이틀 null , 검색으로 진입 -> 검색어가 타이틀로
		String title = request.getParameter("board_title");
		
		// 검색 조건의 역할을 할 보드 객체 생성
//		Board option = new Board();
//		option.setBoard_title(title);
//		
//		String nowPage = request.getParameter("nowPage");
//		if(nowPage!=null) {
//			option.setNowPage(Integer.parseInt(nowPage));
//		}
		// 전체 목록 개수를 조회 -> 페이징 바 구성
		// 보드가 페이징을 상속받았기 때문에 요렇게 쓸 수 있다!
		// option.setTotalData(new BoardService().selectBoardCount(option));
		
		// 목록 구성
		// List<Board> list = new BoardService().selectBoardList(option);
		
		// 페이징 값 추가
		// request.setAttribute("paging", option);
		// request.setAttribute("resultList", list);
		
		// 페이지 이동
		String url = "/views/userpage/"+menu+".jsp";
		RequestDispatcher view = request.getRequestDispatcher(url);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
