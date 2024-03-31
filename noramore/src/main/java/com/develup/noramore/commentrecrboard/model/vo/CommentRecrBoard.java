package com.develup.noramore.commentrecrboard.model.vo;

import java.sql.Date;

public class CommentRecrBoard implements java.io.Serializable{
	private static final long serialVersionUID = -4048271626201499711L;
	
    private int boardId;            // 게시판 ID
    private int commentId;          // 댓글 ID
    private int refCommentId;       // 상위 댓글 ID
    private String memberId;        // 회원 ID
    private String context;         // 내용
    private int reportCount;        // 신고 횟수
    private Date registDate;        // 등록 날짜
    private Date lastUpdateDate;    // 최종 수정 날짜
    
	public CommentRecrBoard() {
		super();
	}
	
	public CommentRecrBoard(int boardId, int commentId, int refCommentId, String memberId, String context,
			int reportCount, Date registDate, Date lastUpdateDate) {
		super();
		this.boardId = boardId;
		this.commentId = commentId;
		this.refCommentId = refCommentId;
		this.memberId = memberId;
		this.context = context;
		this.reportCount = reportCount;
		this.registDate = registDate;
		this.lastUpdateDate = lastUpdateDate;
	}
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getRefCommentId() {
		return refCommentId;
	}
	public void setRefCommentId(int refCommentId) {
		this.refCommentId = refCommentId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	@Override
	public String toString() {
		return "CommentRecrBoard [boardId=" + boardId + ", commentId=" + commentId + ", refCommentId=" + refCommentId
				+ ", memberId=" + memberId + ", context=" + context + ", reportCount=" + reportCount + ", registDate="
				+ registDate + ", lastUpdateDate=" + lastUpdateDate + "]";
	}

	
}//
