package com.foodybuddy.userpage.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.userpage.service.QnAService;
import com.foodybuddy.userpage.vo.QnA;


@WebServlet("/qna/detail")
public class QnADetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public QnADetailServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글제목클릭시 글 번호로 받아오기
		int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
		// 글 번호로 내용을 가져오기
		Map<String,Object> resultM = new QnAService().qnaDetail(qnaNo);
		
		// 여기에 ansContent도 함께 포함되어 있음
		request.setAttribute("detail" , resultM);
		
		// 수정해라
//		String answer = request.setAttribute("ansContent", resultM);
		
		
		//연결
		RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userqna/qnadetail.jsp");
	
		view.forward(request, response);
		//디테일을 출력
		
		// 목록 출력
		// qna_no를 기준으로 답변을 받아온다.
		// 1:1 관계니까, 상세페이지 답변 출력
		// 답변 데이터를 추가로 넣어주면된다.
		
		// 관리자 답변
		 request.setAttribute("ansContent" , resultM);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
