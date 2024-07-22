package com.foodybuddy.user_manage.service;

import java.sql.Connection;
import java.util.List;
import com.foodybuddy.user_manage.dao.UserDao;
import com.foodybuddy.user_manage.vo.User;
import static com.foodybuddy.common.sql.JDBCTemplate.*;

public class UserService {
    private UserDao userDao = new UserDao();

    public List<User> getAllUsers() {
        Connection conn = getConnection();
        List<User> users = userDao.selectAllUsers(conn);
        close(conn);
        return users;
    }

    public User getUserById(int userNo) {
        Connection conn = getConnection();
        User user = userDao.selectUser(userNo, conn);
        close(conn);
        return user;
    }
}
