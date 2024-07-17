package com.foodybuddy.user.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodybuddy.user.vo.User;

public class UserDao {
	
	public int createUser(User u, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "INSERT INTO `user` (user_id,user_pw,user_name,user_phone,user_email,user_postcode,user_addr,user_detailAddr,user_extraAddr,user_question,user_answer) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pw());
			pstmt.setString(3, u.getUser_name());
			pstmt.setString(4, u.getUser_phone());
			pstmt.setString(5, u.getUser_email());
			pstmt.setString(6, u.getUser_postcode());
			pstmt.setString(7, u.getUser_addr());
			pstmt.setString(8,u.getUser_detailAddr());
			pstmt.setString(9, u.getUser_extraAddr());
			pstmt.setString(10, u.getUser_question());
			pstmt.setString(11, u.getUser_answer());
			
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public User selectById(String userId, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		try {
			String sql = "SELECT * FROM `user` WHERE user_id= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 u = new User(rs.getInt("user_no")
							,rs.getInt("grade_no")
							,rs.getString("user_id")
							,rs.getString("user_pw")
							,rs.getString("user_name")
							,rs.getString("user_phone")
							,rs.getString("user_postcode")
							,rs.getString("user_addr")
							,rs.getString("user_detailAddr")
							,rs.getString("user_extraAddr")
							,rs.getString("user_email")
							,rs.getString("user_question")
							,rs.getString("user_answer")
							,rs.getInt("user_warn")
							,rs.getTimestamp("reg_date").toLocalDateTime()
							,rs.getTimestamp("warn_date").toLocalDateTime());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return u;
	}
	
	public User selectByName(String userName, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		try {
			String sql = "SELECT * FROM `user` WHERE user_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 u = new User(rs.getInt("user_no")
							,rs.getInt("grade_no")
							,rs.getString("user_id")
							,rs.getString("user_pw")
							,rs.getString("user_name")
							,rs.getString("user_phone")
							,rs.getString("user_postcode")
							,rs.getString("user_addr")
							,rs.getString("user_detailAddr")
							,rs.getString("user_extraAddr")
							,rs.getString("user_email")
							,rs.getString("user_question")
							,rs.getString("user_answer")
							,rs.getInt("user_warn")
							,rs.getTimestamp("reg_date").toLocalDateTime()
							,rs.getTimestamp("warn_date").toLocalDateTime()); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return u;
	}
	
	public User selectByPhone(String userPhone, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		try {
			String sql = "SELECT * FROM `user` WHERE user_phone = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPhone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 u = new User(rs.getInt("user_no")
							,rs.getInt("grade_no")
							,rs.getString("user_id")
							,rs.getString("user_pw")
							,rs.getString("user_name")
							,rs.getString("user_phone")
							,rs.getString("user_postcode")
							,rs.getString("user_addr")
							,rs.getString("user_detailAddr")
							,rs.getString("user_extraAddr")
							,rs.getString("user_email")
							,rs.getString("user_question")
							,rs.getString("user_answer")
							,rs.getInt("user_warn")
							,rs.getTimestamp("reg_date").toLocalDateTime()
							,rs.getTimestamp("warn_date").toLocalDateTime()); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return u;
	}
	
	public User selectByEmail(String userEmail, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		try {
			String sql = "SELECT * FROM `user` WHERE user_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				u = new User(rs.getInt("user_no")
						,rs.getInt("grade_no")
						,rs.getString("user_id")
						,rs.getString("user_pw")
						,rs.getString("user_name")
						,rs.getString("user_phone")
						,rs.getString("user_postcode")
						,rs.getString("user_addr")
						,rs.getString("user_detailAddr")
						,rs.getString("user_extraAddr")
						,rs.getString("user_email")
						,rs.getString("user_question")
						,rs.getString("user_answer")
						,rs.getInt("user_warn")
						,rs.getTimestamp("reg_date").toLocalDateTime()
						,rs.getTimestamp("warn_date").toLocalDateTime());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return u;
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
				resultUser = new User(rs.getInt("user_no")
						,rs.getInt("grade_no")
						,rs.getString("user_id")
						,rs.getString("user_pw")
						,rs.getString("user_name")
						,rs.getString("user_phone")
						,rs.getString("user_postcode")
						,rs.getString("user_addr")
						,rs.getString("user_detailAddr")
						,rs.getString("user_extraAddr")
						,rs.getString("user_email")
						,rs.getString("user_question")
						,rs.getString("user_answer")
						,rs.getInt("user_warn")
						,rs.getTimestamp("reg_date").toLocalDateTime()
						,rs.getTimestamp("warn_date").toLocalDateTime()); 
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
