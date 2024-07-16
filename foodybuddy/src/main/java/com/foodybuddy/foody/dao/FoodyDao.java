package com.foodybuddy.foody.dao;


import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.common.sql.Paging;

public class FoodyDao {
  
  public int createBoard(Foody f, Connection conn) {
      PreparedStatement pstmt = null;
      int result = 0;
      try {
          String sql = "INSERT INTO foody_create (foody_title, foody_name, foody_taste, foody_clean, "
                  + "foody_parking, foody_main, foody_address, reg_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, f.getFoody_title());
          pstmt.setString(2, f.getFoody_name());
          pstmt.setInt(3, f.getFoody_taste());
          pstmt.setInt(4, f.getFoody_clean());
          pstmt.setString(5, f.getFoody_parking());
          pstmt.setString(6, f.getFoody_delivery());
          pstmt.setString(7, f.getFoody_address());
          pstmt.setTimestamp(8, Timestamp.valueOf(f.getReg_date()));
          
          result = pstmt.executeUpdate();
          
      } catch (Exception e) {
          e.printStackTrace();
      } finally {
          close(pstmt); // Close statement
      }
      return result;
  }
  
  
  public int selectBoardCount(Foody option , Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM board ";
			if(option.getFoody_title() != null) {
				sql += " WHERE board_title LIKE CONCAT('%',"+option.getFoody_title()+",'%')";
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
	
	
	public List<Foody> selectBoardList(Foody option,Connection conn){
		List<Foody> list = new ArrayList<Foody>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
//			// 검색 조건
//			// X : SELECT * FROM board
//			// O : SELECT * FROM board WHERE board_title LIKE CONCAT('%',board_title,'%')
//			String sql = "SELECT * FROM board";
//			if(option.getFoody_title() != null) {
//				sql += " WHERE board_title LIKE CONCAT('%',"+option.getFoody_title()+",'%')";
//			}
//			sql += " LIMIT "+option.getLimitPageNo()+", "+option.getNumPerPage();
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				Foody resultVo = new Foody(rs.getInt("foody_no"),
//						rs.getString("foody_title"),
//						rs.getInt("board_writer"),
//						rs.getTimestamp("reg_date").toLocalDateTime(),
//						rs.getInt("foody_click"),
//						rs.getInt("foody_good"));
//				
//				list.add(resultVo);
//			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}



