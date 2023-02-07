package com.kh.app.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) throws Exception {

		System.out.println("===== main =====");
		System.out.println("1. 회원가입");
		System.out.println("2. 로그인");

		// 연결정보
		String driver = "oracle.jdbc.driver.OracleDriver";

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "C##KH";
		String pw = "KH";

		// 드라이버 준비
		Class.forName(driver);

		// 커넥션 얻기
		Connection conn = DriverManager.getConnection(url, id, pw);

		// SQL 실행
		MemberService ms = new MemberService();
		// 회원가입
		ms.join(conn);
		// 로그인
		ms.login(conn);
		
		conn.close();

		System.out.println("프로그램 종료..");
	}// main method

}// Main class
