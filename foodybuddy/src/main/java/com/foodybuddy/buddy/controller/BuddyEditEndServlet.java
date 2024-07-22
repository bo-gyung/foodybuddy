package com.foodybuddy.buddy.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.buddy.service.BuddyService;
import com.foodybuddy.buddy.vo.Buddy;

@WebServlet("/board/buddy/editEnd")
public class BuddyEditEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BuddyEditEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/views/include/create_fail.jsp");
		String url = "/board/buddy";

		int foody_no = Integer.parseInt(request.getParameter("foody_no"));
		int buddy_no = Integer.parseInt(request.getParameter("buddy_no"));
		String buddy_title = request.getParameter("buddy_title");
		String buddy_main = request.getParameter("buddy_main");
		String party_name = request.getParameter("party_name");
		String meet_date_str = request.getParameter("meet_date");
		int party_number = Integer.parseInt(request.getParameter("party_number"));
		
		
		// 날짜 형식 변환
		if (meet_date_str != null && !meet_date_str.isEmpty()) {
			// DateTimeFormatter를 사용하여 문자열을 LocalDateTime으로 변환합니다.
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm[:ss]");
			LocalDateTime meet_date = LocalDateTime.parse(meet_date_str, formatter);
			
			Buddy b = new Buddy();
			b.setFoody_no(foody_no);
			b.setBuddy_no(buddy_no);
			b.setBuddy_title(buddy_title);
			b.setBuddy_main(buddy_main);
			b.setParty_name(party_name);
			b.setMeet_date(meet_date);
			b.setParty_number(party_number);
			
			int result = new BuddyService().editBuddy(b);
			if(result>0) {
				// 작성 성공
				System.out.println("최종 성공");
				// 성공 페이지 연결
				view = request.getRequestDispatcher("/views/include/create_success.jsp");
				// 성공 페이지에서 모임 게시판으로 돌아갈 수 있는 url 부여
				request.setAttribute("servletUrl", url);
				
			}else {
				// 작성 실패
				System.out.println("DB 입력 실패");
				// 실패 페이지 연결
				view = request.getRequestDispatcher("/views/include/create_fail.jsp");
				// 실패 페이지에서 모임 게시판으로 돌아갈 수 있는 url 부여
				request.setAttribute("servletUrl", url);
			}
			
		} else {
			// 날짜 형식 오류
			System.out.println("meet_date 파라미터가 없습니다.");
			// 실패 페이지 연결
			view = request.getRequestDispatcher("/views/include/create_fail.jsp");
			// 실패 페이지에서 모임 게시판으로 돌아갈 수 있는 url 부여
			request.setAttribute("servletUrl", url);
		}
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
