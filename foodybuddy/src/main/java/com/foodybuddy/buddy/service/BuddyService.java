package com.foodybuddy.buddy.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.foodybuddy.buddy.dao.BuddyDao;
import com.foodybuddy.buddy.vo.Buddy;

public class BuddyService {
	public List<Buddy> selectBoardList(Buddy keyword){
		Connection conn = getConnection();
		List<Buddy> list = new BuddyDao().selectBoardList(keyword, conn);
		close(conn);
		return list;
		
	}
}	
