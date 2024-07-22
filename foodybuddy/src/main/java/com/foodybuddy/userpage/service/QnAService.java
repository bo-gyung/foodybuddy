package com.foodybuddy.userpage.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.foodybuddy.userpage.dao.UserPageDao;
import com.foodybuddy.userpage.vo.QnA;


public class QnAService {
	
	
	//글제목 눌러서 링크이동
	public Map<String,Object> qnaDetail(int qna_no){
		Connection conn = getConnection();
		Map<String,Object> resultM = new UserPageDao().qnaDetail(qna_no, conn);
		close(conn);
		return resultM;
	}
	
	// 게시글 삭제 서비스
	public int deleteQnA(int qna_no) throws SQLException {
		Connection conn = getConnection();
		UserPageDao uDao = new UserPageDao();
        int result = uDao.deleteQnA(qna_no, conn);
        return result;
 }
	
	
	
	// 게시글 수정 서비스
	public int updateQnA(String title, String content, int qna_no) {
		Connection conn = getConnection();
		int result = new UserPageDao().updateQnA(title,content,qna_no, conn);
		close(conn);
		return result;
	}
	// QnA갯수 
	public int selectQnACount(QnA option) {
		Connection conn = getConnection();
		int result = new UserPageDao().selectQnACount(option,conn);
		close(conn);
		return result;
	}
	
	// 얘는 조건으로 사용될 Board option
	public List<QnA> selectQnAList(QnA option){
		Connection conn = getConnection();
		List<QnA> list = new UserPageDao().selectQnAList(option,conn);
		close(conn);
		return list;
	}
	
	
	
//	우리가 보내준 Board 데이터를 가지고 
	public int createQnA(QnA q) {
		Connection conn = getConnection();
//		보드만 보내면 안되고 , 커넥션도 같이 보낸다.
		int result = new UserPageDao().createQnA(q,conn);
		close(conn);
//		int 값으로 보내다보니까
		return result;
	}

}
