package com.develup.noramore.recrboard.model.vo;

import java.sql.Date;

public class RecrBoard implements java.io.Serializable {
	private static final long serialVersionUID = 3659973663458254242L;
	
	private int boardId; 				// 모집글 ID
	private String memberId; 			// 모집글 작성자ID
	private int categoryId;				// 카테고리ID
	private String title; 				// 모집글 제목
	private String context; 			// 모집글 내용
	private int reportCount; 			// 신고 횟수
	private int maxRecr;				// 모집 인원
	private int nowRecr; 				// 현재 인원
	private String RecrStatus;			// 모집 상태
	private Date RecrStartDate; 		// 모집시작일
	private Date RecrEndDate; 			// 모집종료일
	private String RecrOriginalFilename;//모집원본파일명
    private String RecrRenameFilename;	//모집변경파일명
	private Date RecrActStartDate; 		// 활동시작일시
	private Date RecrActEndDate; 		// 활동종료일시
	private String RecrLocation; 		// 위치정보
	private int commentCount; 			// 댓글 개수
	private int readCount; 				// 조회수
	private Date registrationDate; 		// 등록일자
	private Date lastUpdateDate; 		// 수정일자
    
	public RecrBoard() {
		super();
	}

	public RecrBoard(int boardId, String memberId, int categoryId, String title, String context, int reportCount,
			int maxRecr, int nowRecr, String recrStatus, Date recrStartDate, Date recrEndDate,
			String recrOriginalFilename, String recrRenameFilename, Date recrActStartDate, Date recrActEndDate,
			String recrLocation, int commentCount, int readCount, Date registrationDate, Date lastUpdateDate) {
		super();
		this.boardId = boardId;
		this.memberId = memberId;
		this.categoryId = categoryId;
		this.title = title;
		this.context = context;
		this.reportCount = reportCount;
		this.maxRecr = maxRecr;
		this.nowRecr = nowRecr;
		RecrStatus = recrStatus;
		RecrStartDate = recrStartDate;
		RecrEndDate = recrEndDate;
		RecrOriginalFilename = recrOriginalFilename;
		RecrRenameFilename = recrRenameFilename;
		RecrActStartDate = recrActStartDate;
		RecrActEndDate = recrActEndDate;
		RecrLocation = recrLocation;
		this.commentCount = commentCount;
		this.readCount = readCount;
		this.registrationDate = registrationDate;
		this.lastUpdateDate = lastUpdateDate;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public int getMaxRecr() {
		return maxRecr;
	}

	public void setMaxRecr(int maxRecr) {
		this.maxRecr = maxRecr;
	}

	public int getNowRecr() {
		return nowRecr;
	}

	public void setNowRecr(int nowRecr) {
		this.nowRecr = nowRecr;
	}

	public String getRecrStatus() {
		return RecrStatus;
	}

	public void setRecrStatus(String recrStatus) {
		RecrStatus = recrStatus;
	}

	public Date getRecrStartDate() {
		return RecrStartDate;
	}

	public void setRecrStartDate(Date recrStartDate) {
		RecrStartDate = recrStartDate;
	}

	public Date getRecrEndDate() {
		return RecrEndDate;
	}

	public void setRecrEndDate(Date recrEndDate) {
		RecrEndDate = recrEndDate;
	}

	public String getRecrOriginalFilename() {
		return RecrOriginalFilename;
	}

	public void setRecrOriginalFilename(String recrOriginalFilename) {
		RecrOriginalFilename = recrOriginalFilename;
	}

	public String getRecrRenameFilename() {
		return RecrRenameFilename;
	}

	public void setRecrRenameFilename(String recrRenameFilename) {
		RecrRenameFilename = recrRenameFilename;
	}

	public Date getRecrActStartDate() {
		return RecrActStartDate;
	}

	public void setRecrActStartDate(Date recrActStartDate) {
		RecrActStartDate = recrActStartDate;
	}

	public Date getRecrActEndDate() {
		return RecrActEndDate;
	}

	public void setRecrActEndDate(Date recrActEndDate) {
		RecrActEndDate = recrActEndDate;
	}

	public String getRecrLocation() {
		return RecrLocation;
	}

	public void setRecrLocation(String recrLocation) {
		RecrLocation = recrLocation;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	@Override
	public String toString() {
		return "RecrBoard [boardId=" + boardId + ", memberId=" + memberId + ", categoryId=" + categoryId + ", title="
				+ title + ", context=" + context + ", reportCount=" + reportCount + ", maxRecr=" + maxRecr
				+ ", nowRecr=" + nowRecr + ", RecrStatus=" + RecrStatus + ", RecrStartDate=" + RecrStartDate
				+ ", RecrEndDate=" + RecrEndDate + ", RecrOriginalFilename=" + RecrOriginalFilename
				+ ", RecrRenameFilename=" + RecrRenameFilename + ", RecrActStartDate=" + RecrActStartDate
				+ ", RecrActEndDate=" + RecrActEndDate + ", RecrLocation=" + RecrLocation + ", commentCount="
				+ commentCount + ", readCount=" + readCount + ", registrationDate=" + registrationDate
				+ ", lastUpdateDate=" + lastUpdateDate + "]";
	}

	
    
    
}// class
