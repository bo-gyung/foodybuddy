package com.foodybuddy.qna_manage.service;

import java.util.List;

import com.foodybuddy.qna_manage.dao.QnaDao;
import com.foodybuddy.qna_manage.vo.Qna;

public class QnaService {
    private QnaDao qnaDao = new QnaDao();

    public List<Qna> getAllPendingQna() {
        return qnaDao.selectAllPendingQna();
    }

    public List<Qna> getAllCompletedQna() {
        return qnaDao.selectAllCompletedQna();
    }

    public Qna getQnaById(int qna_no) {
        return qnaDao.selectQnaById(qna_no);
    }

    public int answerQna(int qna_no, String answer) {
        return qnaDao.updateQnaAnswer(qna_no, answer);
    }
}
