package com.develup.noramore.memadd.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.memadd.model.vo.MemAdd;

@Repository("memAddDao")
public class MemAddDao {
	@Autowired   //root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public MemAdd selectAll(String memberid) {
		System.out.println("dao" + memberid);
	
		return sqlSessionTemplate.selectOne("memAddMapper.selectAll", memberid);
		
		
	}
}
