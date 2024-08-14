       package com.foodybuddy.buddy.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.foodybuddy.buddy.vo.Buddy;

public class BuddyDao {
	// 버디 게시판 목록 및 검색
	public List<Buddy> selectBuddyList(Buddy keyword, Connection conn){
		List<Buddy> list = new ArrayList<Buddy>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String sql = "SELECT u.user_name, b.buddy_no, b.foody_no, b.user_no, b.report_no, "
					+ "b.buddy_approve, b.reg_date, b.buddy_title, b.buddy_main, b.buddy_view, IFNULL(COUNT(c.comment_no),0), "
					+ "b.party_name, b.meet_date, b.party_number, b.formation_date FROM `buddy_board` b "
					+ "JOIN `user` u ON b.user_no = u.user_no "
					+ "LEFT OUTER JOIN `buddy_comment` c ON c.buddy_no = b.buddy_no "
					+ "WHERE b.buddy_approve = 'Y'";
			
			// 정렬에 따른 where절 구문 추가(마감일자 임박순 관련 옵션)
			if(keyword.getSort()==3) {
				sql += " AND b.meet_date > NOW()";
			}
			
			// 검색 조건에 따른 sql문 추가
			if(keyword.getSearch_keyword() != null) {
				if(2 == Integer.parseInt(keyword.getSearch_option())) {
					sql += "AND `user_name` LIKE CONCAT('%','"+keyword.getSearch_keyword()+"','%')";				
				}else {
					sql += "AND `buddy_title` LIKE CONCAT('%','"+keyword.getSearch_keyword()+"','%')";
				}
			}
			 
			 // 댓글수를 카운트하기 위한 구문 추가
			 sql += " GROUP BY b.buddy_no";
			 
			 // 정렬에 대한 구문 추가
			 if(keyword.getSort()==1) {
				 // 최신순
				 sql += " ORDER BY b.reg_date DESC";
			 } else if(keyword.getSort()==2) {
				 // 조회수순
				 sql += " ORDER BY b.buddy_view DESC";
			 } else if(keyword.getSort()==3) {
				 // 마감일자 임박순
				 sql += " ORDER BY b.meet_date ASC, b.reg_date ASC";
			 }
			 
			 // 페이징 관련 구문 추가
				sql += " LIMIT "+keyword.getLimitPageNo()+", "+keyword.getNumPerPage();
			
			 pstmt = conn.prepareStatement(sql);
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
		return list;
	}
	
