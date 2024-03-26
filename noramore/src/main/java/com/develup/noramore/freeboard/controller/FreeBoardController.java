package com.develup.noramore.freeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.develup.noramore.freeboard.model.service.FreeBoardService;

@Controller("freeBoardController")
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeBoardService;
	
	@RequestMapping("freeboardlist.do")
	public String selectFreeBoard() {
		
		return "freeboard/freeboardListView";
	}

}
