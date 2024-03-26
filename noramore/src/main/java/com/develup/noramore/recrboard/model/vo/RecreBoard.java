package com.develup.noramore.recrboard.model.vo;

import java.sql.Date;

public class RecreBoard implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3659973663458254242L;
	
	private int boardId; 				// ������ ID
    private String memberId; 			// ������ �ۼ���ID
    private int categoryId;				// ī�װ�ID
    private String title; 				// ������ ����
    private String context; 			// ������ ����
    private int reportCount; 			// �Ű� Ƚ��
    private int maxRecr;				// ���� �ο�
    private int nowRecr; 				// ���� �ο�
    private String RecrStatus;			// ������ ����
    private Date RecrStartDate; 		// ����������
    private Date RecrEndDate; 			// ����������
    private Date RecrActStartDate; 		// Ȱ�������Ͻ�
    private Date RecrActEndDate; 		// Ȱ�������Ͻ�
    private String RecrLocation; 		// ��ġ����
    private int commentCount; 			// ��� ����
    private int readCount; 				// ��ȸ��
    private Date registrationDate; 		// �������
    private Date lastUpdateDate; 		// ��������
    
	public RecreBoard() {
		super();
	}

	public RecreBoard(int boardId, String memberId, int categoryId, String title, String context, int reportCount,
			int maxRecr, int nowRecr, String RecrStatus, Date RecrStartDate,
			Date RecrEndDate, Date RecrActStartDate, Date RecrActEndDate,
			String RecrLocation, int commentCount, int readCount, Date registrationDate, Date lastUpdateDate) {
		super();
		this.boardId = boardId;
		this.memberId = memberId;
		this.categoryId = categoryId;
		this.title = title;
		this.context = context;
		this.reportCount = reportCount;
		this.maxRecr = maxRecr;
		this.nowRecr = nowRecr;
		this.RecrStatus = RecrStatus;
		this.RecrStartDate = RecrStartDate;
		this.RecrEndDate = RecrEndDate;
		this.RecrActStartDate = RecrActStartDate;
		this.RecrActEndDate = RecrActEndDate;
		this.RecrLocation = RecrLocation;
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

	public void setRecrStatus(String RecrStatus) {
		this.RecrStatus = RecrStatus;
	}

	public Date getRecrStartDate() {
		return RecrStartDate;
	}

	public void setRecrStartDate(Date RecrStartDate) {
		this.RecrStartDate = RecrStartDate;
	}

	public Date getRecrEndDate() {
		return RecrEndDate;
	}

	public void setRecrEndDate(Date RecrEndDate) {
		this.RecrEndDate = RecrEndDate;
	}

	public Date getRecrActStartDate() {
		return RecrActStartDate;
	}

	public void setRecrActStartDate(Date RecrActStartDate) {
		this.RecrActStartDate = RecrActStartDate;
	}

	public Date getRecrActEndDate() {
		return RecrActEndDate;
	}

	public void setRecrActEndDate(Date RecrActEndDate) {
		this.RecrActEndDate = RecrActEndDate;
	}

	public String getRecrLocation() {
		return RecrLocation;
	}

	public void setRecrLocation(String RecrLocation) {
		this.RecrLocation = RecrLocation;
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
		return "RecreBoard [boardId=" + boardId + ", memberId=" + memberId + ", categoryId=" + categoryId + ", title="
				+ title + ", context=" + context + ", reportCount=" + reportCount + ", maxRecr=" + maxRecr
				+ ", nowRecr=" + nowRecr + ", RecrStatus=" + RecrStatus
				+ ", RecrStartDate=" + RecrStartDate + ", RecrEndDate=" + RecrEndDate
				+ ", RecrActStartDate=" + RecrActStartDate + ", RecrActEndDate="
				+ RecrActEndDate + ", RecrLocation=" + RecrLocation + ", commentCount="
				+ commentCount + ", readCount=" + readCount + ", registrationDate=" + registrationDate
				+ ", lastUpdateDate=" + lastUpdateDate + "]";
	}
    
    
}// class
