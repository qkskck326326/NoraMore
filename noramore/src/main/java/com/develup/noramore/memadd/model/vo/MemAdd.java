package com.develup.noramore.memadd.model.vo;

public class MemAdd implements java.io.Serializable{
	private static final long serialVersionUID = 5681507755826042927L;
	
	//Field
	private String memberId;     //회원아이디
	private int heartBeat;     //하트비트
	private String grade;       //등급
	private int articleCount;  //활동건수
	private int reportCount;    //신고건수
	
	
	
	
	//Constructor
	public MemAdd() {
		super();
	}


	public MemAdd(String memberId, int heartBeat, String grade, int articleCount, int reportCount) {
		super();
		this.memberId = memberId;
		this.heartBeat = heartBeat;
		this.grade = grade;
		this.articleCount = articleCount;
		this.reportCount = reportCount;
	}


	
	//getters and setters
	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getHeartBeat() {
		return heartBeat;
	}


	public void setHeartBeat(int heartBeat) {
		this.heartBeat = heartBeat;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public int getArticleCount() {
		return articleCount;
	}


	public void setArticleCount(int articleCount) {
		this.articleCount = articleCount;
	}


	public int getReportCount() {
		return reportCount;
	}


	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}


	
	
	@Override
	public String toString() {
		return "MemAdd [memberId=" + memberId + ", heartBeat=" + heartBeat + ", grade=" + grade + ", articleCount="
				+ articleCount + ", reportCount=" + reportCount + "]";
	}

	
	
	
	

}
