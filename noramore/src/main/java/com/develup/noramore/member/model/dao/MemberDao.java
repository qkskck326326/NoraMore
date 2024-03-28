package com.develup.noramore.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {

	@Autowired   //root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;
	
	public Member selectMember(String memberID) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMember", memberID);
	}

	public int insertMember(Member member) {
		return sqlSessionTemplate.insert("memberMapper.insertMember", member);
	}

	public int selectCheckId(String memberid) {
		return sqlSessionTemplate.selectOne("memberMapper.selectCheckId", memberid);
	}

}

