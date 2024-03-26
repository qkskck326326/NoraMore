package com.develup.noramore.forbidden.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.develup.noramore.forbidden.model.service.ForbiddenService;

@Controller
public class ForbiddenController {
	@Autowired
	private ForbiddenService forbiddenService;
	
	
	//금지어 관리페이지 이동
	@RequestMapping("forbiddenView.do")
	public String forbiddenPage() {
		
		return "";
	}
	
	//금지어 전체 조회
	@RequestMapping("fblist.do")
	public String forbiddenList() {
		
		return "";
	}
	
	//금지어 정렬
	@RequestMapping("")
	public String forbiddenSortList() {
		
		return "";
	}
	
	//금지어 검색
	@RequestMapping("fbsearch.do")
	public String forbiddenSearch() {
		
		return "";
	}
	
	//금지어 추가
	@RequestMapping("fbinsert.do")
	public String forbiddenInsert() {
		
		return "";
	}
	
	//금지어 삭제
	@RequestMapping("fbdelete.do")
	public String forbiddenDelete() {
		
		return "";
	}
	
}
