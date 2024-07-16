package com.foodybuddy.userpage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.userpage.service.QnAService;
import com.foodybuddy.userpage.vo.QnA;


@WebServlet("/qna/list")
public class QnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public QnAListServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("qna_title");
		// QnA 객체 생성
		QnA option = new QnA();
		option.setQna_title(title);
		// 최종 마지막 페이지 구성 파트
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt("nowPage"));
		}
		// 전체 목록 갯수 조회 --> 페이징바를 구성
		
		option.setTotalData(new QnAService().selectQnACount(option));
		
		//select보드 리스트 정보 가져오기
		List<QnA> list = new QnAService().selectQnAList(option);
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);
		RequestDispatcher view = request.getRequestDispatcher("/views/userpage/userqna/qnalist.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
