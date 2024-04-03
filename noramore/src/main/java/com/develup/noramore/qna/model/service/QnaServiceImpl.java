package com.develup.noramore.qna.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.common.Paging;
import com.develup.noramore.notice.model.vo.Notice;
import com.develup.noramore.qna.model.dao.QnaDao;
import com.develup.noramore.qna.model.vo.Qna;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	@Autowired
	public  QnaDao qnaDao;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return qnaDao.selectListCount();
	}

	@Override
	public Qna selectOne(int boardID) {
		// TODO Auto-generated method stub
		return qnaDao.selectOne();
	}

	@Override
	public ArrayList<Qna> selectList(Paging paging) {
		// TODO Auto-generated method stub
		return qnaDao.selectList(paging);
	}

	@Override
	public void updateAddReadCount(int boardID) {
		// TODO Auto-generated method stub
		qnaDao.updateAddReadCount(boardID);
	}

	@Override
	public int insertQna(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDao.insertQna(qna);
	}

	@Override
	public int deleteQna(int boardID) {
		// TODO Auto-generated method stub
		return qnaDao.deleteQna(boardID);
	}

	@Override
	public int updateQna(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDao.updateQna(qna);
	}
}
