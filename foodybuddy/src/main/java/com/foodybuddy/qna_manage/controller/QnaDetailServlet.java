package com.foodybuddy.qna_manage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.foodybuddy.qna_manage.service.QnaService;
import com.foodybuddy.qna_manage.vo.Qna;

@WebServlet("/qna/detail")
public class QnaDetailServlet extends HttpServlet {
    private QnaService qnaService = new QnaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
        Qna qna = qnaService.getQnaByNo(qnaNo);
        request.setAttribute("qna", qna);
        request.getRequestDispatcher("/views/qna_manage/qnaDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
        String answer = request.getParameter("answer");
        qnaService.updateQnaAnswer(qnaNo, answer);
        response.sendRedirect(request.getContextPath() + "/qna/detail?qna_no=" + qnaNo);
    }
}
