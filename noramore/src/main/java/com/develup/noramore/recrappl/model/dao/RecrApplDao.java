package com.develup.noramore.recrappl.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.recrappl.model.vo.RecrAppl;

@Repository
public class RecrApplDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insertAppl(RecrAppl recrAppl) {
		return sqlSessionTemplate.insert("recrappl.insertAppl", recrAppl);
	}

}//
