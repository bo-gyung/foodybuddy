package com.foodybuddy.buddy.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.buddy.vo.Buddy;

public class BuddyDao {
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
}
