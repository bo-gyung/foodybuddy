package com.foodybuddy.userpage.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.foodybuddy.buddy.vo.Buddy;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.user.vo.User;
import com.foodybuddy.userpage.vo.QnA;

public class UserPageDao {
	
	//회원 삭제 
	
    public boolean deleteUser(Connection conn, int userNo) {
        PreparedStatement pstmt = null;
        boolean isDeleted = false;
        try {
            String sql = "DELETE FROM `user` WHERE user_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userNo);
            int rowsAffected = pstmt.executeUpdate();
            isDeleted = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return isDeleted;
    }

	

	//비밀번호 확인 메소드
	public boolean checkPassword(Connection conn, String userId, String password) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean isPasswordCorrect = false;
    try {
        String sql = "SELECT user_pw FROM `user` WHERE user_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String dbPassword = rs.getString("user_pw");
            isPasswordCorrect = dbPassword.equals(password);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        close(rs);
        close(pstmt);
    }
    return isPasswordCorrect;
}

	// user_no 조회 메소드
	public int getUserNoById(Connection conn, String userId) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int userNo = -1;
    try {
        String sql = "SELECT user_no FROM `user` WHERE user_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            userNo = rs.getInt("user_no");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        close(rs);
        close(pstmt);
    }
    return userNo;
}
	
		
	
	//글 제목 클릭시 상세내용
	public Map<String,Object> qnaDetail(int qna_no, Connection conn){
		
		Map<String,Object> resultM = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String sql = "SELECT qna_title "
					+ ", qna_content "
					+ ", qna_answer "
					+ ", qna_no "
					+ ", mod_date "
					+ "FROM user_qna "
					+ "WHERE qna_no = ?;";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_no);
			rs = pstmt.executeQuery();
			
			// 안에 뭐가있을까~
			if(rs.next()) {
				resultM = new HashMap<String,Object>();
				resultM.put("qnaNo", rs.getInt("qna_no"));
				resultM.put("title", rs.getString("qna_title"));
				resultM.put("content", rs.getString("qna_content"));
				resultM.put("modDate", rs.getTimestamp("mod_date").toLocalDateTime());
				// 관리자 응답추가야
				resultM.put("ansContent", rs.getString("qna_answer")); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return resultM;
	}
	
	//qna 게시글 삭제
	public int deleteQnA(int qna_no, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "DELETE FROM `user_qna` WHERE qna_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_no);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	//qna게시글 수정
	public int updateQnA(String title, String content, int qna_no, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "UPDATE user_qna SET qna_title = ?, qna_content = ?, mod_date = NOW() WHERE qna_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, qna_no);
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
	

	//qna게시글 검색
	public List<QnA> selectQnAList(QnA option, Connection conn){
		List<QnA> list = new ArrayList<QnA>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
	        // 기본 SQL 쿼리
	        String sql = "SELECT * FROM user_qna ";

	        // 검색 조건이 있는 경우 추가
	        if(option.getQna_title() != null && !option.getQna_title().isEmpty()) {
	            sql += "WHERE qna_title LIKE CONCAT('%', ?, '%') ";
	        }
	        // 오더바이 조건 추가
	        sql += "GROUP BY qna_no ";
	        sql += "ORDER BY reg_date DESC ";
	        // 페이징 조건 추가
	        sql += "LIMIT ?, ?";

	        pstmt = conn.prepareStatement(sql);

	        int paramIndex = 1;

	        // 검색 조건이 있는 경우 파라미터 설정
	        if(option.getQna_title() != null && !option.getQna_title().isEmpty()) {
	            pstmt.setString(paramIndex++, option.getQna_title());
	        }

	        // 페이징 파라미터 설정
	        pstmt.setInt(paramIndex++, option.getLimitPageNo());
	        pstmt.setInt(paramIndex++, option.getNumPerPage());

	        rs = pstmt.executeQuery();
	        while(rs.next()) {
	        	// 수정날짜 보일듯 안보일듯
	        	LocalDateTime modDate = rs.getTimestamp("mod_date") != null ? rs.getTimestamp("mod_date").toLocalDateTime() : null;
	           
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
	    } catch(SQLException e) {
	        e.printStackTrace();
	    } finally {
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
				+ "b.buddy_approve, b.reg_date, b.buddy_title, b.buddy_main, b.buddy_view, IFNULL(COUNT(c.comment_no),0), "
				+ "b.party_name, b.meet_date, b.party_number, b.formation_date FROM `buddy_board` b "
				+ "JOIN `user` u ON b.user_no = u.user_no "
				+ "LEFT OUTER JOIN `buddy_comment` c ON c.buddy_no = b.buddy_no "
				+ "WHERE b.user_no = ? GROUP BY b.buddy_no";
		
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
							 rs.getString("user_name"),
							 rs.getInt("IFNULL(COUNT(c.comment_no),0)")
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
		String sql = "SELECT * FROM foody_create c LEFT JOIN user u ON u.user_no = c.user_no  WHERE c.user_no = ?";
		
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
		                rs.getInt("foody_good"),
		                rs.getString("ori_picture"),
		                rs.getString("new_picture"),
		                rs.getString("user_name")
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
