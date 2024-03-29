package com.develup.noramore.recrservice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.common.Search;
import com.develup.noramore.recrappl.model.vo.RecrAppl;
import com.develup.noramore.recrboard.model.vo.RecrBoard;

@Repository("recrBoardDao")
public class RecreBoardDao {
	@Autowired
	SqlSessionTemplate SqlSessionTemplate;
	
	public ArrayList<RecrBoard> selectRecrBoard() {
		List<RecrBoard> list = SqlSessionTemplate.selectList("recrboard.selectRecrBoard");
		return (ArrayList<RecrBoard>)list;
	}

	public RecrBoard selectBoardId(int boardId) {
		return SqlSessionTemplate.selectOne("recrboard.selectBoardId", boardId);
	}

	public int selectListcount() {
		return SqlSessionTemplate.selectOne("recrboard.selectListcount");
	}

	public ArrayList<RecrBoard> selectSearchList(Search search) {
		List<RecrBoard> list = SqlSessionTemplate.selectList("recrboard.selectSearchList", search);
		return (ArrayList<RecrBoard>)list;
	}

	public int insertRecrBoard(RecrBoard recrBoard) {
		return SqlSessionTemplate.insert("recrboard.insertRecrBoard", recrBoard);
	}
	
}//
