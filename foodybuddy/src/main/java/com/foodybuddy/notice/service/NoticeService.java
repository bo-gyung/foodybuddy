package com.foodybuddy.notice.service;

import java.sql.Connection;
import java.util.List;
import com.foodybuddy.notice.dao.NoticeDao;
import com.foodybuddy.notice.vo.Notice;
import static com.foodybuddy.common.sql.JDBCTemplate.*;

public class NoticeService {
    private NoticeDao noticeDao = new NoticeDao();

    public List<Notice> getAllNotices() {
        Connection conn = getConnection();
        List<Notice> notices = noticeDao.getAllNotices(conn);
        close(conn);
        return notices;
    }

    public void saveNotice(Notice notice) {
        Connection conn = getConnection();
        int result = noticeDao.saveNotice(conn, notice);
        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
    }
    public Notice getNoticeById(int noticeId) {
        Connection conn = getConnection();
        Notice notice = noticeDao.getNoticeById(conn, noticeId);
        close(conn);
        return notice;
    }
    public boolean deleteNotice(int noticeId) {
        Connection conn = getConnection();
        boolean success = noticeDao.deleteNotice(conn, noticeId);
        if (success) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return success;
    }
    public boolean updateNotice(Notice notice) {
        Connection conn = getConnection();
        boolean success = noticeDao.updateNotice(conn, notice);
        if (success) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return success;
    }
    public void incrementViewCount(int noticeId) {
        Connection conn = getConnection();
        boolean result = noticeDao.incrementViewCount(conn, noticeId);
        if (result) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
    }

}
