package com.kh.app.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) throws Exception {
		
		System.out.println("===== main(login) =====");
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "C##KH";
		String pw = "KH";
		
		
		// 드라이버 등록
		Class.forName(driver);
		
		// 드라이버 사용해서 커넥선 얻기
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		//로그인 정보 받기
		Scanner sc = new Scanner(System.in);
		System.out.print("아이디 : ");
		String inputId = sc.nextLine();
		System.out.print("비밀번호 : ");
		String inputPw = sc.nextLine();
		
		// SQL
		String sql1 = "SELECT ID, PW, NICK FROM MEMBER WHERE ID = ? AND PW =?";
		PreparedStatement pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, inputId);
		pstmt.setString(2, inputPw);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		String dbId = rs.getString("ID");
		String dbPw = rs.getString("PW");
		String nick = rs.getString("NICK");
		
		if(inputId.equals(dbId) && inputPw.equals(dbPw)) {
			System.out.println(dbId + "\t" + dbPw + "\t" + nick);
			System.out.println("로그인 성공!");
		}
		else {
			System.out.println("로그인 실패");
		}
			
		
		// conn 반납
		rs.close();
		pstmt.close();
		conn.close();
		
		System.out.println("프로그램 종료...");
		
	} // main method

} // Main class
