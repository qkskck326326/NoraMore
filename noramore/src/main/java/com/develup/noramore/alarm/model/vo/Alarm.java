package com.develup.noramore.alarm.model.vo;

import java.sql.Date;

public class Alarm {
	
	private int alarmId;
	private String alarmKind;
	private String BoardId;
	private String receiverId;
	private String senderId;
	private String checkedYN;
	private Date registDate;

	private String categoryId;
	private String title;
	private String commId;
	private String context;

	public Alarm() {
		super();
	}

	public Alarm(int alarmId, String alarmKind, String boardId, String receiverId, String senderId, String checkedYN,
			Date registDate, String categoryId, String title, String commId) {
		super();
		this.alarmId = alarmId;
		this.alarmKind = alarmKind;
		BoardId = boardId;
		this.receiverId = receiverId;
		this.senderId = senderId;
		this.checkedYN = checkedYN;
		this.registDate = registDate;
		this.categoryId = categoryId;
		this.title = title;
		this.commId = commId;
	}

	public int getAlarmId() {
		return alarmId;
	}

	public void setAlarmId(int alarmId) {
		this.alarmId = alarmId;
	}

	public String getAlarmKind() {
		return alarmKind;
	}

	public void setAlarmKind(String alarmKind) {
		this.alarmKind = alarmKind;
	}

	public String getBoardId() {
		return BoardId;
	}

	public void setBoardId(String boardId) {
		BoardId = boardId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getCheckedYN() {
		return checkedYN;
	}

	public void setCheckedYN(String checkedYN) {
		this.checkedYN = checkedYN;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCommId() {
		return commId;
	}

	public void setCommId(String commId) {
		this.commId = commId;
	}


	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	@Override
	public String toString() {
		return "Alarm [alarmId=" + alarmId + ", alarmKind=" + alarmKind + ", BoardId=" + BoardId + ", receiverId="
				+ receiverId + ", senderId=" + senderId + ", checkedYN=" + checkedYN + ", registDate=" + registDate
				+ ", categoryId=" + categoryId + ", title=" + title + ", commId=" + commId + ", context=" + context
				+ "]";
	}
	
	

}
