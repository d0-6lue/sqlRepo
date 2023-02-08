package kh.com.app.main.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kh.com.app.main.Main;

public class BoardService {
	// 게시글 작성
	public void write(Connection conn) throws Exception {
		BoardInput bi = new BoardInput();
		BoardData data = bi.write();

		// SQL
		String sql = "INSERT INTO BOARD(TITLE, CONTENT, WRITER, ENROLL_DATE) VALUES(?,?,?,SYSDATE)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, data.getTitle());
		pstmt.setString(2, data.getContents());
		pstmt.setString(3, data.getWriter());

		int result = pstmt.executeUpdate();
		if (result == 1) {
			System.out.println("게시글 작성 완료");
		} else {
			System.out.println("게시글 작성 실패..");
		}
	}

	// 게시글 목록
	public void selectBoardList(Connection conn) throws Exception {
		String sql = "SELECT RPAD(TITLE,20) AS TITLE , RPAD(CONTENT,50) AS CONTENT , RPAD(WRITER,9) AS WRITER , TO_CHAR(ENROLL_DATE, 'YYYY\"년\"-MM\"월\"-DD\"일\" HH24\"시\" MM\"분\" SS\"초\"') AS ENROLL_DATE FROM BOARD";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			System.out.print("제목 : " + rs.getString("TITLE"));
			System.out.print("|작성자 : " + rs.getString("WRITER"));
			System.out.print("|작성일 : " + rs.getString("ENROLL_DATE"));
			System.out.println("");
		}

	}

	// 게시글 상세
	public void selectBoardone(Connection conn) {

	}

}
