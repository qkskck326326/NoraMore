package com.develup.noramore.recrappl.controller;

import java.time.LocalDate;
import java.time.Period;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.develup.noramore.member.model.service.MemberService;
import com.develup.noramore.member.model.vo.Member;
import com.develup.noramore.recrappl.model.service.RecrApplService;
import com.develup.noramore.recrappl.model.vo.RecrAppl;
import com.develup.noramore.recrboard.model.service.RecrBoardService;
import com.develup.noramore.recrboard.model.vo.RecrBoard;

@Controller
public class RecrApplController {
	private static final Logger logger = LoggerFactory.getLogger(RecrApplController.class);
	@Autowired
	private RecrApplService recrApplService;
	@Autowired
	private RecrBoardService recrBoardService;
	@Autowired
	private MemberService memberService;
	
	  // 모집 신청
	  @RequestMapping("insertappl.do")
	  public String insertAppl(RecrAppl recrAppl, Model model, @RequestParam("page") int page, @RequestParam("categoryId") int categoryId) {  
		  RecrBoard recrBoard = recrBoardService.selectBoardId(recrAppl.getBoardId());
		  Member memberA = memberService.selectMember(recrAppl.getMemberId());
		  
		  int minAgeCon = recrBoard.getAgeMinCondition();
		  int maxAgeCon = recrBoard.getAgeMaxCondition();
		  if(maxAgeCon == 0) {
			  maxAgeCon = 999;
		  }
		  String genderCon = recrBoard.getGenderCondition();
		  String gender = memberA.getGender();
		  
		  LocalDate birthLocalDate = memberA.getBirth().toLocalDate();
	      LocalDate currentDate = LocalDate.now();
		  
		  int age = Period.between(birthLocalDate, currentDate).getYears();
		  
		  Boolean validate = true;
		  if(recrApplService.searchAppl(recrAppl) > 0) {
			  model.addAttribute("message", "이미 신청한 모집입니다.");
			  model.addAttribute("currentPage", page);
			  model.addAttribute("categoryId", categoryId);
			  model.addAttribute("RecrBoard", recrBoard);
			  return "recrBoard/RecrBoardDetail";
		  }
		  if(age > maxAgeCon || age < minAgeCon) {
			  validate = false;
		  }
		  if(!(genderCon.equals(gender))){
			  validate = false;
		  }
		  
		  
		  if(validate) {
			  if(recrApplService.insertAppl(recrAppl) > 0) {		
				  model.addAttribute("message", "신청이 완료되었습니다.");
				  model.addAttribute("currentPage", page);
				  model.addAttribute("categoryId", categoryId);
				  model.addAttribute("RecrBoard", recrBoard);
				  return "recrBoard/RecrBoardDetail";			  
			  }else {
				  model.addAttribute("message", "error! 신청에 실패하였습니다");
				  model.addAttribute("currentPage", page);
				  model.addAttribute("categoryId", categoryId);
				  model.addAttribute("RecrBoard", recrBoard);
				  return "recrBoard/RecrBoardDetail";
			  }
		  }else {
			  model.addAttribute("message", "신청에 실패하였습니다! 모집 조건을 확인해 주세요");
			  model.addAttribute("currentPage", page);
			  model.addAttribute("categoryId", categoryId);
			  model.addAttribute("RecrBoard", recrBoard);
			  return "recrBoard/RecrBoardDetail";
		  }
		  
		  
		  
		  
		  
		  
	  } 
	  
}//
