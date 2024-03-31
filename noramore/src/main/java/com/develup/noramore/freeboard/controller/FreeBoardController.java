package com.develup.noramore.freeboard.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.develup.noramore.common.FileNameChange;
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
	
	/*
	@RequestMapping(value = "freeboardinsert.do")
	public ModelAndView insertFreeBoard(@ModelAttribute("freeBoard") FreeBoard freeBoard) throws Exception {
	    ModelAndView mv = new ModelAndView("redirect:freeboardlist.do");
	    freeBoardService.insertFreeBoard(freeBoard);
	    return mv;
	}

*/
	
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
			
	//새 게시글 등록 요청 처리용 (첨부파일 업로드 기능 추가)
	
	@RequestMapping(value = "freeboardinsert.do", method = RequestMethod.POST)
	public String freeBoardInsertMethod(FreeBoard freeBoard, Model model, HttpServletRequest request,
			@RequestParam(name="upfile", required= false) MultipartFile mfile) {
		
		//게시글 첨부파일 저장용 폴더 지정 : 톰켓이 구동하고 있는 애플리케이션 프로젝트 안의 폴더 지정
		//el 절대경로 표기인 ${ pageContext.servletContext.contextPath } 와 같은 의미의 코드임
		String savePath = request.getSession().getServletContext().getRealPath(
				"resources/freeboard_upfiles");
		
		//첨부파일이 있을 때
		if(!mfile.isEmpty()) {
			//전송온 첨부파일명 추출함
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			
			//저장 폴더에는 변경된 파일이름으로 파일을 저장함
			//파일 이름 바꾸기함 => 년월월시분초.확장자
			if(fileName != null && fileName.length() > 0) {
				//바꿀파일명에 대한 문자열 포멧 만들기
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				
				try {
					//지정한 저장 폴더에 파일명 바꾸기 처리함
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
					
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부 파일 저장 실패!");
					return "common/error";
				}
				
				
				
			} //파일명 바꾸기
			//freeboard에 첨부파일 정보 저장 처리
			freeBoard.setFreeOriginalFileName(fileName);
			freeBoard.setFreeRenameFileName(renameFileName);
			
			
		} //첨부 파일 있을 때
		
		if(freeBoardService.insertOriginBoard(freeBoard)>0) {
			//게시글 등록 성공시 목록 보기 페이지로 이동
			return "redirect:freeboardlist.do";
			
		} else {
			model.addAttribute("message", "새 게시 원글 등록 실패!");
			return "common/error";
		}
				
		
		
	}
	
	 
	 

}
