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
	
	private int boardId;
	private String title;
	private String context;
	private String refCommentId;
	private int startRow;
	private int endRow;

	public Alarm() {
		super();
	}

	public Alarm(int alarmId, String alarmKind, String nativeId, String receiverId, String senderId, String checkedYN,
			Date registDate, int boardId, String title, String context, String refCommentId, int startRow,
			int endRow) {
		super();
		this.alarmId = alarmId;
		this.alarmKind = alarmKind;
		NativeId = nativeId;
		this.receiverId = receiverId;
		this.senderId = senderId;
		this.checkedYN = checkedYN;
		this.registDate = registDate;
		this.boardId = boardId;
		this.title = title;
		this.context = context;
		this.refCommentId = refCommentId;
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

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
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

	public String getRefCommentId() {
		return refCommentId;
	}

	public void setRefCommentId(String refCommentId) {
		this.refCommentId = refCommentId;
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
				+ ", boardId=" + boardId + ", title=" + title + ", context=" + context + ", refCommentId="
				+ refCommentId + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}

	
	

}
