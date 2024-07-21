package com.foodybuddy.foody.dao;


import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.user.vo.User;
import com.foodybuddy.common.sql.Paging;
import com.foodybuddy.foodyPic.vo.Foody_Pic;

public class FoodyDao {
	
	public int deleteFoody(int foody_no , Connection conn) {
		PreparedStatement pstmt = null;
	      int result = 0;
	      try {
	          String sql = "DELETE FROM foody_create where foody_no = ? ";
	          pstmt = conn.prepareStatement(sql);
	          pstmt.setInt(1, foody_no);
	          
	          result = pstmt.executeUpdate();
	          
	      } catch (Exception e) {
	          e.printStackTrace();
	      } finally {
	          close(pstmt);
	      }
	      return result;
	}
  
	public int goodCount(int foody_no, int user_no, Connection conn) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int result = 0;

	    try {
	        
	        String check = "SELECT * FROM good_count WHERE foody_no = ? AND user_no = ?";
	        pstmt = conn.prepareStatement(check);
	        pstmt.setInt(1, foody_no);
	        pstmt.setInt(2, user_no);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            String deleteGood = "DELETE FROM good_count WHERE foody_no = ? AND user_no = ?";
	            pstmt = conn.prepareStatement(deleteGood);
	            pstmt.setInt(1, foody_no);
	            pstmt.setInt(2, user_no);
	            int delCheck = pstmt.executeUpdate();
	            
	            if(delCheck > 0) {
	            	String cancelCount = "UPDATE foody_create SET foody_good = CASE WHEN foody_good > 0 THEN foody_good - 1 ELSE 0 END WHERE foody_no = ?";
	            	pstmt = conn.prepareStatement(cancelCount);
	            	pstmt.setInt(1, foody_no);
	            	pstmt.executeUpdate();
	            	
	            	result = 0;
	            }
	        } else {
	            
	            String insertGood = "INSERT INTO good_count (foody_no, user_no) VALUES (?, ?)";
	            pstmt = conn.prepareStatement(insertGood);
	            pstmt.setInt(1, foody_no);
	            pstmt.setInt(2, user_no);
	            int inCheck = pstmt.executeUpdate();

	            if(inCheck > 0) {
	            	
	            	String plusCount = "UPDATE foody_create SET foody_good = foody_good + 1 WHERE foody_no = ?";
	            	pstmt = conn.prepareStatement(plusCount);
	            	pstmt.setInt(1, foody_no);
	            	pstmt.executeUpdate();
	            	
	            	result = 1;
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return result;
	}	
	
	public int createBoard(Foody f, Connection conn) {
      PreparedStatement pstmt = null;
      int result = 0;
      try {
          String sql = "INSERT INTO foody_create (foody_title, foody_name, foody_taste, foody_clean, "
                  + "foody_parking, foody_delivery, foody_main, foody_address ,user_no) VALUES (?, ?, ?, ?, ?, ?, ?, ? , ?)";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, f.getFoody_title());
          pstmt.setString(2, f.getFoody_name());
          pstmt.setInt(3, f.getFoody_taste());
          pstmt.setInt(4, f.getFoody_clean());
          pstmt.setString(5, f.getFoody_parking());
          pstmt.setString(6, f.getFoody_delivery());
          pstmt.setString(7, f.getFoody_main());
          pstmt.setString(8, f.getFoody_address());
          pstmt.setInt(9 , f.getUser_no());
          
          result = pstmt.executeUpdate();
          
      } catch (Exception e) {
          e.printStackTrace();
      } finally {
          close(pstmt);
      }
      return result;
  }
	
