package com.kh.app.member;

import com.kh.app.main.Main;

public class MemberInput {

	// 회원가입 입력 받기
	public MemberData inputSingUpData() {
		// 유저 데이터 입력받기
		System.out.print("아이디 : ");
		String memberId = Main.SC.nextLine();
		System.out.print("비밀번호 : ");
		String memberPw = Main.SC.nextLine();
		System.out.print("닉네임 : ");
		String memberNick = Main.SC.nextLine();
		
		MemberData data = new MemberData();
		data.setMemberId(memberId);
		data.setMemberPw(memberPw);
		data.setMemberNick(memberNick);
		
		return data;
	}

	// 로그인 입력 받기
	public MemberData inputSingInData() {
		// 유저 데이터 입력받기
		System.out.print("아이디 : ");
		String memberId = Main.SC.nextLine();
		System.out.print("비밀번호 : ");
		String memberPw = Main.SC.nextLine();
		
		MemberData data = new MemberData();
		data.setMemberId(memberId);
		data.setMemberPw(memberPw);
		
		return data;
	}
}
