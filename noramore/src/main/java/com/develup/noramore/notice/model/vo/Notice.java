package com.develup.noramore.notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private int noticeNo;
    private String noticeTitle;
    private java.sql.Date noticeDate;
    private String noticeWriter;
    private String noticeContent;
    private String originalFilePath;
    private String renameFilePath;
    private char importance;
    private Date impEndDate;
    private int readCount;
	
     
    public Notice() {
		super();
	}
    
    public Notice(int noticeNo, String noticeTitle, Date noticeDate, String noticeWriter, String noticeContent,
			String originalFilePath, String renameFilePath, char importance, Date impEndDate, int readCount) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.originalFilePath = originalFilePath;
		this.renameFilePath = renameFilePath;
		this.importance = importance;
		this.impEndDate = impEndDate;
		this.readCount = readCount;
	}

	
	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getOriginalFilePath() {
		return originalFilePath;
	}

	public void setOriginalFilePath(String originalFilePath) {
		this.originalFilePath = originalFilePath;
	}

	public String getRenameFilePath() {
		return renameFilePath;
	}

	public void setRenameFilePath(String renameFilePath) {
		this.renameFilePath = renameFilePath;
	}

	public char getImportance() {
		return importance;
	}

	public void setImportance(char importance) {
		this.importance = importance;
	}

	public Date getImpEndDate() {
		return impEndDate;
	}

	public void setImpEndDate(Date impEndDate) {
		this.impEndDate = impEndDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "NoticeBoard [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeDate=" + noticeDate
				+ ", noticeWriter=" + noticeWriter + ", noticeContent=" + noticeContent + ", originalFilePath="
				+ originalFilePath + ", renameFilePath=" + renameFilePath + ", importance=" + importance
				+ ", impEndDate=" + impEndDate + ", readCount=" + readCount + "]";
	}
    
    
}
