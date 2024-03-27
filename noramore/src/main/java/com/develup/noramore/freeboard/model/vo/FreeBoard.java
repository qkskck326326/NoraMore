package com.develup.noramore.freeboard.model.vo;

import java.sql.Date;

public class FreeBoard {
	
	private int boardId;
	private String memberId;
	private int categoryId;
	private String title;
	private String context;
	private int readCount;
	private int likeCount;
	private int reportCount;
	private java.sql.Date registDate;
	private java.sql.Date lastUpdDate;
	
	public FreeBoard() {
		super();
	}
	
	public FreeBoard(int boardId, String memberId, int categoryId, String title, String context, int readCount,
			int likeCount, int reportCount, Date registDate, Date lastUpdDate) {
		super();
		this.boardId = boardId;
		this.memberId = memberId;
		this.categoryId = categoryId;
		this.title = title;
		this.context = context;
		this.readCount = readCount;
		this.likeCount = likeCount;
		this.reportCount = reportCount;
		this.registDate = registDate;
		this.lastUpdDate = lastUpdDate;
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

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public java.sql.Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(java.sql.Date registDate) {
		this.registDate = registDate;
	}

	public java.sql.Date getLastUpdDate() {
		return lastUpdDate;
	}

	public void setLastUpdDate(java.sql.Date lastUpdDate) {
		this.lastUpdDate = lastUpdDate;
	}

	@Override
	public String toString() {
		return "FreeBoard [boardId=" + boardId + ", memberId=" + memberId + ", categoryId=" + categoryId + ", title="
				+ title + ", context=" + context + ", readCount=" + readCount + ", likeCount=" + likeCount
				+ ", reportCount=" + reportCount + ", registDate=" + registDate + ", lastUpdDate=" + lastUpdDate + "]";
	}
	
	
	
	
	
	
	

}
