package com.foodybuddy.common.sql;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		// 디비랑 직접 접근하는 정보?는 프로퍼티스에 숨긴다
		Connection conn = null;
		Properties prop = new Properties();
		try {
			// 프로퍼티스는 일반파일이라 경로 찾기가 어려워서 JDBC템플릿 경로 기준으로 설정해준다
			String path = JDBCTemplate.class.getResource("driver.properties").getPath();
			prop.load(new FileReader(path));
			Class.forName(prop.getProperty("driver"));
			String url = prop.getProperty("url");
			String user = prop.getProperty("username");
			String pw = prop.getProperty("userpw");
			conn = DriverManager.getConnection(url,user,pw);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}	
	
	public static void rollback(Connection conn){
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn) {
		try {
			if(conn != null && conn.isClosed() == false) {
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Statement와 PreparedStatement 모두 사용 가능(다형성)
	public static void close(Statement stmt) {
		try {
			if(stmt != null && stmt.isClosed() == false) {
				stmt.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs!= null && rs.isClosed() == false) {
				rs.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
