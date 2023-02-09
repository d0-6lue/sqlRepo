package com.kh.app.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kh.app.jdbc.JdbcTemplate;
import com.kh.app.main.Main;

public class MemberService {

	private final MemberInput MI = new MemberInput();
	private MemberData data = new MemberData();

	// 회원가입
	public void signUp() throws Exception {

		data = MI.inputSingUpData();

		// INSERT
		Connection conn = JdbcTemplate.getConnection();
		String sql = "INSERT INTO MEMBER(ID,PW,NICK) VALUES(?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, data.getMemberId());
		pstmt.setString(2, data.getMemberPw());
		pstmt.setString(3, data.getMemberNick());
		int result = pstmt.executeUpdate();

		// 결과에 따른 처리
		if (result == 1) {
			System.out.println("회원가입 성공!");
		} else {
			System.out.println("회원가입 실패..");
		}

		conn.close();
	}

	// 로그인
	public void signIn() throws Exception {

		data = MI.inputSingInData();

		// SELECT
		Connection conn = JdbcTemplate.getConnection();
		String sql = "SELECT ID,PW,NICK FROM MEMBER WHERE ID LIKE ? AND PW LIKE ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, data.getMemberId());
		pstmt.setString(2, data.getMemberPw());
		ResultSet rs = pstmt.executeQuery();

		// 결과 집합에서 데이터 꺼내기
		if (rs.next()) {
			Main.LoginMemberNick = rs.getString("NICK");
			System.out.println("로그인 성공!");
			System.out.println(Main.LoginMemberNick + "님 환영합니다.");
		} else {
			System.out.println("로그인 실패..");
		}

		conn.close();
	}
}
