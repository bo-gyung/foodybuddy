package com.foodybuddy.buddy_comment.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import org.json.simple.JSONArray;

import com.foodybuddy.buddy_comment.dao.BuddyCommentDao;
import com.foodybuddy.buddy_comment.vo.BuddyComment;

public class BuddyCommentService {
	
	// 댓글 추가
	public int insertComment(BuddyComment c) {
        Connection conn = getConnection();
        int result = new BuddyCommentDao().insertComment(c, conn);
        close(conn);
        return result;
    }
	
	// 댓글리스트 출력
	public List<BuddyComment> selectComment(int buddy_no) {
		Connection conn = getConnection();
		List<BuddyComment> c_list = new BuddyCommentDao().selectComment(buddy_no, conn);
		close(conn);
		return c_list;
		
	}

}	
