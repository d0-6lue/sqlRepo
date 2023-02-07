package com.kh.app.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		System.out.println("===== main =====");
		
		// 연결 정보
		String driver = "oracle.jdbc.driver.OracleDriver";
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "C##KH";
		String pw = "KH";
		
		// 드라이버 등록
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.err.println("드라이버 등록 실패..");
			e.printStackTrace();
		}
		
		// 드라이버 사용해서 커넥션 얻기
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, id, pw);
		} catch (SQLException e) {
			System.err.println("커넥션 얻어오기 실패..");
			e.printStackTrace();
		}
		
		
		Scanner sc = new Scanner(System.in);
		System.out.print("아이디 : ");
		String inputId = sc.nextLine();
		System.out.print("비밀번호 : ");
		String inputPw = sc.nextLine();
		System.out.print("닉네임 : ");
		String inputNick = sc.nextLine();
		
		// SQL
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e1) {
			System.err.println("Statement 생성 실패..");
			e1.printStackTrace();
		}
//		
//		String s = "INSERT INTO MEMBER(ID, PW, NICK) VALUES('" + inputId + "', '" + inputPw + "', '" + inputNick + "')";
//		try {
//			stmt.execute(s);
//		} catch (SQLException e1) {
//			System.err.println("execute 실패..");
//			e1.printStackTrace();
//		}
		
		String s = "INSERT INTO MEMBER(ID, PW, NICK) VALUES(?, ?, ?)";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(s);
			pstmt.setString(1, inputId);
			pstmt.setString(2, inputPw);
			pstmt.setString(3, inputNick);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("회원가입 결과 : " + result);
		if(result == 1) {
			System.out.println("회원가입 성공!");
		}
		else {
			System.out.println("회원가입 실패...");
		}
		
		
//		ResultSet rs = null;
//		String s2 = "SELECT LPAD(ID, 20), LPAD(PW, 20), LPAD(NICK, 20) FROM MEMBER";
//		try {
//			rs = stmt.executeQuery(s2);
//		} catch (SQLException e1) {
//			System.err.println("execute 실패..");
//			e1.printStackTrace();
//		}
//		try {
//			while(rs.next()) {
//				System.out.println(rs.getString(1) + rs.getString(2) + rs.getString(3));
//			}
//		} catch (SQLException e1) {
//			e1.printStackTrace();
//		}
		
		
		// 커넥션 정리
		
		try {
			conn.close();
//			rs.close();
			stmt.close();
			pstmt.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
		System.out.println("프로그램 종료...");
		
	} // main method

} // Main class
