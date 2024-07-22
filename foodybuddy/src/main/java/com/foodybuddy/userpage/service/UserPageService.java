package com.foodybuddy.userpage.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.foodybuddy.buddy.vo.Buddy;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.user.vo.User;
import com.foodybuddy.userpage.dao.UserPageDao;

public class UserPageService {
	
private UserPageDao userPageDao = new UserPageDao();
	// 회원탈퇴
	public void deleteUser(String userNo) {
    // 사용자 삭제 로직 구현
    // 예: 데이터베이스에서 사용자 정보 삭제
}


	// 비밀번호 변경

	// 내정보 변경	



    //비밀번호 확인
	public boolean checkPassword(int userNo, String password) {
    // 비밀번호 확인 로직 구현
    // 예: 데이터베이스에서 사용자 비밀번호 확인
    return true; // 예시로 항상 true 반환, 실제 구현 필요
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
