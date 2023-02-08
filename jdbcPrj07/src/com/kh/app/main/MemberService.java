package com.kh.app.main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberService {

	//회원가입
	public void join(Connection conn) throws Exception {
		
		MemberInput mi = new MemberInput();
		MemberData data = mi.join();
		
		// SQL 실행
		String sql = "INSERT INTO MEMBER (ID, PW, NICK) VALUES(?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, data.getMemberId());
		pstmt.setString(2, data.getMemberPw());
		pstmt.setString(3, data.getMemberNick());
		int resutl = pstmt.executeUpdate();
		
		//회원가입 결과
		if(resutl == 1) {
			System.out.println("회원가입 성공!");
		}
		else {
			System.out.println("회원가입 실패....");
		}
	}
	
	
	//로그인
	public void login(Connection conn) throws Exception {
		MemberInput mi = new MemberInput();
		MemberData data = new MemberData();
		data = mi.login();
		
		//SQL 실행
		String sql = "SELECT ID, PW, NICK FROM MEMBER WHERE ID = ? AND PW = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, data.getMemberId());
		pstmt.setString(2, data.getMemberPw());
		ResultSet rs = pstmt.executeQuery();
		
		//rs 에서 데이터 꺼내기
		if(rs.next()) {
			String dbId = rs.getString("ID");
			String dbPw = rs.getString("PW");
			String dbNick = rs.getString("NICK");
			
			System.out.println(dbId);
			System.out.println(dbPw);
			System.out.println(dbNick);
			
			System.out.println("로그인 성공! " + dbNick + "님 환영합니다");
		}
		else {
			System.out.println("로그인 실패..");
		}
		
	}
	
	
	//회원목록 조회
	public void memberList(Connection conn) throws Exception {
		//SQL 실행
		String sql = "SELECT LPAD(ID, 10), LPAD(PW, 10), LPAD(NICK, 10) FROM MEMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String dbId = rs.getString("LPAD(ID,10)");
			String dbPw = rs.getString("LPAD(PW,10)");
			String dbNick = rs.getString("LPAD(NICK,10)");
			
			System.out.println(dbId + "/" + dbPw + "/" + dbNick);
		}
	}
}
