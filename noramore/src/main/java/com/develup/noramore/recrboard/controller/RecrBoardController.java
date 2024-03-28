package com.develup.noramore.recrboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.develup.noramore.common.Paging;
import com.develup.noramore.common.Search;
import com.develup.noramore.recrboard.model.service.RecrBoardService;
import com.develup.noramore.recrboard.model.vo.RecrBoard;

// 모집테이블 전체 조회
@Controller("recrBoardController")
public class RecrBoardController {
	@Autowired
	private RecrBoardService recrBoardService;
	
	@RequestMapping("rblist.do")
	public ModelAndView selectRecrBoard(ModelAndView mv,
										@RequestParam(name="Page", required=false) String page) {
		//ArrayList<RecrBoard> list = recrBoardService.selectRecrBoard();
		int currentPage = 1;
		int limit = 10;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		
		}
		
		int listCount = recrBoardService.selectListcount();
		
		Paging paging = new Paging(listCount, currentPage, limit,"rblist.do");
		paging.calculate();
		
		// 한 페이지에 출력할 검색 결과 적용된 목록 조회
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		
		
		ArrayList<RecrBoard> list = recrBoardService.selectSearchList(search);
		

		mv.addObject("list", list);
		mv.setViewName("recrBoard/RecrBoardList");
		mv.addObject("currentPage", currentPage);
		mv.addObject("paging", paging);
		return mv;
	}//
	
	
	/*
	 * @RequestMapping("") public String insertRecrBoard(RecrBoard recrBoard) {
	 * 
	 * return "recrBoard/RecrBoardDetail"; }//
	 */	
	
	
	// ******************************  이동용 *********************************
	
	@RequestMapping("rbdetail.do")
	public String moveRecrBoardDetail(Model model,
									@RequestParam("boardId") int boardId) {
		RecrBoard recrBoard = recrBoardService.selectBoardId(boardId);
		model.addAttribute("RecrBoard", recrBoard);
		return "recrBoard/RecrBoardDetail";
	}
	
	@RequestMapping("rbwriteform.do")
	public String moveRecrBoardWriteForm() {
		return "recrBoard/RecrBoardWriteForm";
	}
	
	

//	Board board, Model model, HttpServletRequest request, 
//	@RequestParam(name="upfile", required=false) MultipartFile mfile
	
}// CLASS
