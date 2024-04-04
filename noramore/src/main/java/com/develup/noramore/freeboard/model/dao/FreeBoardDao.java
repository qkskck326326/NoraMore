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


	public int selectSearchWriterCount(String keyword) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("freeboard.selectSearchWriterCount", keyword);
	}


	public ArrayList<FreeBoard> selectSearchWriter(Search search) {
		List<FreeBoard> list = sqlSessionTemplate.selectList("freeboard.selectSearchWriter", search);
		return (ArrayList<FreeBoard>)list;
	}


	public int insertOriginBoard(FreeBoard freeBoard) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("freeboard.insertOriginBoard", freeBoard);
	}


	public int updateAddReadCount(int boardId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("freeboard.updateAddReadCount", boardId);
	}


	public int deleteBoard(FreeBoard freeBoard) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("freeboard.deleteBoard", freeBoard);
	}


	public int updateOrigin(FreeBoard freeBoard) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("freeboard.updateOrigin", freeBoard);
	}


	public FreeBoard selectBoard(int boardId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("freeboard.selectBoard", boardId);
	}


	public int selectViewsListCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("freeboard.selectViewsListCount");
	}


	public ArrayList<FreeBoard> selectRecentList(Search search) {
		List<FreeBoard> list = sqlSessionTemplate.selectList("freeboard.selectRecentList", search);
		return (ArrayList<FreeBoard>)list;
	}


	public ArrayList<FreeBoard> selectViewsList(Search search) {
		List<FreeBoard> list = sqlSessionTemplate.selectList("freeboard.selectViewsList", search);
		return (ArrayList<FreeBoard>)list;
	}
	
	public ArrayList<FreeBoard> selectLikesList(Search search) {
		List<FreeBoard> list = sqlSessionTemplate.selectList("freeboard.selectLikesList", search);
		return (ArrayList<FreeBoard>)list;
	}
	
	public int selectRecentListCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("freeboard.selectRecentListCount");
	}

	public int selectLikesListCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("freeboard.selectLikesListCount");
	}

	public void incrementReportCount(int boardId) {
		sqlSessionTemplate.update("freeboard.incrementReportCount", boardId);
		
	}


	public void incrementLikeCount(int boardId) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("freeboard.incrementLikeCount", boardId);
	}


	


	


	

	

	
	


	
	
	

	/*
	public void insertFreeBoard(FreeBoard freeBoard) {
		
		sqlSessionTemplate.insert("freeboard.insertFreeBoard", freeBoard);
		
	}
	 */
	
	
	
	
	}


