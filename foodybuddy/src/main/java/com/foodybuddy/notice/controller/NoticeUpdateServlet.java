package com.foodybuddy.notice.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodybuddy.notice.service.NoticeService;
import com.foodybuddy.notice.vo.Notice;

@WebServlet("/notices/update")
public class NoticeUpdateServlet extends HttpServlet {
    private NoticeService noticeService = new NoticeService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 파라미터 받아오기
        String idParam = request.getParameter("notice_id");
        int noticeId = 0; // 기본값 설정

        // 파라미터가 null이 아니고 숫자로 변환 가능하다면 변환
        if (idParam != null && !idParam.isEmpty()) {
            try {
                noticeId = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                // 예외 처리 - 잘못된 형식의 notice_id가 전달된 경우
                e.printStackTrace();
                // 원하는 오류 처리 방법을 선택하여 추가할 수 있음
                // 예: 오류 페이지로 리다이렉트 등
                return;
            }
        } else {
            // notice_id가 전달되지 않은 경우에 대한 처리
            // 원하는 오류 처리 방법을 선택하여 추가할 수 있음
            // 예: 오류 페이지로 리다이렉트 등
            return;
        }

        String title = request.getParameter("notice_title");
        String content = request.getParameter("notice_content");

        // 현재 시간 설정
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String date = now.format(formatter);

        // 조회수는 0으로 설정
        int viewCount = 0;

        Notice notice = new Notice(noticeId, title, content, date, viewCount);
        noticeService.updateNotice(notice); // 수정 메서드 호출

        // 수정 후 목록 페이지로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/notices");
    }
}



