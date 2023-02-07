package com.kh.app.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {

	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		
		System.out.println("===== main(jdbc) =====");
		
		
		// QUERY문     결과
		/*
		 * SELECT -> RS(RESULT SET)
		 * 
		 * INSERT
		 * UPDATE -> INT
		 * DELETE
		 */
		
		// [ojdbc]
		/*
		 * Projcet 우클릭
		 * -> Properties
		 * -> Libraries
		 * -> Classpath
		 * -> Add External JARs
		 * + ojdbc
		 */
		
		/*
		 * CONN
		 * STMT
		 */
		
		// Connection 객체 얻기
		
		// 드라이버 준비
		Class.forName("oracle.jdbc.OracleDriver");
		// 연결정보
		// jdbc:oracle:thin:@[IP주소]:[포트번호]:[SID값]
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String id = "C##KH";
		String pw = "KH";
		// 커넥션 얻기
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		// 쿼리문 실행
		
		// INSERT
		String sql = "INSERT INTO MEMBER(ID, PW, NICK) VALUES('USER01', '1234', 'X_X')";
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		
		// 자원 정리
		conn.close();
		
		System.out.println("프로그램 종료..");
		
	} // main method

} // Main class
