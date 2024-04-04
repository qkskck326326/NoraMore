package com.develup.noramore.member.model.service;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;


import com.develup.noramore.member.model.dao.MemberDao;
import com.develup.noramore.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	

	@Override
	public Member selectMember(String memberID) {
		return memberDao.selectMember(memberID);
	}

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public int selectCheckId(String memberid) {
		return memberDao.selectCheckId(memberid);
	}

	@Override
	public int selectCheckEmail(String email) {
		return memberDao.selectCheckEmail(email);
	}

	@Override
	public Member selectFindId(Member member) {
		return memberDao.selectFindId(member);
	}

	@Override
	public int updatePw(Member member) {
		return memberDao.updatePw(member);
	}
	
	
}
