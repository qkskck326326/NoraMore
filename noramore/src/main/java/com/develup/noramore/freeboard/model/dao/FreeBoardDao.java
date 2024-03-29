package com.develup.noramore.freeboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.freeboard.model.vo.FreeBoard;

@Repository("freeBoardDao")
public class FreeBoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public FreeBoard selectBoardId(int boardId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("freeboard.selectBoardId", boardId);
	}

	
	
	

	/*
	public void insertFreeBoard(FreeBoard freeBoard) {
		
		sqlSessionTemplate.insert("freeboard.insertFreeBoard", freeBoard);
		
	}
	 */
	
	
	
	
	}


