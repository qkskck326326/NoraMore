package com.develup.noramore.recrappl.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.recrappl.model.dao.RecrApplDao;
import com.develup.noramore.recrappl.model.vo.RecrAppl;

@Service
public class RecrApplServiceImpl implements RecrApplService{
	@Autowired
	private RecrApplDao recrApplDao; 
	
	@Override
	public int insertAppl(RecrAppl recrAppl) {
		return recrApplDao.insertAppl(recrAppl);
	}

	@Override
	public int applSearchId(RecrAppl recrAppl) {
		return recrApplDao.applSearchId(recrAppl);
	}


	
	
}//
