package com.foodybuddy.user_manage.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.user_manage.vo.User;

public class UserDao {

    private static final String SELECT_USER_BY_ID = "SELECT u.user_no, u.grade_no, u.user_id, u.user_pw, u.user_name, u.user_phone, u.user_email, u.user_postcode, u.user_addr, u.user_detailAddr, u.user_extraAddr, u.user_question, u.user_answer, u.user_warn, u.reg_date, g.grade_name FROM user u JOIN grade g ON u.grade_no = g.grade_no WHERE u.user_no = ?";
    private static final String SELECT_ALL_USERS = "SELECT u.user_no, u.grade_no, u.user_id, u.user_pw, u.user_name, u.user_phone, u.user_email, u.user_postcode, u.user_addr, u.user_detailAddr, u.user_extraAddr, u.user_question, u.user_answer, u.user_warn, u.reg_date, g.grade_name FROM user u JOIN grade g ON u.grade_no = g.grade_no";

    public UserDao() {}

    public User selectUser(int userNo, Connection conn) {
        User user = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(SELECT_USER_BY_ID);
            pstmt.setInt(1, userNo);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int grade_no = rs.getInt("grade_no");
                String user_id = rs.getString("user_id");
                String user_pw = rs.getString("user_pw");
                String user_name = rs.getString("user_name");
                String user_phone = rs.getString("user_phone");
                String user_email = rs.getString("user_email");
                String user_postcode = rs.getString("user_postcode");
                String user_addr = rs.getString("user_addr");
                String user_detailAddr = rs.getString("user_detailAddr");
                String user_extraAddr = rs.getString("user_extraAddr");
                String user_question = rs.getString("user_question");
                String user_answer = rs.getString("user_answer");
                int user_warn = rs.getInt("user_warn");
                String reg_date = rs.getString("reg_date");
                String grade_name = rs.getString("grade_name");
                user = new User(userNo, grade_no, user_id, user_pw, user_name, user_phone, user_email, user_postcode, user_addr, user_detailAddr, user_extraAddr, user_question, user_answer, user_warn, reg_date, grade_name);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return user;
    }

    public List<User> selectAllUsers(Connection conn) {
        List<User> users = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(SELECT_ALL_USERS);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                int user_no = rs.getInt("user_no");
                int grade_no = rs.getInt("grade_no");
                String user_id = rs.getString("user_id");
                String user_pw = rs.getString("user_pw");
                String user_name = rs.getString("user_name");
                String user_phone = rs.getString("user_phone");
                String user_email = rs.getString("user_email");
                String user_postcode = rs.getString("user_postcode");
                String user_addr = rs.getString("user_addr");
                String user_detailAddr = rs.getString("user_detailAddr");
                String user_extraAddr = rs.getString("user_extraAddr");
                String user_question = rs.getString("user_question");
                String user_answer = rs.getString("user_answer");
                int user_warn = rs.getInt("user_warn");
                String reg_date = rs.getString("reg_date");
                String grade_name = rs.getString("grade_name");
                users.add(new User(user_no, grade_no, user_id, user_pw, user_name, user_phone, user_email, user_postcode, user_addr, user_detailAddr, user_extraAddr, user_question, user_answer, user_warn, reg_date, grade_name));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return users;
    }
}
