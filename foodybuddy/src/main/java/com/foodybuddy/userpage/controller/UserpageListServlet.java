package com.foodybuddy.userpage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.buddy.vo.Buddy;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.user.vo.User;
import com.foodybuddy.userpage.service.UserPageService;

@WebServlet("/user/pageList")
public class UserpageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserpageListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 이동할 페이지 이름 받아오기
		String menu = request.getParameter("menu");
		// 세션 받아오기
		HttpSession session = request.getSession(false);
		User u = (User)session.getAttribute("user");
		int user_no = u.getUser_no();
		
//		String nowPage = request.getParameter("nowPage");
//		if(nowPage!=null) {
//			option.setNowPage(Integer.parseInt(nowPage));
//		}
		// 전체 목록 개수를 조회 -> 페이징 바 구성
		// 보드가 페이징을 상속받았기 때문에 요렇게 쓸 수 있다!
		// option.setTotalData(new BoardService().selectBoardCount(option));
		
		// 목록 구성
		// List<Board> list = new BoardService().selectBoardList(option);
		if("user_create_views".equals(menu)) {
			// menu가 create라면 내 작성글 조회
			List<Buddy> my_buddy_list = new UserPageService().selectBuddyList(user_no);
			List<Foody> my_foody_list = new UserPageService().selectFoodyList(user_no);
			request.setAttribute("buddy_list", my_buddy_list);
			request.setAttribute("foody_list", my_foody_list);
			System.out.println("서블렛 : "+my_buddy_list);
			System.out.println("서블렛 : "+my_foody_list);
		} else if("user_like_views".equals(menu)) {
			// like라면 내 좋아요 조회
			
			
		} else if("user_group_views".equals(menu)) {
			// group라면 내 모임 조회
			
			
		}else{
			// 기타 다른 방법으로 접근
			
		}
		
		
		
//		
		
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
