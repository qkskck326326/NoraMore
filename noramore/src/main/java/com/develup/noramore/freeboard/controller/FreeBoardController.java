package com.develup.noramore.freeboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.develup.noramore.freeboard.model.service.FreeBoardService;
import com.develup.noramore.freeboard.model.vo.FreeBoard;

@Controller("freeBoardController")
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeBoardService;
	
	@RequestMapping("freeboardlist.do")
	public String selectFreeBoard() {
		
		
		return "freeboard/freeboardListView";
	}
	
	@RequestMapping("freeboarddetail.do")
	public String selectDetailFreeBoard() {
		
		return "freeboard/freeboardDetailView";
	}

}
