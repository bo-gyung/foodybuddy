package com.foodybuddy.user_manage.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.user_manage.vo.User;

public class UserDao {
    private static final String SELECT_ALL_USERS = "SELECT * FROM user";
    private static final String SELECT_USERS_BY_NICKNAME = "SELECT * FROM user WHERE user_name LIKE ?";

    public UserDao() {}

    public List<User> selectAllUsers() {
        Connection conn = getConnection();
        List<User> users = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(SELECT_ALL_USERS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                User tmp = new User();
                tmp.setUser_no(rs.getInt("user_no"));
                tmp.setGrade_no(rs.getInt("grade_no"));
                tmp.setUser_id(rs.getString("user_id"));
                tmp.setUser_pw(rs.getString("user_pw"));
                tmp.setUser_name(rs.getString("user_name"));
                tmp.setUser_phone(rs.getString("user_phone"));
                tmp.setUser_email(rs.getString("user_email"));
                tmp.setUser_postcode(rs.getString("user_postcode"));
                tmp.setUser_addr(rs.getString("user_addr"));
                tmp.setUser_detailAddr(rs.getString("user_detailAddr"));
                tmp.setUser_extraAddr(rs.getString("user_extraAddr"));
                tmp.setUser_question(rs.getString("user_question"));
                tmp.setUser_answer(rs.getString("user_answer"));
                tmp.setUser_warn(rs.getInt("user_warn"));
                tmp.setReg_date(rs.getString("reg_date"));
                tmp.setGrade_name(rs.getString("grade_name"));
                users.add(tmp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
            close(conn);
        }
        return users;
    }

    public List<User> selectUsersByNickname(String nickname) {
        Connection conn = getConnection();
        List<User> users = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(SELECT_USERS_BY_NICKNAME);
            pstmt.setString(1, "%" + nickname + "%");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                User tmp = new User();
                tmp.setUser_no(rs.getInt("user_no"));
                tmp.setGrade_no(rs.getInt("grade_no"));
                tmp.setUser_id(rs.getString("user_id"));
                tmp.setUser_pw(rs.getString("user_pw"));
                tmp.setUser_name(rs.getString("user_name"));
                tmp.setUser_phone(rs.getString("user_phone"));
                tmp.setUser_email(rs.getString("user_email"));
                tmp.setUser_postcode(rs.getString("user_postcode"));
                tmp.setUser_addr(rs.getString("user_addr"));
                tmp.setUser_detailAddr(rs.getString("user_detailAddr"));
                tmp.setUser_extraAddr(rs.getString("user_extraAddr"));
                tmp.setUser_question(rs.getString("user_question"));
                tmp.setUser_answer(rs.getString("user_answer"));
                tmp.setUser_warn(rs.getInt("user_warn"));
                tmp.setReg_date(rs.getString("reg_date"));
                tmp.setGrade_name(rs.getString("grade_name"));
                users.add(tmp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
            close(conn);
        }
        return users;
    }
}
