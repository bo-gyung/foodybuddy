package com.foodybuddy.notice.service;

import static com.foodybuddy.common.sql.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.foodybuddy.notice.dao.NoticeDao;
import com.foodybuddy.notice.vo.Notice;
import static com.foodybuddy.common.sql.JDBCTemplate.*;

public class NoticeService {

    private NoticeDao noticeDao = new NoticeDao();

    public List<Notice> getAllNotices() {
        Connection conn = getConnection();
        List<Notice> notices = noticeDao.selectAllNotices(conn);
        close(conn);
        return notices;
    }

    public Notice getNoticeById(int id) {
        Connection conn = getConnection();
        Notice notice = noticeDao.selectNotice(id, conn);
        close(conn);
        return notice;
    }

    public void createNotice(Notice notice) {
        Connection conn = getConnection();
        try {
            noticeDao.insertNotice(notice, conn);
            commit(conn); // 데이터베이스 커밋
        } catch (Exception e) {
            rollback(conn); // 에러 발생 시 롤백
            e.printStackTrace();
        } finally {
            close(conn);
        }
    }

    public void updateNotice(int id, Notice notice) {
        Connection conn = getConnection();
        try {
            notice.setNotice_no(id);
            noticeDao.updateNotice(notice, conn);
            commit(conn); // 데이터베이스 커밋
        } catch (Exception e) {
            rollback(conn); // 에러 발생 시 롤백
            e.printStackTrace();
        } finally {
            close(conn);
        }
    }

    public void deleteNotice(int id) {
        Connection conn = getConnection();
        try {
            noticeDao.deleteNotice(id, conn);
            commit(conn); // 데이터베이스 커밋
        } catch (Exception e) {
            rollback(conn); // 에러 발생 시 롤백
            e.printStackTrace();
        } finally {
            close(conn);
        }
    }
}
