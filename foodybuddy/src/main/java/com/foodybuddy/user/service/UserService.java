package com.foodybuddy.user.service;

import  static com.foodybuddy.common.sql.JDBCTemplate.close;
import  static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.foodybuddy.user.dao.UserDao;
import com.foodybuddy.user.vo.User;

public class UserService {
	// 회원가입
	public int createUser(User u) {		
		Connection conn = getConnection();
		int result = new UserDao().createUser(u, conn);
		close(conn);
		return result;
	}
	
	// 로그인
	public User loginUser(String id,String pw) {
		User u = new User();
		u.setUser_id(id);
		u.setUser_pw(pw);
		
		Connection conn = getConnection();
		
		User resultUser = new UserDao().loginUser(u, conn);
		return resultUser;
	}
	
	// 회원정보 수정
	public int editUser(int userNo, String pw, String name) {
		User u = new User();
		u.setUser_no(userNo);
		u.setUser_pw(pw);
		u.setUser_name(name);
		
		Connection conn = getConnection();
		int result = new UserDao().editUser(u, conn);
		close(conn);return result;
		
	}
}
