package com.develup.noramore.notice.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.notice.model.dao.NoticeBoardDao;

@Service("noticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService{
	@Autowired
	public NoticeBoardDao noticeBoardDao;
}
