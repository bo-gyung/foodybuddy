package com.foodybuddy.message.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<Map<String,Object>> sentMessage(int senderId, Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Map<String,Object>> messages = new ArrayList();
		try {
			String sql = "SELECT m.message_id, m.receiver_id, u.user_name AS receiverName, m.sender_id, m.message_title, m.`message_text`, m.sent_at, m.is_deleted\r\n"
					+ "FROM messages m JOIN `user` u ON  m.receiver_id = u.user_no\r\n"
					+ "WHERE m.sender_id = ?\r\n"
					+ "AND m.is_deleted = FALSE";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, senderId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String,Object> messageMap = new HashMap<>();
				messageMap.put("message_id", rs.getInt("message_id"));
				messageMap.put("receiver_id", rs.getInt("receiver_id"));
				messageMap.put("receiverName", rs.getString("receiverName"));
				messageMap.put("sender_id", rs.getInt("sender_id"));
				messageMap.put("message_title", rs.getString("message_title"));
				messageMap.put("message_text", rs.getString("message_text"));
				messageMap.put("sent_at", rs.getTimestamp("sent_at").toLocalDateTime());
				messageMap.put("is_deleted", rs.getBoolean("is_deleted"));
				messages.add(messageMap);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return messages;
	}
	
	public List<Map<String,Object>> receiveMessage(int receiverId, Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Map<String,Object>> messages2 = new ArrayList();
		try {
			String sql = "SELECT m.message_id, m.sender_id, u.user_name AS senderName, m.receiver_id, m.message_title, m.`message_text`, m.sent_at, m.is_deleted\r\n"
					+ "FROM messages m JOIN `user` u ON  m.sender_id = u.user_no\r\n"
					+ "WHERE m.receiver_id = ?\r\n"
					+ "AND m.is_deleted = FALSE";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, receiverId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String,Object> messageMap2 = new HashMap<>();
				messageMap2.put("message_id", rs.getInt("message_id"));
				messageMap2.put("sender_id", rs.getInt("sender_id"));
				messageMap2.put("senderName", rs.getString("senderName"));
				messageMap2.put("receiver_id", rs.getInt("receiver_id"));
				messageMap2.put("message_title", rs.getString("message_title"));
				messageMap2.put("message_text", rs.getString("message_text"));
				messageMap2.put("sent_at", rs.getTimestamp("sent_at").toLocalDateTime());
				messageMap2.put("is_deleted", rs.getBoolean("is_deleted"));
				messages2.add(messageMap2);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return messages2;
	}
	
	public Map<String, Object> getMessageById(int messageId, Connection conn) throws SQLException {
        String sql = "SELECT m.message_id, m.sender_id, m.message_title, m.message_text, m.sent_at, u.user_name AS sender_name " +
                     "FROM messages m " +
                     "JOIN users u ON m.sender_id = u.user_no " +
                     "WHERE m.message_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, messageId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Map<String, Object> message = new HashMap<>();
                    message.put("message_id", rs.getInt("message_id"));
                    message.put("sender_id", rs.getInt("sender_id"));
                    message.put("message_title", rs.getString("message_title"));
                    message.put("message_text", rs.getString("message_text"));
                    message.put("sent_at", rs.getTimestamp("sent_at").toLocalDateTime());
                    message.put("sender_name", rs.getString("sender_name"));
                    return message;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return null;
    }
	
	public void moveMessages(List<Map<String, Object>> messages, Connection conn) throws SQLException {
        String sql = "UPDATE messages SET status = 'TEMPORARY' WHERE message_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            for (Map<String, Object> message : messages) {
                pstmt.setInt(1, (Integer) message.get("message_id"));
                pstmt.addBatch();
            }
            pstmt.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
		
}
