       package com.foodybuddy.buddy.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
				+ "b.buddy_approve, b.reg_date, b.buddy_title, b.buddy_main, IFNULL(COUNT(c.comment_no),0), "
				+ "b.party_name, b.meet_date, b.party_number, b.formation_date FROM `buddy_board` b "
				+ "JOIN `user` u ON b.user_no = u.user_no "
				+ "LEFT OUTER JOIN `buddy_comment` c ON c.buddy_no = b.buddy_no "
				+ "WHERE b.buddy_approve = 'Y'";
		// 검색 조건에 따른 sql문 추가
		 if(keyword.getBuddy_title() != null) {
			 sql += "AND `buddy_title` LIKE CONCAT('%','"+keyword.getBuddy_title()+"','%')";
		 }
		 
		 // 조회수를 카운트하기 위한 구문 추가
		 sql += " GROUP BY b.buddy_no";
		 
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
					 rs.getInt("IFNULL(COUNT(c.comment_no),0)"),
					 rs.getString("party_name"),
					 rs.getTimestamp("meet_date").toLocalDateTime(),
					 rs.getInt("party_number"),
					 rs.getTimestamp("formation_date").toLocalDateTime(),
					 rs.getString("user_name")
					 );
			 list.add(rsBuddy);
			 System.out.println(list);
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
			// cnt 별칭을 붙이는 이유? 여러개의 카운트가 생길 수 있다? 잘모르겟음
			String sql = "SELECT COUNT(*) AS cnt FROM `buddy_board` b";
			if(keyword.getBuddy_title()!=null) {
				sql += " WHERE Buddy_title LIKE CONCAT('%','"+keyword.getBuddy_title()+"','%')";
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
			String sql = "SELECT u.user_name, b.buddy_no, b.buddy_title, b.buddy_main, "
					+ "b.party_name, b.meet_date, b.party_number, "
					+ "f.foody_parking, f.foody_name, f.foody_address "
					+ "FROM `user` u JOIN `buddy_board` b ON u.user_no = b.user_no "
					+ "JOIN `foody_create` f ON f.foody_no = b.foody_no WHERE b.buddy_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buddy_no);
			rs = pstmt.executeQuery();
			
			 if(rs.next()) {
				 resultMap = new HashMap<String,Object>();
				 resultMap.put("작성자",rs.getString("u.user_name"));
				 resultMap.put("글번호",rs.getInt("b.buddy_no"));
				 resultMap.put("글제목",rs.getString("b.buddy_title"));
				 resultMap.put("글내용",rs.getString("b.buddy_main"));
				 resultMap.put("모임이름",rs.getString("b.party_name"));
				 resultMap.put("모임날짜",rs.getTimestamp("b.meet_date").toLocalDateTime());
				 resultMap.put("모임인원",rs.getInt("b.party_number"));
				 resultMap.put("주차여부",rs.getString("f.foody_parking"));
				 resultMap.put("가게이름",rs.getString("f.foody_name"));
				 resultMap.put("가게주소",rs.getString("f.foody_address"));
			 }
			
		} catch(Exception e) {
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return resultMap;
	}
	
}
