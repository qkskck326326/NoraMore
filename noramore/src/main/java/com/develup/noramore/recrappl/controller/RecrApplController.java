package com.develup.noramore.recrappl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.develup.noramore.member.model.vo.Member;
import com.develup.noramore.recrappl.model.service.RecrApplService;
import com.develup.noramore.recrappl.model.vo.RecrAppl;
import com.develup.noramore.recrboard.model.vo.RecrBoard;
public class RecrApplController {
	@Autowired
	private RecrApplService recrApplService;
	
	  // 모집 신청
	  @RequestMapping("insertappl.do")
	  public String insertAppl(RecrAppl recrAppl, Model model, RecrBoard recrboard, Member loginmember) {  
		  int minCon = recrboard.getAgeMaxCondition();
		  int maxCon = recrboard.getAgeMinCondition();
		  String genderCon = recrboard.getGenderCondition();
		  
		  
		  
		  
		  if(recrApplService.insertAppl(recrAppl) > 0) {
				  model.addAttribute("message", "신청이 완료되었습니다.");
				  return "recrBoard/RecrBoardDetail";			  
		  }else {
			  model.addAttribute("message", "error! 신청 오류가 발생하였습니다.");
			  return "recrBoard/RecrBoardDetail";
		  }
	  }//
	  
}//
