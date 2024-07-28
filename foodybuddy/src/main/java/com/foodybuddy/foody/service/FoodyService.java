package com.foodybuddy.foody.service;


import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.foodybuddy.foody.dao.FoodyDao;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.foodyPic.vo.Foody_Pic;



public class FoodyService {
	
	
	
		
	public List<Foody_Pic> pick_Pic(int foody_no){
		Connection conn = getConnection();
		List<Foody_Pic> piclist = new FoodyDao().pick_Pic(foody_no ,conn);
		close(conn);
		return piclist;
	}
	
	public List<Foody_Pic> pick_Pic1(int foody_no){
		Connection conn = getConnection();
		List<Foody_Pic> piclist = new FoodyDao().pick_Pic(foody_no ,conn);
		close(conn);
		return piclist;
	}
	
	public int createBoard(Foody f) {
		Connection conn = getConnection();
		int result = new FoodyDao().createBoard(f,conn);
		close(conn);
		return result;
	}
	
	public int updateBoard(Foody f) {
		Connection conn = getConnection();
		int result = new FoodyDao().updateBoard(f,conn);
		close(conn);
		return result;
	}
	
	public int deleteFoody(int foody_no) {
		Connection conn = getConnection();
		int result = new FoodyDao().deleteFoody(foody_no,conn);
		close(conn);
		return result;
	}
	
	public int selectBoardCount(Foody option) {
		Connection conn = getConnection();
		int result = new FoodyDao().selectBoardCount(option,conn);
		close(conn);
		return result;
	}
	
	public int selectBoardTopCount(Foody option) {
		Connection conn = getConnection();
		int result = new FoodyDao().selectBoardTopCount(option,conn);
		close(conn);
		return result;
	}

	public List<Foody> selectBoardList(Foody option){
		Connection conn = getConnection();
		List<Foody> list = new FoodyDao().selectBoardList(option,conn);
		close(conn);
		return list;
	}
	
	public List<Foody> selectBoardTopList(Foody option){
		Connection conn = getConnection();
		List<Foody> list = new FoodyDao().selectBoardTopList(option,conn);
		close(conn);
		return list;
	}	
	
	
	public List<Foody> viewFoody(int no) {
		Connection conn = getConnection();
		List<Foody> result = new FoodyDao().viewFoody(no,conn);
		close(conn);
		return result ;
	}
	
	public List<Foody> viewFoody1(int no) {
		Connection conn = getConnection();
		List<Foody> result = new FoodyDao().viewFoody1(no,conn);
		close(conn);
		return result ;
	}
	
	public int findKey(Foody f) {
		Connection conn = getConnection();
		int key = new FoodyDao().findKey(f,conn);
		close(conn);
		return key;
	}
	
	public int insertPic(int findKey, String picName, boolean mainPic) {
        Connection conn = getConnection();
        int upload = new FoodyDao().insertPic(findKey, picName, mainPic, conn);
        close(conn);
        return upload;
    }
	
	public int goodCount(int foody_no , int user_no) {
		Connection conn = getConnection();
		int good = new FoodyDao().goodCount(foody_no , user_no , conn);
		close(conn);
		return good;
	}
	
	public int click(int click) {
		Connection conn = getConnection();
		int clickCount = new FoodyDao().click(click , conn);
		close(conn);
		return  clickCount;
	}
	
}

