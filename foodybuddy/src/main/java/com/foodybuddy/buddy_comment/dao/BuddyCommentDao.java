package com.foodybuddy.buddy_comment.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.buddy_comment.vo.BuddyComment;


public class BuddyCommentDao {
	
	// 댓글 입력
	public int insertComment(BuddyComment c, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            String sql = "INSERT INTO buddy_comment (buddy_no ,user_no, comment_main) VALUES (? ,?, ? ) ";
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, c.getBuddy_no());
            pstmt.setInt(2, c.getUser_no());
            pstmt.setString(3, c.getComment_main());
            
            result = pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
	
	// 댓글 리스트 출력
	public List<BuddyComment> selectComment(int buddy_no, Connection conn) {
		List<BuddyComment> c_list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM buddy_comment c JOIN user u "
					+ "ON c.user_no = u.user_no "
					+ "WHERE c.buddy_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, buddy_no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BuddyComment c = new BuddyComment();
                c.setComment_no(rs.getInt("comment_no"));
                c.setBuddy_no(rs.getInt("buddy_no"));
                c.setUser_no(rs.getInt("user_no"));
                c.setUser_name(rs.getString("user_name"));
                c.setComment_main(rs.getString("comment_main"));
                c.setreg_date(rs.getTimestamp("reg_date").toLocalDateTime());
                c_list.add(c);
            }

		} catch(Exception e) {
			
		} finally {
			close(rs);
			close(pstmt);
		}
        return c_list;
	}

}
