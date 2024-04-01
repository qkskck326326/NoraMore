package com.develup.noramore.alarm.model.vo;

import java.sql.Date;

import com.develup.noramore.common.Paging;

public class Alarm {
	private int alarmId;
	private String alarmKind;
	private String NativeId;
	private String receiverId;
	private String senderId;
	private String checkedYN;
	private Date registDate;
	
	private int startRow;
	private int endRow;

	public Alarm() {
		super();
	}

	public Alarm(int alarmId, String alarmKind, String nativeId, String receiverId, String senderId, String checkedYN,
			Date registDate, int startRow, int endRow) {
		super();
		this.alarmId = alarmId;
		this.alarmKind = alarmKind;
		NativeId = nativeId;
		this.receiverId = receiverId;
		this.senderId = senderId;
		this.checkedYN = checkedYN;
		this.registDate = registDate;
		this.startRow = startRow;
		this.endRow = endRow;
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

	public String getNativeId() {
		return NativeId;
	}

	public void setNativeId(String nativeId) {
		NativeId = nativeId;
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

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "Alarm [alarmId=" + alarmId + ", alarmKind=" + alarmKind + ", NativeId=" + NativeId + ", receiverId="
				+ receiverId + ", senderId=" + senderId + ", checkedYN=" + checkedYN + ", registDate=" + registDate
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}

	
	

}
