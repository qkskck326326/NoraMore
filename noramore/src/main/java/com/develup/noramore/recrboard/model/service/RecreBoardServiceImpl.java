package com.develup.noramore.recrboard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.common.Search;
import com.develup.noramore.recrboard.model.vo.RecrBoard;
import com.develup.noramore.recrservice.model.dao.RecreBoardDao;

@Service("recrBoardSevice")
public class RecreBoardServiceImpl implements RecrBoardService{
	@Autowired
	RecreBoardDao recreBoardDao;
	
	@Override
	public ArrayList<RecrBoard> selectRecrBoard() {
		return recreBoardDao.selectRecrBoard();
	}

	@Override
	public RecrBoard selectBoardId(int boardId) {
		return recreBoardDao.selectBoardId(boardId);
	}

	@Override
	public int selectListcount() {
		return recreBoardDao.selectListcount();
	}

	@Override
	public ArrayList<RecrBoard> selectSearchList(Search search) {
		return recreBoardDao.selectSearchList(search);
	}

	@Override
	public int insertRecrBoard(RecrBoard recrBoard) {
		return recreBoardDao.insertRecrBoard(recrBoard);
	}

	@Override
	public int upNowRecr(int boardId) {
		return recreBoardDao.upNowRecr(boardId);
	}



}//
