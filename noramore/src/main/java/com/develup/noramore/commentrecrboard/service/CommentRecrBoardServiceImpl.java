package com.develup.noramore.commentrecrboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.commentrecrboard.model.dao.CommentRecrBoardDao;
import com.develup.noramore.commentrecrboard.model.vo.CommentRecrBoard;

@Service("commentRecrBoardService")
public class CommentRecrBoardServiceImpl implements CommentRecrBoardService{
	@Autowired
	CommentRecrBoardDao commentRecrBoardDao;

	@Override
	public int insertRecrComment(CommentRecrBoard commentRecrBoard) {
		return commentRecrBoardDao.insertRecrComment(commentRecrBoard);
	}

	@Override
	public ArrayList<CommentRecrBoard> selectRecrComment(int boardId) {
		return commentRecrBoardDao.selectRecrComment(boardId);
	}
	
}//
