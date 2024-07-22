package com.foodybuddy.userpage.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.foodybuddy.buddy.vo.Buddy;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.user.dao.UserDao;
import com.foodybuddy.user.vo.User;
import com.foodybuddy.userpage.dao.UserPageDao;

public class UserPageService {
	
private UserPageDao userPageDao = new UserPageDao();
    
    	// 비밀번호 확인
		public boolean checkPassword(String userId, String password) {
			
        Connection conn = getConnection();
        boolean isPasswordCorrect = userPageDao.checkPassword(conn, userId, password);
        close(conn);
        return isPasswordCorrect;
    }
    
    	// 사용자 삭제
    	public boolean deleteUser(String userId) {
        Connection conn = getConnection();
        
        // 사용자 번호 조회
        int userNo = userPageDao.getUserNoById(conn, userId);
        
        // 사용자 삭제
        boolean isDeleted = userPageDao.deleteUserByNo(conn, userNo);
        
        close(conn);
        return isDeleted;
    }


	// 내 정보 조회
	public Map<String,Object> selectMyInfo(User u) {
		Connection conn = getConnection();
		Map<String,Object> resultMap = new UserPageDao().selectMyInfo(u, conn);
		close(conn);
		return resultMap;
	}
	
	// 작성글 조회(버디)
	public List<Buddy> selectBuddyList(int user_no) {
		Connection conn = getConnection();
		List<Buddy> list = new UserPageDao().selectBuddyList(user_no, conn);
		close(conn);
		return list;
		
	}
	// 작성글 조회(푸디)
	public List<Foody> selectFoodyList(int user_no) {
		Connection conn = getConnection();
		List<Foody> list = new UserPageDao().selectFoodyList(user_no, conn);
		close(conn);
		return list;
	}
	
	
}
