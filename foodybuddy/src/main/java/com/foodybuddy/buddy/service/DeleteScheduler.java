package com.foodybuddy.buddy.service;

import java.util.Timer;

public class DeleteScheduler {
	public static void startScheduler() {
        // Timer 인스턴스 생성
        Timer timer = new Timer();

        // TimerTask를 하루마다 실행하도록 설정 (24시간 간격)
        timer.schedule(new DeleteOldPartiesTask(), 0, 24 * 60 * 60 * 1000);  // 매 24시간마다 실행
    }
}
