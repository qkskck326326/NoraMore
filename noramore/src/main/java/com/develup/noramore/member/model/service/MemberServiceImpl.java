package com.develup.noramore.member.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.develup.noramore.email.model.vo.MailUtils;
import com.develup.noramore.email.model.vo.TempKey;
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
	public int selectCheckEmail(String emailConnect) {
		return memberDao.selectCheckEmail(emailConnect);
	}
	
	@Inject
	private JavaMailSender mailSender;
	
	@Transactional
	@Override
	public void register(Member member) throws Exception{
		System.out.println("email전송 확인 : " + member.getEmail());
		memberDao.register(member);
		
		String key = new TempKey().getKey(50,false);
		memberDao.createAuthKey(member.getEmail(), key);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[ICEWATER 커뮤니티 이메일 인증메일 입니다.]"); //메일제목
		sendMail.setText(
				"<h1>메일인증</h1>" +
						"<br/>"+member.getMemberID()+"님 "+
						"<br/>ICEWATER에 회원가입해주셔서 감사합니다."+
						"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
						"<a href='http://localhost:8080/member/registerEmail?memberEmail=" + member.getEmail() +
						"&key=" + key +
						"' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setFrom("testnoramore12@gmail.com", "김채림");
		sendMail.setTo(member.getEmail());
		sendMail.send();
		
	}
    
    @Override
	public void memberAuth(String memberEmail) throws Exception{
		memberDao.memberAuth(memberEmail);
	}

	@Override
	public Member checkLoginBefore(String value) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
