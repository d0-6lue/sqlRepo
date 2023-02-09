package com.kh.app.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PrintBoardAll {

	public static void printBoardAll(Connection conn) throws Exception {
		String sql = "SELECT TITLE, CONTENT, WRITER, ENROLL_DATE FROM BOARD";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			System.out.println("제목 : " + rs.getString("TITLE"));
			System.out.println("내용 : " + rs.getString("CONTENT"));
			System.out.println("작성자 : " + rs.getString("WRITER"));
			System.out.println("작성일 : " + rs.getString("ENROLL_DATE"));
			System.out.println();
		}
	}
	
}
