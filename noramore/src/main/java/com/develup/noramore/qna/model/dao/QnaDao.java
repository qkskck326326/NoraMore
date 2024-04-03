package com.develup.noramore.qna.model.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.develup.noramore.common.Paging;
import com.develup.noramore.qna.model.vo.Qna;

@Repository("qnaDao")
public class QnaDao {

	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public Qna selectOne() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Qna> selectList(Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateAddReadCount(int boardID) {
		// TODO Auto-generated method stub
		
	}

	public int insertQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	public int deleteQna(int boardID) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

}
