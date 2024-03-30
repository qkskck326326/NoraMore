package com.develup.noramore.freeboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
	//자유게시판 제목 검색용 (페이징 처리)
	@RequestMapping(value="fbsearchTitle.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView freeBoardTitleMethod(
			@RequestParam("action") String action,
			@RequestParam("keyword") String keyword,
			@RequestParam(name = "limit", required = false) String slimit,
			@RequestParam(name = "page", required=false) String page,
			ModelAndView mv) {
	
	//검색결과에 대한 페이징 처리를 위한 페이지 지정
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		if(slimit != null) {
			limit = Integer.parseInt(slimit);
			
		}
		
		//검색결과가 적용된 총 페이지 계산을 위한 총 목록 갯수 조회해옴
		int listCount = freeBoardService.selectSearchTitleCount(keyword);
		
		Paging paging = new Paging(listCount, currentPage, limit, "fbsearchTitle.do");
		paging.calculate();
		
		//한 페이지에 출력할 검색 결과 적용된 목록 조회
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);
		
		ArrayList<FreeBoard> list = freeBoardService.selectSearchTitle(search);
		
		//받은 결과에 따라 성공/실패 페이지 내보내기
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);
			mv.addObject("limit", limit);
			
			mv.setViewName("freeboard/freeboardListView");
			
			
		} else {
			mv.addObject("message", action + "에 대한 " + keyword + "검색 결과가 존재하지 않습니다.");
			mv.setViewName("common/error");
			
		}
		return mv;
		
		
		
		
		
	}
			
	//게시글 작성자 검색용(페이징 처리)
	
	@RequestMapping(value = "fbsearchWriter.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView freeBoardSearchWriterMethod(
		@RequestParam("action") String action,
		@RequestParam("keyword") String keyword,
		@RequestParam(name="limit", required=false) String slimit,
		@RequestParam(name="page", required=false) String page,
		ModelAndView mv
			) {
		//검색결과에 대한 페이징 처리를 위한 페이지 지정
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10;
		if(slimit != null) {
			limit = Integer.parseInt(slimit);
		}
		
		//검색결과가 적용된 총 페이지 계산을 위한 총 목록 갯수 조회해옴
		int listCount = freeBoardService.selectSearchWriterCount(keyword);
		
		//뷰 페이지에 사용할 페이징 관련 값들 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "fbsearchWriter.do");
		paging.calculate();
		
		//한 페이지에 출력할 검색 결과 적용된 목록 조회
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);
		
		ArrayList<FreeBoard> list = freeBoardService.selectSearchWriter(search);
		
		//받은 결과에 따라 성공/실패 페이지 내보내기
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);
			mv.addObject("limit", limit);
			mv.setViewName("freeboard/freeboardListView");
			
		} else {
			mv.addObject("message",
					action + "에 대한 " + keyword + " 검색 결과가 존재하지 않습니다. ");
			mv.setViewName("common/error");
		}
		
		return mv;
		
		
		
		
		
		
		
		
	}
			
	
	 
	 

}
