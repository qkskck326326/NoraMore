package com.develup.noramore.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.common.Paging;
import com.develup.noramore.notice.model.dao.NoticeBoardDao;
import com.develup.noramore.notice.model.vo.Notice;

@Service("noticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService{
	@Autowired
	public NoticeBoardDao noticeBoardDao;
	
	@Override
	public int selectListCount() {
		return noticeBoardDao.selectListCount();
	}

	@Override
	public ArrayList<Notice> selectList(Paging paging) {
		return noticeBoardDao.selectList(paging);
	}

	@Override
	public Notice selectOne(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeBoardDao.selectOne(noticeNo);
	}

	@Override
	public void updateAddReadCount(int noticeNo) {		
		noticeBoardDao.addReadCount(noticeNo);		
	}

	@Override
	public int insertNotice(Notice notice) {
		
		return noticeBoardDao.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return noticeBoardDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return noticeBoardDao.deleteNotice(noticeNo);
	}
}
