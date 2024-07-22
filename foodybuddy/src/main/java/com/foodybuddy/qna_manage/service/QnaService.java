package com.foodybuddy.qna_manage.service;

import java.sql.Connection;
import java.util.List;
import com.foodybuddy.qna_manage.dao.QnaDao;
import com.foodybuddy.qna_manage.vo.Qna;
import static com.foodybuddy.common.sql.JDBCTemplate.*;

public class QnaService {
    private QnaDao qnaDao = new QnaDao();

    public List<Qna> getAllQna() {
        Connection conn = getConnection();
        List<Qna> qnaList = qnaDao.getAllQna(conn);
        close(conn);
        return qnaList;
    }
    public List<Qna> getQnaByStatus(String status) {
        Connection conn = getConnection();
        List<Qna> qnaList = qnaDao.getQnaByStatus(conn, status);
        close(conn);
        return qnaList;
    }
    public Qna getQnaByNo(int qnaNo) {
        Connection conn = getConnection();
        Qna qna = qnaDao.getQnaByNo(conn, qnaNo);
        close(conn);
        return qna;
    }
    public void updateQnaAnswer(int qnaNo, String answer) {
        Connection conn = getConnection();
        int result = qnaDao.updateQnaAnswer(conn, qnaNo, answer);
        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
    }

}