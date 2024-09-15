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
import javax.servlet.http.HttpSession;

import com.foodybuddy.buddy.service.PartyMemberService;
import com.foodybuddy.buddy.vo.PartyMember;
import com.foodybuddy.user.vo.User;

@WebServlet("/group/createEnd")
public class GroupCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GroupCreateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 기본결과 세팅
		RequestDispatcher view = request.getRequestDispatcher("/views/include/create_fail.jsp");
		
		// 로그인이 유지된 상태라면 그룹생성
		HttpSession session = request.getSession(false);
		if (session != null) {
			// 세션있음
			
			User u = (User) session.getAttribute("user");
			
			int buddy_no = Integer.parseInt(request.getParameter("buddy_no"));
			
			String jsonTimestamp = request.getParameter("meet_date");
			if (jsonTimestamp.length() == 16) {  // "yyyy-MM-ddTHH:mm" 길이
	            jsonTimestamp += ":00";  // 초 단위 추가
	        }
			// LocalDateTime으로 변환 (ISO_LOCAL_DATE_TIME 형식)
	        LocalDateTime meet_date = LocalDateTime.parse(jsonTimestamp, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
			System.out.println(meet_date);
			
			String members = request.getParameter("member_arr");
			String[] member_arr = members.split(",");
			
			for(String m : member_arr) {
				int member_no = Integer.parseInt(m);
				PartyMember pm = new PartyMember();
				pm.setBuddy_no(buddy_no);
				pm.setMember_no(member_no);
				pm.setMeet_date(meet_date);
				
				int result = new PartyMemberService().createPartyMember(pm);
				
				if(result<1) {
					// 실패 시 바로 실패 페이지로 이동
                    System.out.println("모임 결성 실패 : 모임원");
                    view = request.getRequestDispatcher("/views/include/create_fail.jsp");
                    view.forward(request, response);
                    return;  // 즉시 메서드 종료
				}
			}	
				
			// 모든 멤버 등록 성공
			
			// 성공 페이지
			view = request.getRequestDispatcher("/views/include/create_success.jsp");

		} else {
			// 세션 없음: 로그인 세션 만료 처리
	        System.out.println("로그인 세션 없음");
	        view = request.getRequestDispatcher("/views/include/limit_user.jsp");
		}

	    // 최종 포워딩
	    view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		doGet(request, response);
	}

}
