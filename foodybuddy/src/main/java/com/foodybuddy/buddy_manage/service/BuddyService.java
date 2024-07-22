package com.foodybuddy.buddy_manage.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;
import static com.foodybuddy.common.sql.JDBCTemplate.commit;
import static com.foodybuddy.common.sql.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.foodybuddy.buddy_manage.dao.BuddyDao;
import com.foodybuddy.buddy_manage.vo.BuddyPosts;

public class BuddyService {
    private BuddyDao buddyDao = new BuddyDao();

    public List<BuddyPosts> getBuddyPosts(String status) {
        Connection conn = getConnection();
        List<BuddyPosts> buddyPosts = buddyDao.getBuddyPosts(conn, status);
        close(conn);
        return buddyPosts;
    }
    
    public BuddyPosts getBuddyPostByNo(int buddyNo) {
        Connection conn = getConnection();
        BuddyPosts post = buddyDao.getBuddyPostByNo(conn, buddyNo);
        close(conn);
        return post;
    }
    
    public boolean approveBuddyPost(int buddyNo) {
        Connection conn = getConnection();
        boolean result = buddyDao.updateBuddyStatus(conn, buddyNo, "Y");
        if (result) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }

    public boolean rejectBuddyPost(int buddyNo) {
        Connection conn = getConnection();
        boolean result = buddyDao.deleteBuddyPost(conn, buddyNo);
        if (result) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
}
