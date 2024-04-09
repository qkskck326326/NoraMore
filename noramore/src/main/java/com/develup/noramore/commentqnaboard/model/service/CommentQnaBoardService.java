package com.develup.noramore.commentqnaboard.model.service;

import java.util.ArrayList;

import com.develup.noramore.commentqnaboard.model.vo.CommentQnaBoard;

public interface CommentQnaBoardService {
	int insertQnaComment(CommentQnaBoard commentQnaBoard);

	ArrayList<CommentQnaBoard> selectQnaComment(int boardId);

	void upcountcocoment(CommentQnaBoard commentQnaBoard);

	void downcountcocoment(CommentQnaBoard commentQnaBoard);

	ArrayList<CommentQnaBoard> selectQnaCocomment(CommentQnaBoard commentQnaBoard);

	int deleteComment(CommentQnaBoard commentQnaBoard);

	int updateComment(CommentQnaBoard commentQnaBoard);

	void deleteSubComment(CommentQnaBoard commentQnaBoard);

	void deleteBoardComment(int boardId);
}
