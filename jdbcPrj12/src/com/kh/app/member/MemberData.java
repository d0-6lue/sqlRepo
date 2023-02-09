package com.kh.app.member;

public class MemberData {

	private String memberId;
	private String memberPw;
	private String memberNick;
	
	public MemberData() { }
	
	public MemberData(String memberId, String memberPw, String memberNick) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberNick = memberNick;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	@Override
	public String toString() {
		return "MemberData [memberId=" + memberId + ", memberPw=" + memberPw + ", memberNick=" + memberNick + "]";
	}
}
