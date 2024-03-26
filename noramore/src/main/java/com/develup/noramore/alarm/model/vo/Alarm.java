package com.develup.noramore.alarm.model.vo;

import java.sql.Date;

public class Alarm {
	
	private int alarmId;
	private String alarmKind;
	private int boardId;
	private String receiverId;
	private String senderId;
	private String checkedYN;
	private Date registDate;
	
	public Alarm() {
		super();
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

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
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

	@Override
	public String toString() {
		return "Alarm [alarmId=" + alarmId + ", alarmKind=" + alarmKind + ", boardId=" + boardId + ", receiverId="
				+ receiverId + ", senderId=" + senderId + ", checkedYN=" + checkedYN + ", registDate=" + registDate
				+ "]";
	}

	
}
