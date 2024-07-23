package com.foodybuddy.message.service;

import  static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.foodybuddy.message.dao.MessageDao;
import com.foodybuddy.message.vo.Message;

public class MessageService {
	
	 public boolean sendMessage(int senderNo,String msgReceiver,String msgTitle, String msgText ) { 
	Connection conn = getConnection(); 
	try {
		int receiver = selectByName(msgReceiver, conn);
		if(receiver != 0) {
			return new MessageDao().sendMessage(senderNo,receiver,msgTitle,msgText,conn); 
		}else {
			return false;
		}
	}catch(Exception e) {
		e.printStackTrace();
		return false;
	}finally {
		
		close(conn); 
	}
	 }
	
	public int selectByName(String msgReceiver ,Connection conn) {
		 return new MessageDao().selectByName(msgReceiver, conn);
	 }
	 
	 public List<Map<String,Object>> sentMessage(int senderId){
		 Connection conn = getConnection();
		 List<Map<String,Object>> messages = new MessageDao().sentMessage(senderId,conn);
		 close(conn);
		 return messages;
	 }
	 
	 public List<Map<String,Object>> receiveMessage(int receiverId){
		 Connection conn = getConnection();
		 List<Map<String,Object>> messages2 = new MessageDao().receiveMessage(receiverId,conn);
		 close(conn);
		 return messages2;
	 }
	 
	 public boolean moveMessages(List<Integer> messageIds,int logId) {
		 Connection conn = null;
	        try {
	            conn = getConnection();
	            MessageDao messageDao = new MessageDao();
	            messageDao.moveMessages(messageIds,logId, conn);
	            conn.commit(); // 변경 사항 커밋
	            return true;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            if (conn != null) {
	                try {
	                    conn.rollback(); // 에러 발생 시 롤백
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }
	            return false;
	        } finally {
	            if (conn != null) {
	                close(conn);
	            }
	        }
	    }
	 
	 public List<Map<String,Object>> tempMessage(int logId){
		 Connection conn = getConnection();
		 List<Map<String,Object>> messages3 = new MessageDao().tempMessage(logId,conn);
		 close(conn);
		 return messages3;
	 }
	 
	// 메시지를 휴지통으로 이동하는 메서드
	    public boolean moveToTrash(List<Integer> messageIds, int userId) {
	    	Connection conn = getConnection();
	        boolean success = new MessageDao().moveToTrash(messageIds, userId,conn);
	        close(conn);
	        return success;
	    }

	    // 사용자 휴지통의 메시지 목록 가져오기 메서드
	    public List<Map<String, Object>> getTrashedMessages(int userId) {
	    	Connection conn = getConnection();
	        List<Map<String,Object>> message = new MessageDao().getTrashedMessages(userId,conn);
	        close(conn);
	        return message;
	    }
}
