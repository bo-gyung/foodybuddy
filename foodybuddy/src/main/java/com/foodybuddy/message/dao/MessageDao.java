package com.foodybuddy.message.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodybuddy.user.vo.User;

import com.foodybuddy.message.vo.Message;

public class MessageDao {
	
	public boolean sendMessage(int senderNo,int receiver,String msgTitle, String msgText, Connection conn) {
		PreparedStatement pstmt = null;
		int rowsAffected = 0;
		try {
			String sql = "INSERT INTO messages(sender_id,receiver_id,message_title,message_text) VALUES (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,senderNo);
			pstmt.setInt(2,receiver);
			pstmt.setString(3, msgTitle);
			pstmt.setString(4, msgText);
			rowsAffected = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return rowsAffected > 0;
		
	}
	
	public int selectByName(String nickname, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			String sql = "SELECT user_no FROM `user` WHERE user_name =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return result = rs.getInt("user_no");
			}else {
				return result = 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}

}
