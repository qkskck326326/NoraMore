package com.develup.noramore.freeboard.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.common.Search;
import com.develup.noramore.freeboard.model.dao.FreeBoardDao;
import com.develup.noramore.freeboard.model.vo.FreeBoard;

@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	FreeBoardDao freeBoardDao;
	
	
	
	
	@Override
	public ArrayList<FreeBoard> selectFreeBoard() {
		List<FreeBoard> list = sqlSessionTemplate.selectList("freeboard.selectFreeBoard");
		return (ArrayList<FreeBoard>)list;
	}
	
	@Override
	public void insertFreeBoard(FreeBoard freeBoard) {
		
		
	}

	@Override
	public FreeBoard selectBoardId(int boardId) {
		// TODO Auto-generated method stub
		return freeBoardDao.selectBoardId(boardId);
	}

	@Override
	public int selectListcount() {
		// TODO Auto-generated method stub
		return freeBoardDao.selectListcount();
	}

	@Override
	public ArrayList<FreeBoard> selectSearchList(Search search) {
		// TODO Auto-generated method stub
		return freeBoardDao.selectSearchList(search);
	}

	@Override
	public int selectSearchTitleCount(String keyword) {
		// TODO Auto-generated method stub
		return freeBoardDao.selectSearchTitleCount(keyword);
	}

	@Override
	public ArrayList<FreeBoard> selectSearchTitle(Search search) {
		// TODO Auto-generated method stub
		return freeBoardDao.selectSearchTitle(search);
	}

	@Override
	public int selectSearchWriterCount(String keyword) {
		// TODO Auto-generated method stub
		return freeBoardDao.selectSearchWriterCount(keyword);
	}

	@Override
	public ArrayList<FreeBoard> selectSearchWriter(Search search) {
		// TODO Auto-generated method stub
		return freeBoardDao.selectSearchWriter(search);
	}

	@Override
	public int insertOriginBoard(FreeBoard freeBoard) {
		// TODO Auto-generated method stub
		return freeBoardDao.insertOriginBoard(freeBoard);
	}

	@Override
	public int updateAddReadCount(int boardId) {
		// TODO Auto-generated method stub
		return freeBoardDao.updateAddReadCount(boardId);
	}

	@Override
	public int deleteBoard(FreeBoard freeBoard) {
		// TODO Auto-generated method stub
		return freeBoardDao.deleteBoard(freeBoard);
	}

	@Override
	public int updateOrigin(FreeBoard freeBoard) {
		// TODO Auto-generated method stub
		return freeBoardDao.updateOrigin(freeBoard);
	}

	@Override
	public FreeBoard selectBoard(int boardId) {
		// TODO Auto-generated method stub
		return freeBoardDao.selectBoard(boardId);
	}

	

	
	

	
	
}
