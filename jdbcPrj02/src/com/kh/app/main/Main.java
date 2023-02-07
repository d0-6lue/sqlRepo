package com.kh.app.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {

	public static void main(String[] args) {
		
		System.out.println("===== main =====");
		
		/*
		 * 1. ojdbc jar 파일 준비 (프로젝트 연결)
		 * 	프로젝트 -> Properties -> Java Build Path -> Libraries -> Classpath -> Add External JARs
		 * 2. 드라이버 등록
		 * 3. 커넥션 객체 얻기
		 * 4. SQL 실행
		 * 5. 커넥션 정리
		 */
		
		
		// 드라이버 준비
		// oracle 패키지 안의 jdbc 패키지 안의 driver 패키지 안의 OracleDriver 클래스
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 연결 정보
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "C##KH";
		String pw = "KH";
		
		// 드라이버 사용해서 커넥션 얻기
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, id, pw);
		} catch (SQLException e) {
			System.err.println("getConnection 실패");
			e.printStackTrace();
		}
		
		// SQL 실행
		String s = "INSERT INTO MEMBER(ID, PW, NICK)\r\n"
				+ "            VALUES('USER05', '2222', '@_@')";
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			System.err.println("stmt.createStatement 실패");
			e.printStackTrace();
		}
		try {
			stmt.execute(s);
		} catch (SQLException e) {
			System.err.println("stmt.execute 실패");
			e.printStackTrace();
		}
		
		// conn 정리
		try {
			conn.close();
		} catch (SQLException e) {
			System.err.println("conn.close 실패");
			e.printStackTrace();
		}
		
		System.out.println("프로그램 종료..");
		
	} // main method

} // Main class
