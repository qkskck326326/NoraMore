package com.develup.noramore.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.admin.model.dao.AdminDao;
import com.develup.noramore.admin.model.vo.BoardManage;
import com.develup.noramore.common.Paging;

@Service("AdminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;
		
	@Override
	public int selectReportedListCount() {
		return adminDao.selectReportedListCount();
	}

	@Override
	public List<BoardManage> selectReportedList(Paging paging) {
		return adminDao.selectReportedList(paging);
	}

}
