package com.foodybuddy.userpage.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.foodybuddy.buddy.vo.Buddy;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.user.vo.User;
import com.foodybuddy.userpage.vo.QnA;

public class UserPageDao {
	
	//글 제목 클릭시 상세내용
	public Map<String,Object> qnaDetail(int qna_no, Connection conn){
		Map<String,Object> resultM = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// join한 쿼리문 그대로 써주면돼 쫄지마
			String sql = "SELECT u.user_name AS '닉네임' FROM `user` u JOIN `user_qna` q ON u.user_no = q.user_no WHERE q.user_no = ?;";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_no);
			rs = pstmt.executeQuery();
			
			// 안에 뭐가있을까~
			if(rs.next()) {
				resultM = new HashMap<String,Object>();
				resultM.put("작성자", rs.getString("u.user_name"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return resultM;
	}
	
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
	
	// qna 게시글 갯수 조회
	public int selectQnACount(QnA option, Connection conn) {
	    int result = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String sql = "SELECT COUNT(*) AS cnt FROM user_qna";
	        // 옵션에 null이 아니라면, 제목을 기준으로 추가
	        if (option.getQna_title() != null && !option.getQna_title().isEmpty()) {
	            sql += " WHERE `qna_title` LIKE ?";
	        }
	        pstmt = conn.prepareStatement(sql);
	        
	        // 검색 조건이 있으면 변수 바인딩
	        if (option.getQna_title() != null && !option.getQna_title().isEmpty()) {
	            pstmt.setString(1, "%" + option.getQna_title() + "%");
	        }
	        
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            result = rs.getInt("cnt");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return result;
	}
	
	// qna게시글 제목을 기준으로 키워드 검색
	public List<QnA> selectQnAList(QnA option, Connection conn) {
	    List<QnA> list = new ArrayList<QnA>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        // 기본 SQL 쿼리
	        String sql = "SELECT * FROM `user_qna`";
	        
	        // 검색 조건이 있으면 WHERE 절 추가
	        if (option.getQna_title() != null && !option.getQna_title().isEmpty()) {
	            sql += " WHERE `qna_title` LIKE ?";
	        }

	        // PreparedStatement 생성
	        pstmt = conn.prepareStatement(sql);
	        
	        // 검색 조건이 있으면 변수 바인딩
	        if (option.getQna_title() != null && !option.getQna_title().isEmpty()) {
	            pstmt.setString(1, "%" + option.getQna_title() + "%");
	        }

	        // 쿼리 실행
	        rs = pstmt.executeQuery();

	        // 결과 처리
	        while (rs.next()) {
	            QnA resultVo = new QnA(
	                rs.getInt("qna_no"),
	                rs.getInt("user_no"),
	                rs.getString("qna_title"),
	                rs.getString("qna_content"),
	                rs.getTimestamp("reg_date") != null ? rs.getTimestamp("reg_date").toLocalDateTime() : null,
	                rs.getString("qna_status"),
	                rs.getString("qna_answer"),
	                rs.getTimestamp("mod_date") != null ? rs.getTimestamp("mod_date").toLocalDateTime() : null,
	                rs.getTimestamp("complete_date") != null ? rs.getTimestamp("complete_date").toLocalDateTime() : null
	            );
	            list.add(resultVo);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 정리
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
	
	
	// 사용자 정보 조회
	public Map<String,Object> selectMyInfo(User u, Connection conn) {
		Map<String,Object> resultMap = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT u.user_id, g.grade_name, u.user_warn, u.user_name, u.user_phone, "
					+ "u.user_addr, u.user_detailAddr, u.user_extraAddr, u.user_postcode, u.user_email, "
					+ "q.question_str , u.user_answer "
					+ "FROM `user`u JOIN `user_grade` g ON u.grade_no=g.grade_no "
					+ "JOIN `question` q ON u.user_question=q.question_no "
					+ "where user_no=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,u.getUser_no());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				resultMap = new HashMap<String,Object>();
				resultMap.put("아이디",rs.getString("u.user_id"));
				resultMap.put("회원등급",rs.getString("g.grade_name"));
				resultMap.put("경고횟수",rs.getInt("u.user_warn"));
				resultMap.put("닉네임",rs.getString("u.user_name"));
				resultMap.put("전화번호",rs.getString("u.user_phone"));
				resultMap.put("기본주소",rs.getString("u.user_addr"));
				resultMap.put("상세주소",rs.getString("u.user_detailAddr"));
				resultMap.put("참고항목",rs.getString("u.user_extraAddr"));
				resultMap.put("우편번호",rs.getString("u.user_postcode"));
				resultMap.put("이메일",rs.getString("u.user_email"));
				resultMap.put("질문",rs.getString("q.question_str"));
				resultMap.put("답변",rs.getString("u.user_answer"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return resultMap;
	}
	
	// 작성글 조회(버디)
	public List<Buddy> selectBuddyList(int user_no, Connection conn) {
		List<Buddy> list = new ArrayList<Buddy>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT u.user_name, b.buddy_no, b.foody_no, b.user_no, b.report_no, "
				+ "b.buddy_approve, b.reg_date, b.buddy_title, b.buddy_main, b.buddy_view, "
				+ "b.party_name, b.meet_date, b.party_number, b.formation_date FROM `buddy_board` b "
				+ "JOIN `user` u ON b.user_no = u.user_no "
				+ "WHERE b.user_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_no);	
			rs = pstmt.executeQuery();
			while(rs.next()) {
					Buddy rsBuddy = new Buddy(
							 rs.getInt("buddy_no"),
							 rs.getInt("foody_no"),
							 rs.getInt("user_no"),
							 rs.getInt("report_no"),
							 rs.getString("buddy_approve"),
							 rs.getTimestamp("reg_date").toLocalDateTime(),
							 rs.getString("buddy_title"),
							 rs.getString("buddy_main"),
							 rs.getInt("buddy_view"),
							 rs.getString("party_name"),
							 rs.getTimestamp("meet_date").toLocalDateTime(),
							 rs.getInt("party_number"),
							 rs.getTimestamp("formation_date").toLocalDateTime(),
							 rs.getString("user_name")
							 );
					 list.add(rsBuddy);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list ;
	}
	
	// 작성글 조회(푸디)
	public List<Foody> selectFoodyList(int user_no, Connection conn) {
		List<Foody> list = new ArrayList<Foody>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM `foody_create` WHERE user_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_no);	
			rs = pstmt.executeQuery();
			while(rs.next()) {
					Foody rsFoody = new Foody(
							rs.getInt("foody_no"),
							rs.getInt("user_no"),
							rs.getInt("report_no"),
							rs.getString("foody_title"),
							rs.getString("foody_name"),
							rs.getInt("foody_taste"),
							rs.getInt("foody_clean"),
							rs.getString("foody_parking"),
							rs.getString("foody_delivery"),
							rs.getString("foody_main"), 
							rs.getTimestamp("reg_date").toLocalDateTime(),
							rs.getTimestamp("mod_date").toLocalDateTime(),
							rs.getString("foody_address"),
							rs.getInt("foody_click"),
							rs.getInt("foody_good")
							);
					list.add(rsFoody);
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list ;
	}

}
