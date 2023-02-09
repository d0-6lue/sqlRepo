package com.kh.app.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Main {

	public static void main(String[] args) throws Exception {

		// DB연결 ( 드라이버 준비, 커넥션 얻기 )
		// project -> properties -> Java Build Path -> Libraries -> Add External JARs
		/*
		 * 드라이버 준비 String driver = "oracle.jdbc.driver.OracleDriver";
		 * Class.forName("oracle.jdbc.OracleDriver");
		 */
		// 접속 정보
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "C##KH";
		String pw = "KH";

		// 커넥션 얻기
		// Connection conn 생성F
		Connection conn = DriverManager.getConnection(url, id, pw);

		// SQL ( 쿼리문, Statement 준비, 실행)
		String sql = "INSERT INTO MEMBER(ID, PW, NICK) VALUES(?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "user004");
		pstmt.setString(2, "12345");
		pstmt.setString(3, "oㅁo");
		int result = pstmt.executeUpdate();

		if (result == 1) {
			System.out.println("회원가입 성공!");
		} else {
			System.out.println("회원가입 실패..");
		}

		conn.close();
	} // main method
} // Main Class
