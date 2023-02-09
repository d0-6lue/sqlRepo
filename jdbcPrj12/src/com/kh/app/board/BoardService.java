package com.kh.app.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kh.app.jdbc.JdbcTemplate;
import com.kh.app.main.Main;

public class BoardService {

	// 게시글 작성
	public void write() throws Exception {
		
		// 로그인 여부 검사
		if(Main.LoginMemberNick == null) {
			System.out.println("글을 작성하시려면 로그인 해야합니다.");
			return;
		}
		
		System.out.print("제목 : ");
		String title = Main.SC.nextLine();
		System.out.print("내용 : ");
		String content = Main.SC.nextLine();

		Connection conn = JdbcTemplate.getConnection();
		String sql = "INSERT INTO BOARD(TITLE,CONTENT,WRITER,ENROLL_DATE) VALUES(?,?,?,SYSDATE)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, Main.LoginMemberNick);
		int result = pstmt.executeUpdate();

		if (result == 1) {
			System.out.println("글작성 성공");
		} else {
			System.out.println("글작성 실패..");
		}

		conn.close();
	}

	// 게시글 목록 조회
	public void show() throws Exception {
		Connection conn = JdbcTemplate.getConnection();
		String sql = "SELECT TITLE, WRITER, ENROLL_DATE FROM BOARD ORDER BY ENROLL_DATE DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			System.out.print("제목 : " + rs.getString("TITLE"));
			System.out.print(" / 작성자 : " + rs.getString("WRITER"));
			System.out.println(" / 작성일 : " + rs.getString("ENROLL_DATE"));
		}
		System.out.println();

		conn.close();
	}
}
