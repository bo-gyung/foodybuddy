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
		    PreparedStatement pstmt2 = null;
		    ResultSet generatedKeys = null;
		    
		    try {
		        String sql = "INSERT INTO messages (sender_id, receiver_id, message_title, message_text) VALUES (?, ?, ?, ?)";
		        String sql2 = "INSERT INTO message_status (message_id, user_no, status) VALUES (?, ?, ?)";

		        // Prepare statement for inserting a new message
		        pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		        pstmt.setInt(1, senderNo);
		        pstmt.setInt(2, receiver);
		        pstmt.setString(3, msgTitle);
		        pstmt.setString(4, msgText);

		        int rowsAffected = pstmt.executeUpdate();
		        if (rowsAffected > 0) {
		            // Get the generated message_id
		            generatedKeys = pstmt.getGeneratedKeys();
		            if (generatedKeys.next()) {
		                int messageId = generatedKeys.getInt(1);

		                // Insert status for sender (Sent)
		                pstmt2 = conn.prepareStatement(sql2);
		                pstmt2.setInt(1, messageId);
		                pstmt2.setInt(2, senderNo);
		                pstmt2.setInt(3, 1); // Status = 1 (Sent)
		                pstmt2.executeUpdate();

		                // Insert status for receiver (Received)
		                pstmt2.setInt(1, messageId);
		                pstmt2.setInt(2, receiver);
		                pstmt2.setInt(3, 2); // Status = 2 (Received)
		                pstmt2.executeUpdate();

		                return true;
		            }
		        }
		        return false;
		    } catch (SQLException e) {
		        e.printStackTrace();
		        return false;
		    } finally {
		        close(generatedKeys);
		        close(pstmt);
		        close(pstmt2);
		    }
		
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
	
	public List<Map<String,Object>> sentMessage(int senderId, Connection conn) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Map<String,Object>> messages = new ArrayList<>();
	    try {
	        String sql = "SELECT m.message_id, m.sender_id, u1.user_name AS senderName, m.receiver_id, u2.user_name AS receiverName, m.message_title, m.message_text, m.sent_at " +
	                     "FROM messages m " +
	                     "JOIN user u1 ON m.sender_id = u1.user_no " +
	                     "JOIN user u2 ON m.receiver_id = u2.user_no " +
	                     "JOIN message_status ms ON m.message_id = ms.message_id " +
	                     "WHERE ms.user_no = ? AND ms.status = 1 AND ms.is_deleted = FALSE";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, senderId);
	        rs = pstmt.executeQuery();
	        while(rs.next()) {
	            Map<String,Object> messageMap = new HashMap<>();
	            messageMap.put("message_id", rs.getInt("message_id"));
	            messageMap.put("sender_id", rs.getInt("sender_id"));
	            messageMap.put("senderName", rs.getString("senderName"));
	            messageMap.put("receiver_id", rs.getInt("receiver_id"));
	            messageMap.put("receiverName", rs.getString("receiverName"));
	            messageMap.put("message_title", rs.getString("message_title"));
	            messageMap.put("message_text", rs.getString("message_text"));
	            messageMap.put("sent_at", rs.getTimestamp("sent_at").toLocalDateTime());
	            messages.add(messageMap);
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return messages;
	}
	
	public List<Map<String,Object>> receiveMessage(int receiverId, Connection conn) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Map<String,Object>> messages2 = new ArrayList<>();
	    try {
	        String sql = "SELECT m.message_id, m.sender_id, u1.user_name AS senderName, m.receiver_id, u2.user_name AS receiverName, m.message_title, m.message_text, m.sent_at " +
	                     "FROM messages m " +
	                     "JOIN message_status ms ON m.message_id = ms.message_id " +
	                     "JOIN user u1 ON m.sender_id = u1.user_no " +
	                     "JOIN user u2 ON m.receiver_id = u2.user_no " +
	                     "WHERE ms.user_no = ? AND ms.status = 2 AND ms.is_deleted = FALSE";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, receiverId);
	        rs = pstmt.executeQuery();
	        while(rs.next()) {
	            Map<String,Object> messageMap2 = new HashMap<>();
	            messageMap2.put("message_id", rs.getInt("message_id"));
	            messageMap2.put("sender_id", rs.getInt("sender_id"));
	            messageMap2.put("senderName", rs.getString("senderName"));
	            messageMap2.put("receiver_id", rs.getInt("receiver_id"));
	            messageMap2.put("receiverName", rs.getString("receiverName"));
	            messageMap2.put("message_title", rs.getString("message_title"));
	            messageMap2.put("message_text", rs.getString("message_text"));
	            messageMap2.put("sent_at", rs.getTimestamp("sent_at").toLocalDateTime());
	            messages2.add(messageMap2);
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return messages2;
	}
	
	public Map<String, Object> getMessageById(int messageId, Connection conn) throws SQLException {
        String sql = "SELECT m.message_id, m.sender_id, m.message_title, m.`message_text`, m.sent_at, u.user_name AS sender_name " +
                     "FROM messages m " +
                     "JOIN `user` u ON m.sender_id = u.user_no " +
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
	
	 public void moveMessages(List<Integer> messageIds, int logId, Connection conn) throws SQLException {
	        String sql = "UPDATE message_status ms\r\n"
	        		+ "JOIN messages m ON ms.message_id = m.message_id\r\n"
	        		+ "SET ms.`status` = 3\r\n"
	        		+ "WHERE m.message_id = ?\r\n"
	        		+ "AND  ms.user_no= ?;";
	        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            for (Integer messageId : messageIds) {
	                pstmt.setInt(1, messageId);
	                pstmt.setInt(2, logId);
	                pstmt.addBatch();
	            }
	            pstmt.executeBatch();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw e;
	        }
	    }
	 
	 public List<Map<String,Object>> tempMessage(int logId, Connection conn){
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			ResultSet rs = null;
			ResultSet rs2 = null;
			List<Map<String,Object>> messages3 = new ArrayList();
			try {
				String sql = "SELECT m.message_id,m.sender_id,u1.user_name AS senderName, m.receiver_id,u2.user_name AS receiverName,  m.message_title, m.`message_text`, m.sent_at\r\n"
						+ "FROM messages m\r\n"
						+ "JOIN `user` u1 ON m.sender_id = u1.user_no\r\n"
						+ "JOIN `user` u2 ON m.receiver_id = u2.user_no\r\n"
						+ "JOIN message_status ms ON m.message_id = ms.message_id\r\n"
						+ "WHERE ms.user_no = ? AND ms.status = 3 AND ms.is_deleted = FALSE";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, logId);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Map<String,Object> messageMap2 = new HashMap<>();
					messageMap2.put("message_id", rs.getInt("message_id"));
					messageMap2.put("sender_id", rs.getInt("sender_id"));
					messageMap2.put("senderName", rs.getString("senderName"));
					messageMap2.put("receiver_id", rs.getInt("receiver_id"));
					messageMap2.put("receiverName", rs.getString("receiverName"));
					messageMap2.put("message_title", rs.getString("message_title"));
					messageMap2.put("message_text", rs.getString("message_text"));
					messageMap2.put("sent_at", rs.getTimestamp("sent_at").toLocalDateTime());
					messages3.add(messageMap2);
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return messages3;
	 }	
				
	 public void deleteMessages(List<Integer> messageIds, int logId, Connection conn) throws SQLException {
	        String sql = "UPDATE message_status ms\r\n"
	        		+ "JOIN messages m ON ms.message_id = m.message_id\r\n"
	        		+ "SET ms.`is_deleted` = TRUE\r\n"
	        		+ "WHERE m.message_id = ?\r\n"
	        		+ "AND  ms.user_no= ?;";
	        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            for (Integer messageId : messageIds) {
	                pstmt.setInt(1, messageId);
	                pstmt.setInt(2, logId);
	                pstmt.addBatch();
	            }
	            pstmt.executeBatch();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw e;
	        }
	    }		
	
	 public boolean moveToTrash(List<Integer> messageIds, int userId,Connection conn) {
	      
	        PreparedStatement pstmt = null;
	        boolean success = false;

	        try {
	           
	           String sql = "UPDATE message_status "
	            		+ "SET is_deleted = TRUE"
	            		+ "    `status` = 4 "
	            		+ "WHERE message_id = ?"
	            		+ "AND user_no = ? ";
	           pstmt = conn.prepareStatement(sql);
	           for (Integer messageId : messageIds) {
	                pstmt.setInt(1, messageId);
	                pstmt.setInt(2, userId);
	                
	            }
	            		
	            int rowsAffected = pstmt.executeUpdate();
	            success = rowsAffected > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(pstmt);
	          
	        }

	        return success;
	    }

	    // 사용자 휴지통의 메시지 목록 가져오기 메서드
	    public List<Map<String, Object>> getTrashedMessages(int userId,Connection conn) {
	     
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        List<Map<String, Object>> messages = new ArrayList<>();

	        try {
	            
	            String sql = "SELECT m.message_id, m.`message_text`"
	            		+ "FROM messages m"
	            		+ "JOIN `user` u1 ON m.sender_id = u1.user_no"
	            		+ "JOIN `user` u2 ON m.receiver_id = u2.user_no"
	            		+ "JOIN message_status ms ON m.message_id = ms.message_id"
	            		+ "WHERE ms.user_no = ? AND ms.status = 4 AND ms.is_deleted = TRUE";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, userId);

	            rs = pstmt.executeQuery();

	            while (rs.next()) {
	                Map<String, Object> message = new HashMap<>();
	                message.put("message_id", rs.getInt("message_id"));
	                message.put("message_text", rs.getString("message_text"));
	                messages.add(message);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rs);
	            close(pstmt);
	           
	        }

	        return messages;
	    }

				
}
