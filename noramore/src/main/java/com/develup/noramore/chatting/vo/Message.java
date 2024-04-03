package com.develup.noramore.chatting.vo;

public class Message {
    private int messageNo; // 메시지 번호
    private String messageContent; // 메시지 내용
    private String readFlag; // 읽음 여부
    private String senderId; // 보낸 회원 아이디
    private String targetId; // 받는 회원 아이디
    private int chattingNo; // 채팅방 번호
    private String sendTime; // 메시지 보낸 시간
    
	public Message() {
		super();
	}

	public Message(int messageNo, String messageContent, String readFlag, String senderId, String targetId, int chattingNo,
			String sendTime) {
		super();
		this.messageNo = messageNo;
		this.messageContent = messageContent;
		this.readFlag = readFlag;
		this.senderId = senderId;
		this.targetId = targetId;
		this.chattingNo = chattingNo;
		this.sendTime = sendTime;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getReadFlag() {
		return readFlag;
	}

	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getTargetId() {
		return targetId;
	}

	public void setTargetNo(String targetId) {
		this.targetId = targetId;
	}

	public int getChattingNo() {
		return chattingNo;
	}

	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageContent=" + messageContent + ", readFlag=" + readFlag
				+ ", senderId=" + senderId + ", targetId=" + targetId + ", chattingNo=" + chattingNo + ", sendTime="
				+ sendTime + "]";
	}
    
}