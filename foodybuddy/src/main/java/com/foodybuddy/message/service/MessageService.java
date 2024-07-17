package com.foodybuddy.message.service;

import  static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.SQLException;

import com.foodybuddy.message.dao.MessageDao;
import com.foodybuddy.message.vo.Message;
import com.foodybuddy.user.dao.UserDao;
import com.foodybuddy.user.vo.User;

public class MessageService {
	
	
	 public boolean sendMessage(int senderNo,String msgReceiver,String msgTitle, String msgText ) { 
	Connection conn = getConnection(); 
	try {
		int receiver = selectByName(msgReceiver, conn);
		if(receiver != 0 && senderNo != receiver) {
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
	 

}
