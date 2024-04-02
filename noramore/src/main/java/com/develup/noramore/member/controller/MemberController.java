package com.develup.noramore.member.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	@RequestMapping(value = "my.do", method = { RequestMethod.GET, RequestMethod.POST })
	// RequestMethod.GET : get방식으로 전송오면 받음, RequestMethod.POST : post방식으로 전송오면 받음
	public String mypage() {
	return "/member/mypage";
	
	}
	
	
	
	
	//로그인 처리용
	@RequestMapping(value = "login.do", method = RequestMethod.POST) 
	public String loginMethod(Member member, HttpSession session, 
			SessionStatus status, Model model) {   // HttpSession : 세션 자동생성, SessionStatus : 세션 상태 파악, Model : 모델자동 생성
		logger.info("login.do : " + member.toString());

		



		Member loginMember = memberService.selectMember(member.getMemberID());
		

		if (loginMember != null && this.bcryptPasswordEncoder.matches(member.getMemberPWD(), loginMember.getMemberPWD())) {
			session.setAttribute("loginMember", loginMember); // 세션이름에 loginMember을 저장함
			status.setComplete(); // 로그인 성공 요청결과로 HttpStatus code 200 보냄
			return "common/home";
		} else {
			model.addAttribute("message", "로그인 실패! 아이디나 암호를 다시 확인하세요. 또는 로그인 제한된 회원입니다. 관리자에게 문의하세요."); // addAttribute(속성명, 속성값)
		
			return "common/moveLoginPage";
		}
	}
	
	
	
	//로그아웃 처리용 메소드
	
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
		public String memberInsertMethod(Member member, 
				/* @RequestParam("email2") String email2, */
										@RequestParam("road") String road,
										@RequestParam("street") String street,
										@RequestParam("detail") String detail,
										@RequestParam("ref") String ref,
										Model model) throws Exception {
			logger.info("enroll.do : " + member);

			//패스워드 암호화 처리
			member.setMemberPWD(bcryptPasswordEncoder.encode(member.getMemberPWD()));
			logger.info("after encode : " + member.getMemberPWD());
			logger.info("pwd length : " + member.getMemberPWD().length());
			
			
//			if (member.getEmail() != null && !email2.equals("이메일 선택") ) {
//			String emailConnect = member.getEmail() + "@" + email2;
//			member.setEmail(emailConnect); 
//			}
			//주소 합치기
			if(road != null && street != null && detail != null) {
				String addressAdd = road + street + detail + ref;
				member.setAddress(addressAdd);
			}
			
			if(memberService.insertMember(member) > 0 ) {
				 return "member/moveLoginPage"; 
			}else {
				model.addAttribute("message", "회원 가입 실패! 확인하고 다시 가입해 주세요.");
				return "member/moveEnrollPage";
			}
		}
		
		
		
		
		//ajax 통신으로 가입할 아이디 중복 확인 요청 처리용 메소드
		@RequestMapping(value="idchk.do", method=RequestMethod.POST)
		public void dupCheckId(@RequestParam("memberID") String memberid, 
								HttpServletResponse response) throws IOException {
			
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
		
		
		@Autowired
		JavaMailSenderImpl mailSender;

		//이메일 인증
		@PostMapping("emailAuth.do")
		@ResponseBody
		public int emailAuth(String email) {
			
			logger.info("전달 받은 이메일 주소 : " + email);
			
			//난수의 범위 111111 ~ 999999 (6자리 난수)
			Random random = new Random();
			int checkNum = random.nextInt(888888)+111111;
			
			//이메일 보낼 양식
			String setFrom = "noramore12@naver.com"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
			String toMail = email;
			String title = "회원가입 인증 이메일 입니다.";
			String content = "인증 코드는 " + checkNum + " 입니다." +
							 "<br>" +
							 "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
			
			System.out.println("메일 내용 : " + content + "보낸에메일 : " + setFrom);
			try {
				MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content, true);
	            mailSender.send(message);
	            logger.info("랜덤숫자!!! : " + checkNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			logger.info("랜덤숫자 : " + checkNum);
			return checkNum;
		}
}



