package com.develup.noramore.forbidden.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("forbiddenDao")
public class ForbiddenDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
