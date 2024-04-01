package com.develup.noramore.email.model.vo;

public class MemberAuth {
	private String memberEmail;
	private String memberAuth;
	
	
	
	public MemberAuth() {
		super();
	}



	public MemberAuth(String memberEmail, String memberAuth) {
		super();
		this.memberEmail = memberEmail;
		this.memberAuth = memberAuth;
	}



	public String getMemberEmail() {
		return memberEmail;
	}



	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}



	public String getMemberAuth() {
		return memberAuth;
	}



	public void setMemberAuth(String memberAuth) {
		this.memberAuth = memberAuth;
	}



	@Override
	public String toString() {
		return "MemberAuth [memberEmail=" + memberEmail + ", memberAuth=" + memberAuth + "]";
	}
	
	
	
	
}
