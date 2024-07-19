package com.foodybuddy.buddy.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.foodybuddy.buddy.dao.BuddyDao;
import com.foodybuddy.buddy.vo.Buddy;

public class BuddyService {
	// 버디 게시판 목록 출력 및 검색결과 출력
	public List<Buddy> selectBoardList(Buddy keyword){
		Connection conn = getConnection();
		List<Buddy> list = new BuddyDao().selectBuddyList(keyword, conn);
		close(conn);
		return list;
	}
	
	// 페이징
	public int selectBuddyCount(Buddy keyword) {
		Connection conn = getConnection();
		int result = new BuddyDao().selectBuddyCount(keyword, conn);
		close(conn);
		return result;
	}

	// 버디 게시글 열람
	public Map<String,Object> buddyPost(int buddy_no) {
		Connection conn = getConnection();
		Map<String,Object> resultMap = new BuddyDao().buddyPost(buddy_no, conn);
		close(conn);
		
		return resultMap;
	}
}	
