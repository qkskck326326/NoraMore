package com.develup.noramore.freeboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("freeboardwrite.do")
	public String selectWriteFreeBoard() {
		
		return "freeboard/freeboardWriteForm";
	}
	
	@RequestMapping(value = "freeboardinsert.do")
	public ModelAndView insertFreeBoard(@ModelAttribute("freeBoard") FreeBoard freeBoard) throws Exception {
	    ModelAndView mv = new ModelAndView("redirect:freeboardlist.do");
	    freeBoardService.insertFreeBoard(freeBoard);
	    return mv;
	}
	
	
	
	 
	 

}
