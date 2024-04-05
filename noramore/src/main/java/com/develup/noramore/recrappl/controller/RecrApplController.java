package com.develup.noramore.recrappl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.develup.noramore.member.model.service.MemberService;
import com.develup.noramore.recrappl.model.service.RecrApplService;
import com.develup.noramore.recrappl.model.vo.RecrAppl;
import com.develup.noramore.recrboard.model.service.RecrBoardService;
import com.develup.noramore.recrboard.model.vo.RecrBoard;

@Controller
public class RecrApplController {
	@Autowired
	private RecrApplService recrApplService;
	@Autowired
	private RecrBoardService recrBoardService;
	@Autowired
	private MemberService memberService;
	
	  // 모집 신청
	  @RequestMapping("insertappl.do")
	  public String insertAppl(RecrAppl recrAppl, Model model) {  
		  RecrBoard recrBoard = recrBoardService.selectBoardId(recrAppl.getBoardId());
		  //Member member = memberService.
		  Boolean validate = true;
		  if(recrApplService.applSearchId(recrAppl) > 0) {
			  validate = false;
		  }
		  
		  
		  if(recrApplService.insertAppl(recrAppl) > 0) {		
				  model.addAttribute("message", "신청이 완료되었습니다.");
				  return "recrBoard/RecrBoardDetail";			  
		  }else {
			  model.addAttribute("message", "신청에 실패하였습니다 \n 모집 조건을 확인해 주세요");
			  return "recrBoard/RecrBoardDetail";
		  }
	  } 
	  
}//
