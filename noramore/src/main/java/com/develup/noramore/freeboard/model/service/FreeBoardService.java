package com.develup.noramore.freeboard.model.service;

import java.util.ArrayList;

import com.develup.noramore.common.Paging;
import com.develup.noramore.common.Search;
import com.develup.noramore.freeboard.model.vo.FreeBoard;

public interface FreeBoardService {

	ArrayList<FreeBoard> selectFreeBoard();

	
	void insertFreeBoard(FreeBoard freeBoard);


	FreeBoard selectBoardId(int boardId);


	int selectListcount();


	ArrayList<FreeBoard> selectSearchList(Search search);


	int selectSearchTitleCount(String keyword);


	ArrayList<FreeBoard> selectSearchTitle(Search search);


	
	
	
	
	

}
