package com.foodybuddy.userpage.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.foodybuddy.buddy.vo.Buddy;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.user.vo.User;
import com.foodybuddy.userpage.dao.UserPageDao;

public class UserPageService {
	
	// 내 정보 조회
	public Map<String,Object> selectMyInfo(User u) {
		Connection conn = getConnection();
		Map<String,Object> resultMap = new UserPageDao().selectMyInfo(u, conn);
		close(conn);
		return resultMap;
	}
	
	// 작성글 조회(버디)
	public List<Buddy> selectBuddyList(int user_no) {
		Connection conn = getConnection();
		List<Buddy> list = new UserPageDao().selectBuddyList(user_no, conn);
		close(conn);
		return list;
		
	}
	// 작성글 조회(푸디)
	public List<Foody> selectFoodyList(int user_no) {
		Connection conn = getConnection();
		List<Foody> list = new UserPageDao().selectFoodyList(user_no, conn);
		close(conn);
		return list;
	}
	
	
}
