package com.foodybuddy.userpage.service;

import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;
import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.util.Map;

import com.foodybuddy.user.vo.User;
import com.foodybuddy.userpage.dao.UserPageDao;

public class UserPageService {
	public Map<String,Object> selectMyInfo(User u) {
		Connection conn = getConnection();
		Map<String,Object> resultMap = new UserPageDao().selectMyInfo(u, conn);
		close(conn);
		return resultMap;
	}
}
