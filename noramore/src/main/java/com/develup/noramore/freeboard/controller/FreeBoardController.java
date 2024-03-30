package com.develup.noramore.freeboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.develup.noramore.common.Paging;
import com.develup.noramore.common.Search;
import com.develup.noramore.freeboard.model.service.FreeBoardService;
import com.develup.noramore.freeboard.model.vo.FreeBoard;


@Controller("freeBoardController")
public class FreeBoardController {
	
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	@RequestMapping("freeboardlist.do")
	public ModelAndView selectFreeBoard(ModelAndView mv, @RequestParam(name = "page", required = false) String page) {
		//ArrayList<FreeBoard> list = freeBoardService.selectFreeBoard();
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int listCount = freeBoardService.selectListcount();
		
		Paging paging = new Paging(listCount, currentPage, limit, "fblist.do");
		paging.calculate();
		
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		
		ArrayList<FreeBoard> list = freeBoardService.selectSearchList(search);
		
		
		mv.addObject("list", list);
		mv.setViewName("freeboard/freeboardListView");
		mv.addObject("currentPage", currentPage);
		mv.addObject("paging", paging);
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

	
	@RequestMapping("fbdetail.do")
	public String moveFreeBoardDetail(Model model,
									@RequestParam("boardId") int boardId,
									@RequestParam("page") String currentPage) {
		
		FreeBoard freeBoard = freeBoardService.selectBoardId(boardId);
		model.addAttribute("FreeBoard", freeBoard);
		model.addAttribute("page", currentPage);
		return "freeboard/freeboardDetailView";
		
	}
	
	 
	 

}
