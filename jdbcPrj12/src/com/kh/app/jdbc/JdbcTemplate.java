package com.kh.app.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcTemplate {

	public static Connection getConnection() throws Exception {
		
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String id = "C##KH";
		String pw = "KH";
		
		return DriverManager.getConnection(url, id, pw);
	}
}
