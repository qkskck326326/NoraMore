package com.develup.noramore.memadd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.develup.noramore.memadd.model.service.MemAddService;
import com.develup.noramore.memadd.model.vo.MemAdd;

@Controller
public class MemAddController {

	
	@Autowired
	private MemAddService memAddService;
	
	
	//등급페이지로 이동
@RequestMapping(value = "grade.do", method = { RequestMethod.GET, RequestMethod.POST })
// RequestMethod.GET : get방식으로 전송오면 받음, RequestMethod.POST : post방식으로 전송오면 받음
public String gradePage(@RequestParam("memberID") String memberid, Model model) {
	System.out.println("memberid : " + memberid);
	
	MemAdd memAdd = memAddService.selectAll(memberid);
	
	System.out.println("memAdd : " + memAdd);
	if (memAdd != null) { 
		model.addAttribute("memAdd", memAdd); // 꺼낼 때는 여기서 저장한 이름으로 꺼냄
		return "member/gradePage";
	} else {
		return "redirect:home.do";
	}
}
	
}
