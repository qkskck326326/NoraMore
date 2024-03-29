package com.develup.noramore.alarm.model.vo;

import java.sql.Date;

public class Alarm {
	
	private int alarmId;
	private String alarmKind;
	private String rBoardId;
	private String fBoardId;
	private String receiverId;
	private String senderId;
	private String checkedYN;
	private Date registDate;

	private String memberId;
	private String categoryId;
	private String title;

	public Alarm() {
		super();
	}

	public Alarm(int alarmId, String alarmKind, String rBoardId, String fBoardId, String receiverId, String senderId,
			String checkedYN, Date registDate, String memberId, String categoryId, String title) {
		super();
		this.alarmId = alarmId;
		this.alarmKind = alarmKind;
		this.rBoardId = rBoardId;
		this.fBoardId = fBoardId;
		this.receiverId = receiverId;
		this.senderId = senderId;
		this.checkedYN = checkedYN;
		this.registDate = registDate;
		this.memberId = memberId;
		this.categoryId = categoryId;
		this.title = title;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getrBoardId() {
		return rBoardId;
	}

	public void setrBoardId(String rBoardId) {
		this.rBoardId = rBoardId;
	}

	public String getfBoardId() {
		return fBoardId;
	}

	public void setfBoardId(String fBoardId) {
		this.fBoardId = fBoardId;
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

	@Override
	public String toString() {
		return "Alarm [alarmId=" + alarmId + ", alarmKind=" + alarmKind + ", rBoardId=" + rBoardId + ", fBoardId="
				+ fBoardId + ", receiverId=" + receiverId + ", senderId=" + senderId + ", checkedYN=" + checkedYN
				+ ", registDate=" + registDate + ", memberId=" + memberId + ", categoryId=" + categoryId + ", title="
				+ title + "]";
	}


	
}
