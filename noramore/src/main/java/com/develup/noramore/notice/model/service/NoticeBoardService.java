package com.develup.noramore.notice.model.service;

import java.util.ArrayList;

import com.develup.noramore.common.Paging;
import com.develup.noramore.notice.model.vo.Notice;

public interface NoticeBoardService {


	int selectListCount();
	Notice selectOne(int noticeNo);
	ArrayList<Notice> selectList(Paging paging);
	void updateAddReadCount(int noticeNo);
	

	
}
