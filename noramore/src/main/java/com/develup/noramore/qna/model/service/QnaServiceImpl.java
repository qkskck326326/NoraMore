package com.develup.noramore.qna.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.qna.model.dao.QnaDao;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	@Autowired
	public  QnaDao qnaDao;
}
