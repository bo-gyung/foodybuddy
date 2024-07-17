package com.foodybuddy.qna_manage.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.qna_manage.vo.Qna;

public class QnaDao {
    private static final String SELECT_ALL_PENDING_QNA = "SELECT * FROM qna WHERE qna_status = '대기'";
    private static final String SELECT_ALL_COMPLETED_QNA = "SELECT * FROM qna WHERE qna_status = '완료'";
    private static final String SELECT_QNA_BY_ID = "SELECT * FROM qna WHERE qna_no = ?";
    private static final String UPDATE_QNA_ANSWER = "UPDATE qna SET qna_answer = ?, qna_status = '완료', mod_date = NOW() WHERE qna_no = ?";

    public List<Qna> selectAllPendingQna() {
        Connection conn = getConnection();
        List<Qna> qnaList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(SELECT_ALL_PENDING_QNA);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Qna tmp = new Qna();
                tmp.setQna_no(rs.getInt("qna_no"));
                tmp.setUser_no(rs.getInt("user_no"));
                tmp.setQna_title(rs.getString("qna_title"));
                tmp.setQna_content(rs.getString("qna_content"));
                tmp.setReg_date(rs.getString("reg_date"));
                tmp.setQna_status(rs.getString("qna_status"));
                tmp.setQna_answer(rs.getString("qna_answer"));
                tmp.setMod_date(rs.getString("mod_date"));
                qnaList.add(tmp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
            close(conn);
        }
        return qnaList;
    }

    public List<Qna> selectAllCompletedQna() {
        Connection conn = getConnection();
        List<Qna> qnaList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(SELECT_ALL_COMPLETED_QNA);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Qna tmp = new Qna();
                tmp.setQna_no(rs.getInt("qna_no"));
                tmp.setUser_no(rs.getInt("user_no"));
                tmp.setQna_title(rs.getString("qna_title"));
                tmp.setQna_content(rs.getString("qna_content"));
                tmp.setReg_date(rs.getString("reg_date"));
                tmp.setQna_status(rs.getString("qna_status"));
                tmp.setQna_answer(rs.getString("qna_answer"));
                tmp.setMod_date(rs.getString("mod_date"));
                qnaList.add(tmp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
            close(conn);
        }
        return qnaList;
    }

    public Qna selectQnaById(int qna_no) {
        Connection conn = getConnection();
        Qna qna = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(SELECT_QNA_BY_ID);
            pstmt.setInt(1, qna_no);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                qna = new Qna();
                qna.setQna_no(rs.getInt("qna_no"));
                qna.setUser_no(rs.getInt("user_no"));
                qna.setQna_title(rs.getString("qna_title"));
                qna.setQna_content(rs.getString("qna_content"));
                qna.setReg_date(rs.getString("reg_date"));
                qna.setQna_status(rs.getString("qna_status"));
                qna.setQna_answer(rs.getString("qna_answer"));
                qna.setMod_date(rs.getString("mod_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
            close(conn);
        }
        return qna;
    }

    public int updateQnaAnswer(int qna_no, String answer) {
        Connection conn = getConnection();
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            pstmt = conn.prepareStatement(UPDATE_QNA_ANSWER);
            pstmt.setString(1, answer);
            pstmt.setInt(2, qna_no);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
            close(conn);
        }
        return result;
    }
}
