package com.foodybuddy.foodycomment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.foodycomment.vo.Comment;

import static com.foodybuddy.common.sql.JDBCTemplate.close;


public class FcommentDao {
	public void insertComment(Comment comment, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            String sql = "INSERT INTO foody_comment (foody_no ,user_no, comment_text) VALUES (? ,?, ? ) ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, comment.getFoody_no());
            pstmt.setInt(2, comment.getUser_no());
            pstmt.setString(3, comment.getComment_text());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
    }

    public List<Comment> selectCommentsByFoodyNo(int foody_no, Connection conn) {
        List<Comment> comments = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM foody_comment c JOIN user u ON c.user_no = u.user_no WHERE c.foody_no = ? ORDER BY c.reg_date DESC ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, foody_no);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setComment_num(rs.getInt("comment_num"));
                comment.setFoody_no(rs.getInt("foody_no"));
                comment.setUser_name(rs.getString("user_name"));
                comment.setComment_text(rs.getString("comment_text"));
                comment.setreg_date(rs.getTimestamp("reg_date").toLocalDateTime());
                comments.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return comments;
    }
}
