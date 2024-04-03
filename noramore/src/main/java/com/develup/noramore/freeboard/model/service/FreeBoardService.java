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


	int selectSearchWriterCount(String keyword);


	ArrayList<FreeBoard> selectSearchWriter(Search search);


	int insertOriginBoard(FreeBoard freeBoard);


	int updateAddReadCount(int boardId);


	int deleteBoard(FreeBoard freeBoard);


	int updateOrigin(FreeBoard freeBoard);


	FreeBoard selectBoard(int boardId);


	ArrayList<FreeBoard> selectViewsList(Search search);

	
	


	
	
	
	
	

}
