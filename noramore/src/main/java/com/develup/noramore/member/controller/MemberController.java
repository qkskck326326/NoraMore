package com.develup.noramore.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.develup.noramore.member.model.service.MemberService;
	
@Controller 
public class MemberController {
	// 이 클래스 안에 메소드들이 동작이 잘 되는지 또는 전달값이나 리턴값을 확인하기 위한 용도로 로그객체를 생성함
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class); // 다른 클래스를 통해서 얻어냄,
																						// org.slf4j.Logger로
																						// import하기
	
//	// 서비스 연결 처리 : 자동 DI처리
//	@Autowired
//	private MemberService memberService; // 스프링이 new를 알아서 해줌
//	// 스프링에서는 부모 인터페이스 타입으로 레퍼런스 선언함.(다형성 이용함)
//	// 실행시 후손이 오버라이딩된 메소드를 연결 실행하게 됨 (동적바인딩 이라고 함)
//	
//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder; // spring-security.xml에서의 id를 가져다 변수 명으로 사용
//	//암호를 암호화 함.
	
	// 뷰 페이지 내보내기용 메소드 ---------------------------------------------------
	@RequestMapping(value = "moveLoginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	// RequestMethod.GET : get방식으로 전송오면 받음, RequestMethod.POST : post방식으로 전송오면 받음
	public String moveLoginPage() {
	return "/member/moveLoginPage";
	
	}
}
