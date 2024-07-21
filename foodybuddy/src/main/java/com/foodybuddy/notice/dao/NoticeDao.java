package com.foodybuddy.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.foodybuddy.notice.vo.Notice;
import static com.foodybuddy.common.sql.JDBCTemplate.*;

public class NoticeDao {

    public List<Notice> getAllNotices(Connection conn) {
        List<Notice> notices = new ArrayList<>();
        String query = "SELECT * FROM notice_management"; // 테이블 이름 수정
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Notice notice = new Notice();
                notice.setNotice_no(rs.getInt("notice_no"));
                notice.setNotice_title(rs.getString("notice_title"));
                notice.setNotice_content(rs.getString("notice_content"));
                notice.setNotice_date(rs.getString("notice_date"));
                notice.setNotice_view_count(rs.getInt("notice_view_count"));
                notices.add(notice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return notices;
    }

    public int saveNotice(Connection conn, Notice notice) {
        String query = "INSERT INTO notice_management (notice_title, notice_content, notice_date, notice_view_count) VALUES (?, ?, ?, ?)"; // 테이블 이름 수정
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, notice.getNotice_title());
            pstmt.setString(2, notice.getNotice_content());
            pstmt.setString(3, notice.getNotice_date());
            pstmt.setInt(4, notice.getNotice_view_count());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }
    public Notice getNoticeById(Connection conn, int noticeId) {
        String query = "SELECT * FROM notice_management WHERE notice_no = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Notice notice = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, noticeId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                notice = new Notice();
                notice.setNotice_no(rs.getInt("notice_no"));
                notice.setNotice_title(rs.getString("notice_title"));
                notice.setNotice_content(rs.getString("notice_content"));
                notice.setNotice_date(rs.getString("notice_date"));
                notice.setNotice_view_count(rs.getInt("notice_view_count"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return notice;
}
    public boolean deleteNotice(Connection conn, int noticeId) {
        String query = "DELETE FROM notice_management WHERE notice_no = ?";
        PreparedStatement pstmt = null;
        boolean success = false;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, noticeId);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return success;
    }
    
    public boolean updateNotice(Connection conn, Notice notice) {
        String query = "UPDATE notice_management SET notice_title = ?, notice_content = ? WHERE notice_no = ?";
        PreparedStatement pstmt = null;
        boolean success = false;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, notice.getNotice_title());
            pstmt.setString(2, notice.getNotice_content());
            pstmt.setInt(3, notice.getNotice_no());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return success;
    }
    public boolean incrementViewCount(Connection conn, int noticeId) {
        String query = "UPDATE notice_management SET notice_view_count = notice_view_count + 1 WHERE notice_no = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, noticeId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