	public int updateBoard(Foody f, Connection conn) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      try {
	          String sql  = "UPDATE foody_create SET foody_title = ?, foody_name = ?, foody_taste = ?,"
	          		+ " foody_clean = ?, foody_parking = ?, foody_delivery = ?, foody_main = ?, foody_address = ?"
	          		+ " WHERE user_no = ? AND foody_no = ?";
	          pstmt = conn.prepareStatement(sql);
	          pstmt.setString(1, f.getFoody_title());
	          pstmt.setString(2, f.getFoody_name());
	          pstmt.setInt(3, f.getFoody_taste());
	          pstmt.setInt(4, f.getFoody_clean());
	          pstmt.setString(5, f.getFoody_parking());
	          pstmt.setString(6, f.getFoody_delivery());
	          pstmt.setString(7, f.getFoody_main());
	          pstmt.setString(8, f.getFoody_address());
	          pstmt.setInt(9 , f.getUser_no());
	          pstmt.setInt(10 , f.getFoody_no());
	          
	          result = pstmt.executeUpdate();
	          
	      } catch (Exception e) {
	          e.printStackTrace();
	      } finally {
	          close(pstmt);
	      }
	      return result;
	  }
  
  public int findKey(Foody f , Connection conn) {
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
      int key = 0;
      try {
          String sql = "SELECT foody_no FROM foody_create WHERE foody_title = ? AND foody_name = ? AND foody_taste = ? AND foody_clean = ? "
                  + " AND user_no = ? ";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, f.getFoody_title());
          pstmt.setString(2, f.getFoody_name());
          pstmt.setInt(3, f.getFoody_taste());
          pstmt.setInt(4, f.getFoody_clean());
          pstmt.setInt(5 , f.getUser_no());
          
          rs = pstmt.executeQuery();
          if(rs.next()) {
        	  key = rs.getInt("foody_no");
          }
          
      } catch (Exception e) {
          e.printStackTrace();
      } finally {
          close(rs);
    	  close(pstmt);
      }
      return key;
  }
  
  
  public int selectBoardCount(Foody option , Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM foody_create c LEFT JOIN user u ON c.user_no = u.user_no ";
			if(option.getFoody_title() != null) {
				sql += " WHERE foody_title LIKE CONCAT('%',"+option.getFoody_title()+",'%')";
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
  
  
	
	
  public int selectBoardTopCount(Foody option , Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM foody_create c LEFT JOIN user u ON u.user_no = c.user_no ";
			if(option.getFoody_title() != null) {
				sql += " WHERE foody_title LIKE CONCAT('%',"+option.getFoody_title()+",'%')";
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
  
  public List<Foody> selectBoardList(Foody option, Connection conn) {
	    List<Foody> list = new ArrayList<Foody>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        
	       String sql = "SELECT * FROM foody_create c LEFT JOIN user u ON u.user_no = c.user_no ";

	        if (option.getSearchOption() != null && !option.getSearchOption().isEmpty()) {
	            if (1==Integer.parseInt(option.getSearchOption()) && !option.getSearchBar().isEmpty()) {
	                sql += " WHERE u.user_name LIKE CONCAT('%','"+option.getSearchBar()+"','%')";
	                if("foody_good".equals(option.getSort())) {
	    	        	sql += " WHERE u.user_name LIKE CONCAT('%','"+option.getSearchBar()+"','%') ORDER BY c.foody_good DESC ";
	    	        }else {
	    	        	sql += " ORDER BY c.reg_date DESC " ;
	    	        }
	            } else if (2==Integer.parseInt(option.getSearchOption()) && !option.getSearchBar().isEmpty() ) {
	            	sql += " WHERE c.foody_title LIKE CONCAT('%','"+option.getSearchBar()+"','%')";
	            	if("foody_good".equals(option.getSort())) {
	    	        	sql += " WHERE u.user_name LIKE CONCAT('%','"+option.getSearchBar()+"','%') ORDER BY c.foody_good DESC ";
	    	        }else {
	    	        	sql += " ORDER BY c.reg_date DESC " ;
	    	        }
	            } else if (3==Integer.parseInt(option.getSearchOption()) && !option.getSearchBar().isEmpty() ) {
	            	sql += " WHERE c.foody_address LIKE CONCAT('%','"+option.getSearchBar()+"','%')";
	            	if("foody_good".equals(option.getSort())) {
	    	        	sql += " WHERE u.user_name LIKE CONCAT('%','"+option.getSearchBar()+"','%') ORDER BY c.foody_good DESC ";
	    	        }else {
	    	        	sql += " ORDER BY c.reg_date DESC " ;
	    	        }
	            } 
	        }else {
	        	
	        	if("foody_good".equals(option.getSort())) {
	        		sql += " ORDER BY c.foody_good DESC ";
	        	}else {
	        		sql += " ORDER BY c.reg_date DESC " ;
	        	}
	        }

	        
	        sql += " LIMIT " + option.getLimitPageNo() + " , " + option.getNumPerPage();

	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Foody resultVo = new Foody(
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

	            list.add(resultVo);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return list;
	}


	
	public List<Foody> selectBoardTopList(Foody option, Connection conn) {
	    List<Foody> list = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String sql = "SELECT * FROM foody_create c LEFT JOIN user u ON u.user_no = c.user_no WHERE MONTH(c.reg_date) = ? - 1  ORDER BY foody_good DESC LIMIT 3";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, LocalDateTime.now().getMonthValue()); // 현재 달의 값으로 설정

	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            Foody resultVo = new Foody(
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

	            list.add(resultVo);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return list;
	}

	public List<Foody_Pic> pick_Pic(int foody_no , Connection conn){
		List<Foody_Pic> piclist = new ArrayList<Foody_Pic>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			try {
			String sql = "SELECT * FROM foody_picture WHERE foody_no = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, foody_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Foody_Pic resultVo = new Foody_Pic(
						rs.getInt("pic_num"),
						rs.getInt("foody_no"),
						rs.getString("pic_sub"),
						rs.getInt("pic_main") == 1 );
				
				piclist.add(resultVo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return piclist;
	}
	
	public List<Foody_Pic> pick_Pic1(int foody_no , Connection conn){
		List<Foody_Pic> piclist = new ArrayList<Foody_Pic>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			try {
			String sql = "SELECT * FROM foody_picture WHERE foody_no = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, foody_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Foody_Pic resultVo = new Foody_Pic(
						rs.getInt("pic_num"),
						rs.getInt("foody_no"),
						rs.getString("pic_sub"),
						rs.getInt("pic_main") == 1 );
				
				piclist.add(resultVo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return piclist;
	}
		
	
	
	public List<Foody> viewFoody(int no,Connection conn){
		List<Foody> list = new ArrayList<Foody>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			String sql = "SELECT * FROM foody_create c LEFT JOIN user u ON u.user_no = c.user_no WHERE c.foody_no = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Foody resultVo = new Foody(rs.getInt("foody_no"),
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
						rs.getString("user_name"));
				
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
	
	public List<Foody> viewFoody1(int no,Connection conn){
		List<Foody> list = new ArrayList<Foody>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			String sql = "SELECT * FROM foody_create c LEFT JOIN user u ON u.user_no = c.user_no WHERE c.foody_no = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Foody resultVo = new Foody(rs.getInt("foody_no"),
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
						rs.getString("user_name"));
				
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
	
	public int insertPic(int findKey, String picName, boolean mainPic, Connection conn) {
        PreparedStatement pstmt = null;
        int success = 0;
        try {
            String sql = "INSERT INTO foody_picture (foody_no, pic_sub, pic_main) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, findKey);
            pstmt.setString(2, picName);
            pstmt.setBoolean(3, mainPic);
            success = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return success;
    }
	

	public int click(int click , Connection conn) {
		PreparedStatement pstmt = null;
        int clickCount = 0;
        try {
            String sql = "UPDATE foody_create SET foody_click = foody_click + 1 WHERE foody_no = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, click);
            clickCount = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return clickCount;
    }
	
}



