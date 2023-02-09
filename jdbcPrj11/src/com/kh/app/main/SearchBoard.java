package com.kh.app.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class SearchBoard {

	public static final Scanner SC = new Scanner(System.in);

	public static void searchBoard(Connection conn) throws Exception {
		String searchInput = "";
		while (!searchInput.equals("-1")) {
			System.out.print("검색 : ");
			searchInput = SC.nextLine();

			String sql = "SELECT TITLE, CONTENT, WRITER, ENROLL_DATE FROM BOARD WHERE TITLE LIKE ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchInput+"%");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println("제목 : " + rs.getString("TITLE"));
				System.out.println("내용 : " + rs.getString("CONTENT"));
				System.out.println("작성자 : " + rs.getString("WRITER"));
				System.out.println("작성일 : " + rs.getString("ENROLL_DATE"));
				System.out.println();
			}
		}
		System.out.println("종료함...");

	}

}