	// 페이징
	public int selectBuddyCount(Buddy keyword, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 검색조건이 없는 경우
			String sql = "SELECT COUNT(*) AS cnt FROM `buddy_board` b "
					+ "WHERE b.buddy_approve = 'Y'";
			
			// 정렬에 따른 where절 구문 추가(마감일자 임박순 관련 옵션)
			if(keyword.getSort()==3) {
				sql += " AND b.meet_date > NOW()";
			}
			
			// 검색 조건에 따른 sql문 추가
			if(keyword.getSearch_keyword() != null) {
				if(2 == Integer.parseInt(keyword.getSearch_option())) {
					sql += "AND `user_name` LIKE CONCAT('%','"+keyword.getSearch_keyword()+"','%')";				
				}else {
					sql += "AND `buddy_title` LIKE CONCAT('%','"+keyword.getSearch_keyword()+"','%')";
				}
			}
			 
			 // 댓글수를 카운트하기 위한 구문 추가
			 sql += " GROUP BY b.buddy_no";
			 
			 // 정렬에 대한 구문 추가
			 if(keyword.getSort()==1) {
				 // 최신순
				 sql += " ORDER BY b.reg_date DESC";
			 } else if(keyword.getSort()==2) {
				 // 조회수순
				 sql += " ORDER BY b.buddy_view DESC";
			 } else if(keyword.getSort()==3) {
				 // 마감일자 임박순
				 // sql += " b.meet_date ASC";
			 }
						 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 버디 게시글 열람
	public Map<String,Object> buddyPost(int buddy_no, Connection conn) {
		Map<String,Object> resultMap = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 조회수 +1
			String sql = "UPDATE `buddy_board` SET `buddy_view` = (`buddy_view` + 1) WHERE buddy_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buddy_no);
			
			int result = pstmt.executeUpdate();
			
			if(result>0) {
				// 글 조회
				sql = "SELECT u.user_no, u.user_name, b.buddy_no, b.buddy_title, b.buddy_main, "
						+ "b.party_name, b.meet_date, b.party_number, b.buddy_view, "
						+ "f.foody_no, f.foody_parking, f.foody_name, f.foody_address "
						+ "FROM `user` u JOIN `buddy_board` b ON u.user_no = b.user_no "
						+ "JOIN `foody_create` f ON f.foody_no = b.foody_no WHERE b.buddy_no = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, buddy_no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					resultMap = new HashMap<String,Object>();
					resultMap.put("작성자번호",rs.getString("u.user_no"));
					resultMap.put("작성자",rs.getString("u.user_name"));
					resultMap.put("글번호",rs.getInt("b.buddy_no"));
					resultMap.put("조회수",rs.getInt("b.buddy_view"));
					resultMap.put("글제목",rs.getString("b.buddy_title"));
					resultMap.put("글내용",rs.getString("b.buddy_main"));
					resultMap.put("모임이름",rs.getString("b.party_name"));
					resultMap.put("모임날짜",rs.getTimestamp("b.meet_date").toLocalDateTime());
					resultMap.put("모임인원",rs.getInt("b.party_number"));
					resultMap.put("원본글번호",rs.getString("f.foody_no"));
					resultMap.put("주차여부",rs.getString("f.foody_parking"));
					resultMap.put("가게이름",rs.getString("f.foody_name"));
					resultMap.put("가게주소",rs.getString("f.foody_address"));
				}
			}

		} catch(Exception e) {
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return resultMap;
	}
	
	// 버디 게시글 작성
	public int createBuddy(Buddy b, Connection conn) {
		int result = 0;		
		PreparedStatement pstmt = null;
		
		try {
			
			String sql = "INSERT INTO `buddy_board` "
					+ "(foody_no, user_no, buddy_title, buddy_main, "
					+ "party_name, meet_date, party_number) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, b.getFoody_no());
			pstmt.setInt(2, b.getUser_no());
			pstmt.setString(3, b.getBuddy_title());
			pstmt.setString(4, b.getBuddy_main());
			pstmt.setString(5, b.getParty_name());
			pstmt.setTimestamp(6, Timestamp.valueOf(b.getMeet_date()));
			pstmt.setInt(7, b.getParty_number());
			
			System.out.println("다오에서:"+Timestamp.valueOf(b.getMeet_date()));
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 버디 게시글 수정
	public int editBuddy(Buddy b, Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			String sql = "UPDATE `buddy_board` SET "
					+ "buddy_title = ? , buddy_main = ? , "
					+ "party_name = ? , meet_date = ? , party_number = ? "
					+ "WHERE buddy_no = ?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBuddy_title());
			pstmt.setString(2, b.getBuddy_main());
			pstmt.setString(3, b.getParty_name());
			pstmt.setTimestamp(4, Timestamp.valueOf(b.getMeet_date()));
			pstmt.setInt(5, b.getParty_number());
			pstmt.setInt(6, b.getBuddy_no());
			
			 result = pstmt.executeUpdate();
			
		    } catch (SQLException e) {
		        System.err.println("SQL 예외 발생: " + e.getMessage());
		        e.printStackTrace();
		    } catch (Exception e) {
		        System.err.println("예외 발생: " + e.getMessage());
		        e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int deleteBuddy(int buddy_no, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "DELETE FROM `buddy_board` WHERE buddy_no = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, buddy_no);
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
