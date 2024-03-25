package com.develup.noramore.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable  {
	private static final long serialVersionUID = 8027014658748663307L;
	
	
	//Field
	private String memberId;      //ȸ�����̵�
	private String memberPWD;       //��й�ȣ
	private String memberName;      //�̸�
	private String socialId;       //�ֹε�Ϲ�ȣ
	private String email;          //�̸���
	private String photoFilename;    //ȸ���������ϸ�
	private String resign;         //ȸ��Ż��
	private String adminYN;        //�����ڿ���
	private String signType;       //�α��� ����
	private String actLimit;        //�������
	private Date registDate;       //������� 
	private Date modifiedDate;     //������������
	
	
	
	
	
	//Constructor
	public Member() {
		super();
	}



	public Member(String memberId, String memberPWD, String memberName, String socialId, String email,
			String photoFilename, String resign, String adminYN, String signType, String actLimit, Date registDate,
			Date modifiedDate) {
		super();
		this.memberId = memberId;
		this.memberPWD = memberPWD;
		this.memberName = memberName;
		this.socialId = socialId;
		this.email = email;
		this.photoFilename = photoFilename;
		this.resign = resign;
		this.adminYN = adminYN;
		this.signType = signType;
		this.actLimit = actLimit;
		this.registDate = registDate;
		this.modifiedDate = modifiedDate;
	}



	//getters and setters
	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public String getMemberPWD() {
		return memberPWD;
	}



	public void setMemberPWD(String memberPWD) {
		this.memberPWD = memberPWD;
	}



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getSocialId() {
		return socialId;
	}



	public void setSocialId(String socialId) {
		this.socialId = socialId;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhotoFilename() {
		return photoFilename;
	}



	public void setPhotoFilename(String photoFilename) {
		this.photoFilename = photoFilename;
	}



	public String getResign() {
		return resign;
	}



	public void setResign(String resign) {
		this.resign = resign;
	}



	public String getAdminYN() {
		return adminYN;
	}



	public void setAdminYN(String adminYN) {
		this.adminYN = adminYN;
	}



	public String getSignType() {
		return signType;
	}



	public void setSignType(String signType) {
		this.signType = signType;
	}



	public String getActLimit() {
		return actLimit;
	}



	public void setActLimit(String actLimit) {
		this.actLimit = actLimit;
	}



	public Date getRegistDate() {
		return registDate;
	}



	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}



	public Date getModifiedDate() {
		return modifiedDate;
	}



	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}



	
	
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPWD=" + memberPWD + ", memberName=" + memberName
				+ ", socialId=" + socialId + ", email=" + email + ", photoFilename=" + photoFilename + ", resign="
				+ resign + ", adminYN=" + adminYN + ", signType=" + signType + ", actLimit=" + actLimit
				+ ", registDate=" + registDate + ", modifiedDate=" + modifiedDate + "]";
	}

	
	
	
	
}
