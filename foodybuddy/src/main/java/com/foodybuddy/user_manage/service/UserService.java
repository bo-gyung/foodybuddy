package com.foodybuddy.user_manage.service;

import java.util.List;
import com.foodybuddy.user_manage.dao.UserDao;
import com.foodybuddy.user_manage.vo.User;

public class UserService {
    private UserDao userDao = new UserDao();

    public List<User> getAllUsers() {
        return userDao.selectAllUsers();
    }

    public List<User> getUsersByNickname(String nickname) {
        return userDao.selectUsersByNickname(nickname);
    }
}
