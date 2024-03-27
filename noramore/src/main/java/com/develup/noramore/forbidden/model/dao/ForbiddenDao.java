package com.develup.noramore.forbidden.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.common.Paging;
import com.develup.noramore.forbidden.model.vo.Forbidden;

@Repository("forbiddenDao")
public class ForbiddenDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Forbidden> selectList(Paging paging) {
		List<Forbidden> list = sqlSessionTemplate.selectList("forbiddenMapper.selectList", paging);
		return (ArrayList<Forbidden>)list;
	}

	public int selectListCount() {
		return sqlSessionTemplate.selectOne("forbiddenMapper.selectListCount");
	}
}
