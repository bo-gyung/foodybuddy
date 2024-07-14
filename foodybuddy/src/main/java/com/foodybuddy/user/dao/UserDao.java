package com.foodybuddy.user.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodybuddy.user.vo.User;

public class UserDao {
	// 회원가입
	public int createUser(User u, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;

		return result;
	}
	
	// 로그인
	public User loginUser(User u, Connection conn) {
		User resultUser = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM `user` WHERE `user_id` = ? AND `user_pw` = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pw());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				resultUser = new User(
						rs.getInt("user_no"),
						rs.getInt("grade_no"),
						rs.getString("user_id"),
						rs.getString("user_pw"),
						rs.getString("user_name"),
						rs.getString("user_phone"),
						rs.getString("user_email"),
						rs.getString("user_addr"),
						rs.getString("user_question"),
						rs.getString("user_answer"),
						rs.getInt("user_warn"),
						rs.getTimestamp("reg_date").toLocalDateTime()
						);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return resultUser;
	}
	
	// 회원정보 수정
	public int editUser(User u, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		

		return result;
	}
}
