package com.foodybuddy.foody.service;


import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import static com.foodybuddy.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.foodybuddy.foody.dao.FoodyDao;
import com.foodybuddy.foody.vo.Foody;



public class FoodyService {
	
	public int createBoard(Foody f) {
		Connection conn = getConnection();
		int result = new FoodyDao().createBoard(f,conn);
		close(conn);
		return result;
	}
	
	public int selectBoardCount(Foody option) {
		Connection conn = getConnection();
		int result = new FoodyDao().selectBoardCount(option,conn);
		close(conn);
		return result;
	}

	public List<Foody> selectBoardList(Foody option){
		Connection conn = getConnection();
		List<Foody> list = new FoodyDao().selectBoardList(option,conn);
		close(conn);
		return list;
	}
	
	
}

