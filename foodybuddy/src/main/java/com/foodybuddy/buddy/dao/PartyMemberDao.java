package com.foodybuddy.buddy.dao;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import com.foodybuddy.buddy.vo.PartyMember;

public class PartyMemberDao {
	// 모임 결성
	public int createPartyMember(PartyMember pm, Connection conn) {
		int result = 0;		
		PreparedStatement pstmt = null;
		
		try {
			
			String sql = "INSERT INTO `party_member` "
					+ "(member_no, buddy_no, meet_date) "
					+ "VALUES (?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pm.getMember_no());
			pstmt.setInt(2, pm.getBuddy_no());
			pstmt.setTimestamp(3, Timestamp.valueOf(pm.getMeet_date()));
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
