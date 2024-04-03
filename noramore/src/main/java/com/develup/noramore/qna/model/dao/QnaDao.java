package com.develup.noramore.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.common.Paging;
import com.develup.noramore.qna.model.vo.Qna;

@Repository("qnaDao")
public class QnaDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public int selectListCount() {		
		return sqlSessionTemplate.selectOne("qnaMapper.selectListCount");
	}

	public ArrayList<Qna> selectList(Paging paging) {		
		List<Qna> list = sqlSessionTemplate.selectList("qnaMapper.selectList", paging);
		return (ArrayList<Qna>)list;
	}

	public Qna selectOne(int boardID) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qnaMapper.selectOne",boardID);
	}
	
	public int addReadCount(int boardID) {
		return sqlSessionTemplate.update("qnaMapper.addReadCount", boardID);
		
	}
	
	//새 공지글 등록
	public int insertQna(Qna qna) {
		return sqlSessionTemplate.insert("qnaMapper.insertQna", qna);
	}
	
	//공지글 수정
	public int updateQna(Qna qna) {
		return sqlSessionTemplate.update("qnaMapper.updateQna", qna);
	}
	
	//공지글 삭제
	public int deleteQna(int qnaNo) {
		return sqlSessionTemplate.delete("qnaMapper.deleteQna", qnaNo);
	}

}
