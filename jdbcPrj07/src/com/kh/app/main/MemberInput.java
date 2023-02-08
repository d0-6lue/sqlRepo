package com.kh.app.main;

public class MemberInput {

	public MemberData join() {
		// 회원가입 데이터 입력 받기
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

	public MemberData login() {
		// 로그인 데이터 입력받기
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
