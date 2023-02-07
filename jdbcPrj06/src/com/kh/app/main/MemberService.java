package com.kh.app.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class MemberService {

	public void join(Connection conn) throws Exception {
		// SQL
		Scanner sc = new Scanner(System.in);

		System.out.println("아이디 : ");
		String memberId = sc.nextLine();
		System.out.println("비밀번호 : ");
		String memberPw = sc.nextLine();
		System.out.println("닉네임 : ");
		String memberNick = sc.nextLine();
		// 회원가입
		String sql = "INSERT INTO MEMBER(ID, PW, NICK) VALUES(?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberId);
		pstmt.setString(2, memberPw);
		pstmt.setString(3, memberNick);
		int result = pstmt.executeUpdate();
		if (result == 1)
			System.out.println("회원 가입 성공!");
		else
			System.out.println("회원 가입 실패..");

		pstmt.close();
	}

	public void login(Connection conn) throws Exception {// 로그인
		// 로그인 정보 받기
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

		if (inputId.equals(dbId) && inputPw.equals(dbPw)) {
			System.out.println(dbId + "\t" + dbPw + "\t" + nick);
			System.out.println("로그인 성공!");
		} else {
			System.out.println("로그인 실패");
		}

		rs.close();
		pstmt.close();

	}
}
