package com.foodybuddy.userpage.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.userpage.vo.QnA;

public class UserPageDao {
	
	//qna 게시글 삭제
	public int deleteQnA(String qna_title, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "DELETE FROM `user_qna` WHERE qna_title = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna_title);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//qna게시글 수정
	public int updateQnA(String title, String content, int user, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "UPDATE `user_qna` SET qna_title = ?, qna_content = ?"
					+ "WHERE user_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, user);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// qna게시글 갯수 조회
	public int selectQnACount(QnA option, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM user_qna";
			// 옵션에 null이 아니라면, 제목을 기준으로 추가 해줘
			if(option.getQna_title() != null) {
				sql += "WHERE qna_title LIKE CONCAT('%','"+option.getQna_title()+"','%')";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// qna게시글 제목을 기준으로 키워드 검색
	public List<QnA> selectQnAList(QnA option, Connection conn){
		List<QnA> list = new ArrayList<QnA>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 검색 조건없으면 SELECT * FROM 테이블
			// 검색조건 있으면 + WHERE qna_title LIKE CONCAT('%',qna_title,'%')
			String sql = "SELECT * FROM user_qna";
			if(option.getQna_title() != null) {
				sql += "WHERE qna_title LIKE CONCAT('%','"+option.getQna_title()+"','%')";
			}
			sql += " LIMIT " + option.getLimitPageNo()+" ," + option.getNumPerPage();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				// 다적어줘야해
				QnA resultVo = new QnA(rs.getInt("qna_no"),
						rs.getInt("user_no"),
						rs.getString("qna_title"),
						rs.getString("qna_content"),
						rs.getTimestamp("reg_date").toLocalDateTime(),
						rs.getString("qna_status"),
						rs.getString("qna_answer"),
						rs.getTimestamp("mod_date").toLocalDateTime(),
						rs.getTimestamp("complete_date").toLocalDateTime());
				list.add(resultVo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// QnA 게시글 등록
	public int createQnA(QnA q, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO `user_qna`(qna_title,qna_content,user_no) VALUES (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getQna_title());
			pstmt.setString(2, q.getQna_content());
			pstmt.setInt(3, q.getUser_no());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result;
	}
	

}
