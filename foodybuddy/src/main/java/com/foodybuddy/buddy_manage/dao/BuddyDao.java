package com.foodybuddy.buddy_manage.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.buddy_manage.vo.BuddyPosts;

public class BuddyDao {
    public List<BuddyPosts> getBuddyPosts(Connection conn, String status) {
        List<BuddyPosts> buddyPosts = new ArrayList<>();
        String query = "SELECT b.buddy_no, b.user_no, u.user_name, b.buddy_title, b.buddy_view, b.reg_date, b.buddy_approve " +
                       "FROM buddy_board b " +
                       "JOIN user u ON b.user_no = u.user_no " +
                       "WHERE b.buddy_approve = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, status);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BuddyPosts post = new BuddyPosts();
                post.setBuddy_no(rs.getInt("buddy_no"));
                post.setUser_no(rs.getInt("user_no"));
                post.setUser_name(rs.getString("user_name"));
                post.setBuddy_title(rs.getString("buddy_title"));
                post.setBuddy_view(rs.getInt("buddy_view"));
                post.setReg_date(rs.getTimestamp("reg_date"));
                post.setBuddy_approve(rs.getString("buddy_approve"));
                buddyPosts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return buddyPosts;
    }
    
    public BuddyPosts getBuddyPostByNo(Connection conn, int buddyNo) {
        BuddyPosts post = null;
        String query = "SELECT b.buddy_no, b.user_no, u.user_name, b.buddy_title, b.buddy_main, b.buddy_view, b.reg_date, b.buddy_approve " +
                       "FROM buddy_board b " +
                       "JOIN user u ON b.user_no = u.user_no " +
                       "WHERE b.buddy_no = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, buddyNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                post = new BuddyPosts();
                post.setBuddy_no(rs.getInt("buddy_no"));
                post.setUser_no(rs.getInt("user_no"));
                post.setUser_name(rs.getString("user_name"));
                post.setBuddy_title(rs.getString("buddy_title"));
                post.setBuddy_main(rs.getString("buddy_main"));
                post.setBuddy_view(rs.getInt("buddy_view"));
                post.setReg_date(rs.getTimestamp("reg_date"));
                post.setBuddy_approve(rs.getString("buddy_approve"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return post;
    }
    
    public boolean updateBuddyStatus(Connection conn, int buddyNo, String status) {
        String query = "UPDATE buddy_board SET buddy_approve = ? WHERE buddy_no = ?";
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, status);
            pstmt.setInt(2, buddyNo);
            result = pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }

    public boolean deleteBuddyPost(Connection conn, int buddyNo) {
        String query = "DELETE FROM buddy_board WHERE buddy_no = ?";
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            // 먼저 관련된 댓글을 삭제
            String deleteCommentsQuery = "DELETE FROM buddy_comment WHERE buddy_no = ?";
            pstmt = conn.prepareStatement(deleteCommentsQuery);
            pstmt.setInt(1, buddyNo);
            pstmt.executeUpdate();
            pstmt.close();

            // 이제 모임 글을 삭제
            String deletePostQuery = "DELETE FROM buddy_board WHERE buddy_no = ?";
            pstmt = conn.prepareStatement(deletePostQuery);
            pstmt.setInt(1, buddyNo);
            result = pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
}
}