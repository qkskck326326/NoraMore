package com.develup.noramore.memadd.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.memadd.model.dao.MemAddDao;
import com.develup.noramore.memadd.model.vo.MemAdd;


@Service("memAddService")
public class MemAddServiceImpl implements MemAddService{
	
	@Autowired
	private MemAddDao memAddDao;
	
	@Override
	public MemAdd selectAll(String memberid) {
		System.out.println("service " + memAddDao.selectAll(memberid));
		return memAddDao.selectAll(memberid);
	}
	
	
}
