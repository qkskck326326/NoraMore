package com.develup.noramore.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.develup.noramore.member.model.service.MemberService;
import com.develup.noramore.member.model.vo.Member;
	
@Controller 
public class MemberController {
	// 이 클래스 안에 메소드들이 동작이 잘 되는지 또는 전달값이나 리턴값을 확인하기 위한 용도로 로그객체를 생성함
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class); // 다른 클래스를 통해서 얻어냄,
																						// org.slf4j.Logger로
																						// import하기
	

	@Autowired
	private MemberService memberService; 

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; // spring-security.xml에서의 id를 가져다 변수 명으로 사용
	//암호를 암호화 함.
	
	
	// 뷰 페이지 내보내기용 메소드 ---------------------------------------------------
	@RequestMapping(value = "moveLoginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	// RequestMethod.GET : get방식으로 전송오면 받음, RequestMethod.POST : post방식으로 전송오면 받음
	public String moveLoginPage() {
	return "/member/moveLoginPage";
	
	}
	
	@RequestMapping(value = "enrollPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	// RequestMethod.GET : get방식으로 전송오면 받음, RequestMethod.POST : post방식으로 전송오면 받음
	public String enrollPage() {
	return "/member/moveEnrollPage";
	
	}
	
	
	
	
	// 로그인 처리용 메소드 : command 객체 사용
	// 서버로 전송 온 parameter 값을 저장하는 객체를 command 객체라고 함
	// (loginPage.jsp) input 태그의 name 속성의 이름과 vo 객체의 필드명이 같으면 자동으로 command 객체가 값을 받음
	@RequestMapping(value = "login.do", method = RequestMethod.POST) // post방식으로 보냄
	public String loginMethod(Member member, HttpSession session, // 자동으로 입력값이 저장됨 //코드가 간략화됨
			SessionStatus status, Model model) {   // HttpSession : 세션 자동생성, SessionStatus : 세션 상태 파악, Model : 모델자동 생성
		logger.info("login.do : " + member.toString());

		// 서비스 메소드로 보내고 결과 받기
		// Member loginMember = memberService.selectLogin(member); //command 객체 사용

		// 암호화 처리된 패스워드 일치 조회는 select 해 온 값으로 비교함
		// 전달온 회원 아이디로 먼저 회원정보를 조회해 옴
		Member loginMember = memberService.selectMember(member.getMemberID());
		
		
		// 조회해 온 회원 정보가 있고, 회원의 암호화된 패스워드와 뷰에서 전달받은 패스워드를 비교함
		// matches(전달받은 암호 글자, 암호화된 패스워드)
		if (loginMember != null && this.bcryptPasswordEncoder.matches(member.getMemberPWD(), loginMember.getMemberPWD())) {
			session.setAttribute("loginMember", loginMember); // 세션이름에 loginMember을 저장함
			status.setComplete(); // 로그인 성공 요청결과로 HttpStatus code 200 보냄
			return "common/home";
		} else {
			model.addAttribute("message", "로그인 실패! 아이디나 암호를 다시 확인하세요. 또는 로그인 제한된 회원입니다. 관리자에게 문의하세요."); // addAttribute(속성명, 속성값)
			// message : error페이지에서 message이름으로 모델객체를 보내면 값을 읽음
			// 컨트롤러에서 뷰로 데이터를 전달하는 데 사용됨. 주로 뷰에 표시할 데이터를 저장하고 전달하는 데에 사용
			return "common/error";
		}
	}
	
	//로그아웃 처리용 메소드
		//요청에 대한 전송방식이 get 이면, method 속성 생략해도 됨, 
		//method 속성을 생략하면 value 속성도 표기를 생략해도 됨
		@RequestMapping("logout.do")
		public String logoutMethod(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession(false);
			//세션 객체가 있으면 리턴받고, 없으면 null 리턴
			if(session != null) {
				session.invalidate();
				return "common/home";
			}else {
				model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
				return "common/error";
			}
		}
		
		//회원 가입 요청 처리용 메소드
		@RequestMapping(value="enroll.do", method=RequestMethod.POST)
		public String memberInsertMethod(Member member, Model model) {
			logger.info("enroll.do : " + member);
			
			//패스워드 암호화 처리
			member.setMemberPWD(bcryptPasswordEncoder.encode(member.getMemberPWD()));
			logger.info("after encode : " + member.getMemberPWD());
			logger.info("pwd length : " + member.getMemberPWD().length());
			
			if(memberService.insertMember(member) > 0) {
				return "member/loginPage";
			}else {
				model.addAttribute("message", "회원 가입 실패! 확인하고 다시 가입해 주세요.");
				return "common/error";
			}
		}
		
		
		
		//ajax 통신으로 가입할 아이디 중복 확인 요청 처리용 메소드
		@RequestMapping(value="idchk.do", method=RequestMethod.POST)
		public void dupCheckIdMethod(@RequestParam("memberID") String memberid, 
				HttpServletResponse response) throws IOException {
			//메소드 매개변수 영역에서 사용하는 어노테이션 중에
			//@RequestParam("전송온이름")  자료형 값저장변수명
			//자료형 값저장변수명 = request.getParameter("전송온이름");  코드와 같음
			
			int idCount = memberService.selectCheckId(memberid);
			
			String returnStr = null;
			if(idCount == 0) {
				returnStr = "ok";
			}else {
				returnStr = "dup";
			}
			
			//response 를 이용해서 클라이언트와 출력스트림을 열어서 문자열값 내보냄
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append(returnStr);
			out.flush();
			out.close();
		}
}



