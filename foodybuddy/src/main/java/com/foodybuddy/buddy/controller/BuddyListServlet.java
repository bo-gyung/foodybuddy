package com.foodybuddy.buddy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.buddy.service.BuddyService;
import com.foodybuddy.buddy.vo.Buddy;
import com.foodybuddy.user.vo.User;

@WebServlet("/board/buddy")
public class BuddyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BuddyListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Buddy keyword = new Buddy();
		
		// 검색 및 목록출력
		String search_option = request.getParameter("searchOption");
		String search_keyword = request.getParameter("searchKeyword");
		System.out.println(search_keyword);
		keyword.setSearch_option(search_option);
		keyword.setSearch_keyword(search_keyword);
		
		// 정렬옵션
		String sortValue = request.getParameter("sort");
		System.out.println(sortValue);
		if(sortValue=="" || sortValue==null || "1".equals(sortValue)) {
			keyword.setSort(1);
		} else {
			if("2".equals(sortValue)) {
				keyword.setSort(2);
			} else if("3".equals(sortValue)) {
				keyword.setSort(3);
			}
		}
		
		// 페이징 관련
		String nowPage = request.getParameter("nowPage");
		if(nowPage!=null) {
			keyword.setNowPage(Integer.parseInt(nowPage));
		}
		
		// 전체 목록 개수를 조회 -> 페이징 바 구성
		keyword.setTotalData(new BuddyService().selectBuddyCount(keyword));
		
		// 목록 구성(서비스 호출)
		List<Buddy> list = new BuddyService().selectBuddyList(keyword);
		
		// 페이징 정보와 게시글 리스트를 setAttribute
		request.setAttribute("paging", keyword);
		request.setAttribute("resultList", list);
		
		// 등급 별 접근 제어를 위한 작업 (세션 가져오기)
		HttpSession session = request.getSession(false);
		try {
			if(session!=null) {
				User u = (User)session.getAttribute("user");
				if(u.getGrade_no() < 2) {
					// 준회원 열람불가
					RequestDispatcher view = request.getRequestDispatcher("/views/include/limit_regular.jsp");
					view.forward(request, response);
				}else {
					// 연결
					RequestDispatcher view = request.getRequestDispatcher("/views/buddy/buddy_list.jsp");
					view.forward(request, response);
				}
			}
		} catch(NullPointerException e) {
			// 비회원 열람불가
			RequestDispatcher view = request.getRequestDispatcher("/views/include/limit_user.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
