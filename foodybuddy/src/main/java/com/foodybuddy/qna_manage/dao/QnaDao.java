package com.foodybuddy.qna_manage.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.qna_manage.vo.Qna;

public class QnaDao {
	public List<Qna> getAllQna(Connection conn) {
        List<Qna> qnaList = new ArrayList<>();
        String query = "SELECT qna_no, user_no, qna_title, qna_content, reg_date, qna_status, qna_answer, mod_date, complete_date FROM user_QnA";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Qna qna = new Qna();
                qna.setQna_no(rs.getInt("qna_no"));
                qna.setUser_no(rs.getInt("user_no"));
                qna.setQna_title(rs.getString("qna_title"));
                qna.setQna_content(rs.getString("qna_content"));
                qna.setReg_date(rs.getTimestamp("reg_date"));
                qna.setQna_status(rs.getString("qna_status"));
                qna.setQna_answer(rs.getString("qna_answer"));

                
                Timestamp modTimestamp = rs.getTimestamp("mod_date");
                qna.setMod_date(modTimestamp);
                Timestamp completeTimestamp = rs.getTimestamp("complete_date");
                qna.setComplete_date(completeTimestamp);

                qnaList.add(qna);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return qnaList;
    }

    public List<Qna> getQnaByStatus(Connection conn, String status) {
        List<Qna> qnaList = new ArrayList<>();
        String query = "SELECT qna_no, user_no, qna_title, qna_content, reg_date, qna_status, qna_answer, mod_date, complete_date FROM user_QnA WHERE qna_status = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, status);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Qna qna = new Qna();
                qna.setQna_no(rs.getInt("qna_no"));
                qna.setUser_no(rs.getInt("user_no"));
                qna.setQna_title(rs.getString("qna_title"));
                qna.setQna_content(rs.getString("qna_content"));
                qna.setReg_date(rs.getTimestamp("reg_date"));
                qna.setQna_status(rs.getString("qna_status"));
                qna.setQna_answer(rs.getString("qna_answer"));

                
                Timestamp modTimestamp = rs.getTimestamp("mod_date");
                qna.setMod_date(modTimestamp);
                Timestamp completeTimestamp = rs.getTimestamp("complete_date");
                qna.setComplete_date(completeTimestamp);

                qnaList.add(qna);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return qnaList;
    }

    public Qna getQnaByNo(Connection conn, int qnaNo) {
        Qna qna = null;
        String query = "SELECT qna_no, user_no, qna_title, qna_content, reg_date, qna_status, qna_answer, mod_date, complete_date FROM user_QnA WHERE qna_no = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, qnaNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                qna = new Qna();
                qna.setQna_no(rs.getInt("qna_no"));
                qna.setUser_no(rs.getInt("user_no"));
                qna.setQna_title(rs.getString("qna_title"));
                qna.setQna_content(rs.getString("qna_content"));
                qna.setReg_date(rs.getTimestamp("reg_date"));
                qna.setQna_status(rs.getString("qna_status"));
                qna.setQna_answer(rs.getString("qna_answer"));

               
                Timestamp modTimestamp = rs.getTimestamp("mod_date");
                qna.setMod_date(modTimestamp);
                Timestamp completeTimestamp = rs.getTimestamp("complete_date");
                qna.setComplete_date(completeTimestamp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return qna;
    }

    public int updateQnaAnswer(Connection conn, int qnaNo, String answer) {
        String query = "UPDATE user_QnA SET qna_answer = ?, qna_status = '완료', mod_date = CURRENT_TIMESTAMP, complete_date = CURRENT_TIMESTAMP WHERE qna_no = ?";
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, answer);
            pstmt.setInt(2, qnaNo);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }
}
