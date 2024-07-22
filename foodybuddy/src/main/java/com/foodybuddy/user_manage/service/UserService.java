package com.foodybuddy.user_manage.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.foodybuddy.common.Paging;
import com.foodybuddy.user_manage.dao.UserDao;
import com.foodybuddy.user_manage.vo.BuddyPost;
import com.foodybuddy.user_manage.vo.Comment;
import com.foodybuddy.user_manage.vo.FoodyPost;
import com.foodybuddy.user_manage.vo.User;

public class UserService {
    private UserDao userDao = new UserDao();

    public List<User> getAllUsers() {
        Connection conn = getConnection();
        List<User> userList = userDao.getAllUsers(conn);
        close(conn);
        return userList;
    }

    public List<User> getUsersByName(String userName) {
        Connection conn = getConnection();
        List<User> userList = userDao.getUsersByName(conn, userName);
        close(conn);
        return userList;
    }
    public List<Comment> getCommentsByUser(int userNo) {
        Connection conn = getConnection();
        List<Comment> commentList = userDao.getCommentsByUser(conn, userNo);
        close(conn);
        return commentList;
    }
    public List<Comment> getBuddyCommentsByUser(int userNo) {
        Connection conn = getConnection();
        List<Comment> commentList = userDao.getBuddyCommentsByUser(conn, userNo);
        close(conn);
        return commentList;
    }
    public List<FoodyPost> getFoodyPostsByUser(int userNo) {
        Connection conn = getConnection();
        List<FoodyPost> foodyPostList = userDao.getFoodyPostsByUser(conn, userNo);
        close(conn);
        return foodyPostList;
    }

    public List<BuddyPost> getBuddyPostsByUser(int userNo) {
        Connection conn = getConnection();
        List<BuddyPost> buddyPostList = userDao.getBuddyPostsByUser(conn, userNo);
        close(conn);
        return buddyPostList;
    }
    public List<User> getUsers(int currentPage, int numPerPage) {
        Connection conn = getConnection();
        int startRow = (currentPage - 1) * numPerPage;
        List<User> userList = userDao.getUsers(conn, startRow, numPerPage);
        close(conn);
        return userList;
    }

    public int getTotalUserCount() {
        Connection conn = getConnection();
        int totalCount = userDao.getTotalUserCount(conn);
        close(conn);
        return totalCount;
    }
    
    
}
