package com.foodybuddy.buddy_comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodybuddy.buddy_comment.service.BuddyCommentService;
import com.foodybuddy.buddy_comment.vo.BuddyComment;
import com.foodybuddy.user.vo.User;


@WebServlet("/insertBuddyComment")
public class BuddyCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuddyCommentServlet() {
        super();  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		// 기본결과 세팅
		RequestDispatcher view = request.getRequestDispatcher("/views/include/create_fail.jsp");
		
		// 로그인이 유지된 상태라면 댓글 인서트
		HttpSession session = request.getSession(false);
		if (session != null) {
			// 세션있음
			System.out.println("로그인 세션 있음");
			
			User u = (User) session.getAttribute("user");
			
			String buddy_no = request.getParameter("buddy_no");
			String user_no = request.getParameter("user_no");
			String comment_main = request.getParameter("comment_main");
			// System.out.println(buddy_no+" : "+user_no+" : "+comment_main);
			
			BuddyComment bc = new BuddyComment();
			bc.setBuddy_no(Integer.parseInt(buddy_no));
			bc.setUser_no(Integer.parseInt(user_no));
			bc.setComment_main(comment_main);
			int result = new BuddyCommentService().insertComment(bc);
			
			if(result>0) {
				// 댓글 인서트 성공 시 댓글 리스트 새로 불러오기
				System.out.println("댓글 인서트 성공");
				List<BuddyComment> c_list = new BuddyCommentService().selectComment(Integer.parseInt(buddy_no));
				
				if(c_list!=null&& c_list.size() > 0) {
					// 댓글 목록이 있다면
					System.out.println("댓글 목록 불러오기 성공");
					// JSON 배열 생성
			        StringBuilder json = new StringBuilder();
			        json.append("[");

			        for (int i = 0; i < c_list.size(); i++) {
			            BuddyComment comment = c_list.get(i);

			            json.append("{")
			                .append("\"comment_no\":").append(comment.getComment_no()).append(",")
			                .append("\"buddy_no\":").append(comment.getBuddy_no()).append(",")
			                .append("\"user_no\":").append(comment.getUser_no()).append(",")
			                .append("\"report_no\":").append(comment.getReport_no()).append(",")
			                .append("\"comment_main\":\"").append(comment.getComment_main()).append("\",")
			                .append("\"reg_date\":\"").append(comment.getreg_date()).append("\",")
			                .append("\"user_name\":\"").append(comment.getUser_name()).append("\"")
			                .append("}");

			            if (i < c_list.size() - 1) {
			                json.append(","); // 마지막 원소 뒤에 쉼표 추가하지 않음
			            }
			        }

			        json.append("]");

			        // JSON 응답 보내기
			        response.setContentType("application/json;charset=utf-8");
			        PrintWriter out = response.getWriter();
			        out.append(json.toString());
			        out.flush();
					
				} else {
					// 댓글 목록이 null이거나 없다면
					System.out.println("댓글 목록 불러오기 실패");
					view = request.getRequestDispatcher("/views/include/create_fail.jsp");
					view.forward(request, response);
				}
				
			} else {
				// 댓글 인서트 실패
				System.out.println("댓글 인서트 실패");
				view = request.getRequestDispatcher("/views/include/create_fail.jsp");
				view.forward(request, response);
			}
			
		} else {
			// 세션없음
			// 로그인 세션 만료, 다시 로그인 요청하기
			System.out.println("로그인 세션 없음");
			// 로그인 페이지 연결
			view = request.getRequestDispatcher("/views/include/limit_user.jsp");
			view.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
