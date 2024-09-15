package com.foodybuddy.buddy.service;

import java.util.TimerTask;

// 반복적으로 실행할 작업
public class DeleteOldPartiesTask extends TimerTask {

	@Override
	public void run() {
		// 삭제할 작업 정의
		new PartyMemberService().deletePartyMembers();
		
	}

}
