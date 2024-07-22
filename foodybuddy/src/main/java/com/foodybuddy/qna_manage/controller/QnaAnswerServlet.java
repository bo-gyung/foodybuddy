package com.foodybuddy.qna_manage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.foodybuddy.qna_manage.service.QnaService;

@WebServlet("/qna/answer")
public class QnaAnswerServlet extends HttpServlet {
    private QnaService qnaService = new QnaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
        String answer = request.getParameter("answer");
        qnaService.updateQnaAnswer(qnaNo, answer);
        response.sendRedirect(request.getContextPath() + "/qna_manage/detail?qna_no=" + qnaNo);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
