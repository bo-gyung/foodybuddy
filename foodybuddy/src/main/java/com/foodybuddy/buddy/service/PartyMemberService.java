package com.foodybuddy.buddy.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.foodybuddy.buddy.dao.PartyMemberDao;
import com.foodybuddy.buddy.vo.PartyMember;

public class PartyMemberService {
	// 모임 결성
	public int createPartyMember(PartyMember pm) {
		Connection conn = getConnection();
		
		int result = new PartyMemberDao().createPartyMember(pm, conn);
		close(conn);
		
		return result;
	}
	
	// 모임 삭제
	public void deletePartyMembers() {
        String sql = "DELETE FROM `party_member` WHERE `meet_date` <= CURDATE()";
        
        Connection conn = getConnection();
        
        try (
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int deletedRows = pstmt.executeUpdate();
            System.out.println("삭제된 모임 데이터 수: " + deletedRows);
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        close(conn);
		
    }
}
