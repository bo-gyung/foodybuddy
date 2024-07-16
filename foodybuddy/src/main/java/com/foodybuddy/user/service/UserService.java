package com.foodybuddy.user.service;

import  static com.foodybuddy.common.sql.JDBCTemplate.close;
import  static com.foodybuddy.common.sql.JDBCTemplate.getConnection;


import java.sql.Connection;

import com.foodybuddy.user.dao.UserDao;
import com.foodybuddy.user.vo.User;

public class UserService {
	
	public int createUser(User u) {
		Connection conn = getConnection();
		int result = new UserDao().createUser(u,conn);
		close(conn);
		return result;
		
	}
	
	public User selectById(String userId) {
		Connection conn = getConnection();
		User u = new UserDao().selectById(userId,conn);
		close(conn);
		return u;
	}
	
	public User selectByName(String userName) {
		Connection conn = getConnection();
		User u = new UserDao().selectByName(userName,conn);
		close(conn);
		return u;
	}
	
	public User selectByPhone(String userPhone) {
		Connection conn = getConnection();
		User u = new UserDao().selectByPhone(userPhone,conn);
		close(conn);
		return u;
	}
	
	public User selectByEmail(String userEmail) {
		Connection conn = getConnection();
		User u = new UserDao().selectByEmail(userEmail,conn);
		close(conn);
		return u;
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
