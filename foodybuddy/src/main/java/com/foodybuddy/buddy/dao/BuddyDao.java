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
	public List<Buddy> selectBoardList(Buddy keyword, Connection conn){
		List<Buddy> list = new ArrayList<Buddy>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
		String sql = "SELECT * FROM `buddy_board`";
		 if(keyword.getBuddy_title() != null) {
			 sql += "WHERE `buddy_title` LIKE CONCAT('%','"+keyword.getBuddy_title()+"','%')";
		 }
		
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
					 rs.getTimestamp("formation_date").toLocalDateTime()	 
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
