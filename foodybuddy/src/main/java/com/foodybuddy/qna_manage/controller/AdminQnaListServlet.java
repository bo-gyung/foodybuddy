package com.foodybuddy.qna_manage.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.foodybuddy.qna_manage.service.QnaService;
import com.foodybuddy.qna_manage.vo.Qna;

@WebServlet("/admin/qna/list")
public class AdminQnaListServlet extends HttpServlet {
    private QnaService qnaService = new QnaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Qna> pendingQnaList = qnaService.getQnaByStatus("대기");
        List<Qna> completedQnaList = qnaService.getQnaByStatus("완료");

        request.setAttribute("pendingQnaList", pendingQnaList);
        request.setAttribute("completedQnaList", completedQnaList);

        request.getRequestDispatcher("/views/qna_manage/qnaList.jsp").forward(request, response);
    }
}
