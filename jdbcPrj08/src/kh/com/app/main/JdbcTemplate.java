package kh.com.app.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcTemplate {

	public static Connection getConnection() throws Exception {

		// 연결 정보
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "C##KH";
		String pw = "KH";

		// 커넥션 얻기
		return DriverManager.getConnection(url, id, pw);
	}

}
