package com.develup.noramore.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.admin.model.vo.BoardManage;
import com.develup.noramore.common.Paging;

@Repository("AdminDao")
public class AdminDao {

	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int selectReportedListCount() {
		return sqlSessionTemplate.selectOne("admin.selectReportedListCount");
	}

	public List<BoardManage> selectReportedList(Paging paging) {
		return sqlSessionTemplate.selectList("admin.selectReportedList", paging);
	}

}
