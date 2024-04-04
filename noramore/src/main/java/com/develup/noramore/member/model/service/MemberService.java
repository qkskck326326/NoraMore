package com.develup.noramore.member.model.service;

import com.develup.noramore.member.model.vo.Member;


public interface MemberService {


	Member selectMember(String memberID);

	int insertMember(Member member);

	int selectCheckId(String memberid);

	int selectCheckEmail(String email);

	Member selectFindId(Member member);

	int updatePw(Member member);




	


}
