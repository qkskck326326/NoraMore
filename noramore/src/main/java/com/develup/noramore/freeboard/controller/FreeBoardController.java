package com.develup.noramore.freeboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.develup.noramore.common.Paging;
import com.develup.noramore.freeboard.model.service.FreeBoardService;
import com.develup.noramore.freeboard.model.vo.FreeBoard;

@Controller("freeBoardController")
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeBoardService;
	
	@RequestMapping("freeboardlist.do")
	public ModelAndView selectFreeBoard(ModelAndView mv) {
		ArrayList<FreeBoard> list = freeBoardService.selectFreeBoard();
		mv.addObject("list", list);
		mv.setViewName("freeboard/freeboardListView");
		return mv;
		
	}
	
	@RequestMapping("freeboarddetail.do")
	public String selectDetailFreeBoard() {
		
		return "freeboard/freeboardDetailView";
	}

}
