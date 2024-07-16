package com.foodybuddy.notice.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.notice.vo.Notice;

import static com.foodybuddy.common.sql.JDBCTemplate.*;

public class NoticeDao {

    private static final String INSERT_NOTICE_SQL = "INSERT INTO notice_management (notice_title, notice_content, notice_date, notice_view_count) VALUES (?, ?, ?, ?)";
    private static final String SELECT_NOTICE_BY_ID = "SELECT notice_no, notice_title, notice_content, notice_date, notice_view_count FROM notice_management WHERE notice_no = ?";
    private static final String SELECT_ALL_NOTICES = "SELECT * FROM notice_management";
    private static final String DELETE_NOTICE_SQL = "DELETE FROM notice_management WHERE notice_no = ?";
    private static final String UPDATE_NOTICE_SQL = "UPDATE notice_management SET notice_title = ?, notice_content = ?, notice_date = ?, notice_view_count = ? WHERE notice_no = ?";

    public NoticeDao() {}

    public void insertNotice(Notice notice, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(INSERT_NOTICE_SQL);
            pstmt.setString(1, notice.getNotice_title());
            pstmt.setString(2, notice.getNotice_content());
            pstmt.setString(3, notice.getNotice_date());
            pstmt.setInt(4, notice.getNotice_view_count());
            int result = pstmt.executeUpdate();
            if (result > 0) {
                System.out.println("Insert successful!");
            } else {
                System.out.println("Insert failed!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
    }


    public Notice selectNotice(int noticeNo, Connection conn) {
        Notice notice = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(SELECT_NOTICE_BY_ID);
            pstmt.setInt(1, noticeNo);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                String title = rs.getString("notice_title");
                String content = rs.getString("notice_content");
                String date = rs.getString("notice_date");
                int viewCount = rs.getInt("notice_view_count");
                notice = new Notice(noticeNo, title, content, date, viewCount);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return notice;
    }

    public List<Notice> selectAllNotices(Connection conn) {
        List<Notice> notices = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(SELECT_ALL_NOTICES);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("notice_no");
                String title = rs.getString("notice_title");
                String content = rs.getString("notice_content");
                String date = rs.getString("notice_date");
                int viewCount = rs.getInt("notice_view_count");
                notices.add(new Notice(id, title, content, date, viewCount));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return notices;
    }

    public boolean deleteNotice(int id, Connection conn) {
        boolean rowDeleted = false;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(DELETE_NOTICE_SQL);
            pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return rowDeleted;
    }

    public boolean updateNotice(Notice notice, Connection conn) {
        boolean rowUpdated = false;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(UPDATE_NOTICE_SQL);
            pstmt.setString(1, notice.getNotice_title());
            pstmt.setString(2, notice.getNotice_content());
            pstmt.setString(3, notice.getNotice_date());
            pstmt.setInt(4, notice.getNotice_view_count());
            pstmt.setLong(5, notice.getNotice_no());
            rowUpdated = pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return rowUpdated;
    }
}
