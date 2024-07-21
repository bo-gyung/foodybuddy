package com.foodybuddy.user_manage.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.user_manage.vo.BuddyPost;
import com.foodybuddy.user_manage.vo.Comment;
import com.foodybuddy.user_manage.vo.FoodyPost;
import com.foodybuddy.user_manage.vo.User;

public class UserDao {
    public List<User> getAllUsers(Connection conn) {
        List<User> userList = new ArrayList<>();
        String query = "SELECT u.user_no, u.grade_no, g.grade_name, u.user_id, u.user_pw, u.user_name, u.user_phone, u.user_email, u.user_postcode, u.user_addr, u.user_detailAddr, u.user_extraAddr, u.user_question, u.user_answer, u.reg_date " +
                       "FROM user u " +
                       "JOIN user_grade g ON u.grade_no = g.grade_no";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUser_no(rs.getInt("user_no"));
                user.setGrade_no(rs.getInt("grade_no"));
                user.setGrade_name(rs.getString("grade_name"));
                user.setUser_id(rs.getString("user_id"));
                user.setUser_pw(rs.getString("user_pw"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_phone(rs.getString("user_phone"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_postcode(rs.getString("user_postcode"));
                user.setUser_addr(rs.getString("user_addr"));
                user.setUser_detailAddr(rs.getString("user_detailAddr"));
                user.setUser_extraAddr(rs.getString("user_extraAddr"));
                user.setUser_question(rs.getString("user_question"));
                user.setUser_answer(rs.getString("user_answer"));
                user.setReg_date(rs.getTimestamp("reg_date"));  // Timestamp 그대로 설정
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return userList;
    }

    public List<User> getUsersByName(Connection conn, String userName) {
        List<User> userList = new ArrayList<>();
        String query = "SELECT u.user_no, u.grade_no, g.grade_name, u.user_id, u.user_pw, u.user_name, u.user_phone, u.user_email, u.user_postcode, u.user_addr, u.user_detailAddr, u.user_extraAddr, u.user_question, u.user_answer, u.reg_date " +
                       "FROM user u " +
                       "JOIN user_grade g ON u.grade_no = g.grade_no " +
                       "WHERE u.user_name = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userName);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUser_no(rs.getInt("user_no"));
                user.setGrade_no(rs.getInt("grade_no"));
                user.setGrade_name(rs.getString("grade_name"));
                user.setUser_id(rs.getString("user_id"));
                user.setUser_pw(rs.getString("user_pw"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_phone(rs.getString("user_phone"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_postcode(rs.getString("user_postcode"));
                user.setUser_addr(rs.getString("user_addr"));
                user.setUser_detailAddr(rs.getString("user_detailAddr"));
                user.setUser_extraAddr(rs.getString("user_extraAddr"));
                user.setUser_question(rs.getString("user_question"));
                user.setUser_answer(rs.getString("user_answer"));
                user.setReg_date(rs.getTimestamp("reg_date"));  // Timestamp 그대로 설정
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return userList;
    }

    public List<Comment> getCommentsByUser(Connection conn, int userNo) {
        List<Comment> commentList = new ArrayList<>();
        String query = "SELECT c.foody_no, f.foody_title, c.comment_main, c.reg_date " +
                       "FROM foody_comment c " +
                       "JOIN foody_create f ON c.foody_no = f.foody_no " +
                       "WHERE c.user_no = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userNo);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Comment comment = new Comment();
                comment.setFoody_no(rs.getInt("foody_no"));
                comment.setFoody_title(rs.getString("foody_title"));
                comment.setComment_main(rs.getString("comment_main"));
                comment.setReg_date(rs.getTimestamp("reg_date"));  // Timestamp 그대로 설정
                commentList.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return commentList;
    }
    
    public List<Comment> getBuddyCommentsByUser(Connection conn, int userNo) {
        List<Comment> commentList = new ArrayList<>();
        String query = "SELECT c.comment_no, c.buddy_no, b.buddy_title, c.comment_main, c.reg_date " +
                       "FROM buddy_comment c " +
                       "JOIN buddy_board b ON c.buddy_no = b.buddy_no " +
                       "WHERE c.user_no = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userNo);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Comment comment = new Comment();
                comment.setFoody_no(rs.getInt("buddy_no"));
                comment.setFoody_title(rs.getString("buddy_title"));
                comment.setComment_main(rs.getString("comment_main"));
                comment.setReg_date(rs.getTimestamp("reg_date"));
                commentList.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return commentList;
    }
    public List<FoodyPost> getFoodyPostsByUser(Connection conn, int userNo) {
        List<FoodyPost> foodyPostList = new ArrayList<>();
        String query = "SELECT foody_no, foody_title, foody_main, reg_date, foody_click, foody_good FROM foody_create WHERE user_no = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userNo);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                FoodyPost post = new FoodyPost();
                post.setFoody_no(rs.getInt("foody_no"));
                post.setFoody_title(rs.getString("foody_title"));
                post.setFoody_main(rs.getString("foody_main"));
                post.setReg_date(rs.getTimestamp("reg_date"));
                post.setFoody_click(rs.getInt("foody_click"));
                post.setFoody_good(rs.getInt("foody_good"));
                foodyPostList.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return foodyPostList;
    }

    public List<BuddyPost> getBuddyPostsByUser(Connection conn, int userNo) {
        List<BuddyPost> buddyPostList = new ArrayList<>();
        String query = "SELECT buddy_no, buddy_title, buddy_main, reg_date, buddy_view FROM buddy_board WHERE user_no = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userNo);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BuddyPost post = new BuddyPost();
                post.setBuddy_no(rs.getInt("buddy_no"));
                post.setBuddy_title(rs.getString("buddy_title"));
                post.setBuddy_main(rs.getString("buddy_main"));
                post.setReg_date(rs.getTimestamp("reg_date"));
                post.setBuddy_view(rs.getInt("buddy_view"));
                buddyPostList.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return buddyPostList;
    }
}
