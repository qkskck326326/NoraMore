package com.develup.noramore.freeboard.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.common.Search;
import com.develup.noramore.freeboard.model.vo.FreeBoard;

@Repository("freeBoardDao")
public class FreeBoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public FreeBoard selectBoardId(int boardId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("freeboard.selectBoardId", boardId);
	}


	public int selectListcount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("freeboard.selectListcount");
	
	}


	public ArrayList<FreeBoard> selectSearchList(Search search) {
		List<FreeBoard> list = sqlSessionTemplate.selectList("freeboard.selectSearchList", search);
		return (ArrayList<FreeBoard>)list;
	}


	public int selectSearchTitleCount(String keyword) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("freeboard.selectSearchTitleCount", keyword);
	}


	public ArrayList<FreeBoard> selectSearchTitle(Search search) {
		List<FreeBoard> list = sqlSessionTemplate.selectList("freeboard.selectSearchTitle", search);
		return (ArrayList<FreeBoard>)list;
	}

	
	
	

	/*
	public void insertFreeBoard(FreeBoard freeBoard) {
		
		sqlSessionTemplate.insert("freeboard.insertFreeBoard", freeBoard);
		
	}
	 */
	
	
	
	
	}


