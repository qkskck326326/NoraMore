package com.develup.noramore.recrboard.model.service;

import java.util.ArrayList;

import com.develup.noramore.recrboard.model.vo.RecrBoard;

public interface RecrBoardService {

	ArrayList<RecrBoard> selectRecrBoard();

	RecrBoard selectBoardId(int boardId);
	
}
