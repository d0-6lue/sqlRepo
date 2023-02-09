package com.kh.app.main;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ExecuteQuery {

	public static void write(Connection conn) throws Exception {
		String sql = "INSERT INTO BOARD(TITLE, CONTENT, WRITER, ENROLL_DATE) VALUES(?,?,?,SYSDATE)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "title0109");
		pstmt.setString(2, "content0109");
		pstmt.setString(3, "writer0109");
		int result = pstmt.executeUpdate();

		if (result == 1) {
			System.out.println("글작성 성공!");
		} else {
			System.out.println("글작성 실패..");
		}
	}

}
