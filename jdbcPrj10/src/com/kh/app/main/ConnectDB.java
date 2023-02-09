package com.kh.app.main;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {

	public static Connection connectDB() throws Exception {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "C##KH";
		String pw = "KH";

		return DriverManager.getConnection(url, id, pw);
	}

}
