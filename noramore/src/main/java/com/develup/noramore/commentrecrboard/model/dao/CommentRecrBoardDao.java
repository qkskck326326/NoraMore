package com.develup.noramore.commentrecrboard.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.commentrecrboard.model.vo.CommentRecrBoard;

@Repository("commentRecrBoardDao")
public class CommentRecrBoardDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// 수정 해야함
	public int insertRecrComment(CommentRecrBoard commentRecrBoard) {
		return sqlSessionTemplate.insert("commentrecrboard.insertRecrComment", commentRecrBoard);
	}
	
	public ArrayList<CommentRecrBoard> selectRecrComment(int boardId) {
		List<CommentRecrBoard> list = sqlSessionTemplate.selectList("commentrecrboard.selectRecrComment", boardId);
		return (ArrayList<CommentRecrBoard>)list;
	}
	
}//
