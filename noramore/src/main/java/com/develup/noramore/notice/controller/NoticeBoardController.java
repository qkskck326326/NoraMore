package com.develup.noramore.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.develup.noramore.notice.model.service.NoticeBoardService;

@Controller
public class NoticeBoardController {
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping("notice.do")
	public String selectRecrBoard() {
	
		return "notice/notice";
	}//
	
}
