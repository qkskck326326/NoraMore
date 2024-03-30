package com.develup.noramore.recrappl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.develup.noramore.recrappl.model.service.RecrApplService;
import com.develup.noramore.recrappl.model.vo.RecrAppl;
import com.develup.noramore.recrboard.model.service.RecrBoardService;

@Controller
public class RecrApplController {
	@Autowired
	private RecrApplService recrApplService;
	@Autowired
	private RecrBoardService recrBoardService;
	
	  // 모집 신청
	  @RequestMapping("insertappl.do")
	  public String insertAppl(RecrAppl recrAppl, Model model) {  
		  if(recrApplService.insertAppl(recrAppl) > 0) {
			  int result = recrBoardService.upNowRecr(recrAppl.getBoardId());
			  if (result > 0) {
				  model.addAttribute("message", "신청이 완료되었습니다.");
				  return "recrBoard/RecrBoardDetail";
			  }else {
				  model.addAttribute("message", "error! 신청 오류가 발생하였습니다.");
				  return "recrBoard/RecrBoardDetail";
			  }
		  }else {
			  model.addAttribute("message", "error! 신청 오류가 발생하였습니다.");
			  return "recrBoard/RecrBoardDetail";
		  }
	  }
	  
}//
