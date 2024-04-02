package com.develup.noramore.commentrecrboard.service;

import java.util.ArrayList;

import com.develup.noramore.commentrecrboard.model.vo.CommentRecrBoard;

public interface CommentRecrBoardService {

	int insertRecrComment(CommentRecrBoard commentRecrBoard);

	ArrayList<CommentRecrBoard> selectRecrComment(int boardId);

	void upcountcocoment(CommentRecrBoard commentRecrBoard);



}
