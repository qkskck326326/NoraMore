package com.develup.noramore.qna.model.service;

import java.util.ArrayList;

import com.develup.noramore.common.Paging;
import com.develup.noramore.qna.model.vo.Qna;

public interface QnaService {
	int selectListCount();

	Qna selectOne(int boardID);

	ArrayList<Qna> selectList(Paging paging);

	void updateAddReadCount(int boardID);

	int insertQna(Qna qna);

	int updateQna(Qna qna);

	int deleteQna(int boardID);

	
}
