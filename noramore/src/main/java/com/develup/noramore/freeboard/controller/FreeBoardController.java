package com.develup.noramore.freeboard.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	//이 클래스에서 메소드 안의 요청과 반환값들의 결과 출력 확인을 위한 로그 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
		
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	//게시글 목록 보기 요청 처리용
	@RequestMapping("freeboardlist.do")
	public ModelAndView selectFreeBoard(ModelAndView mv,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "limit", required = false) String slimit) {
		//ArrayList<FreeBoard> list = freeBoardService.selectFreeBoard();
		int currentPage = 1;
		/*
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		*/
		if(page != null && page.trim().length() > 0) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		if(slimit != null && slimit.trim().length() > 0) {
			limit = Integer.parseInt(slimit);  //전송받은 한 페이지에 출력할 목록 갯수를 적용
		}
		/*
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		*/
		
		
		int listCount = freeBoardService.selectListcount();
		
		Paging paging = new Paging(listCount, currentPage, limit, "freeboardlist.do");
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
	
	//게시글(원글) 수정페이지로 이동 처리용
	@RequestMapping("fbupview.do")
	public String moveFreeBoardUpdatePage(
			@RequestParam("boardId") int boardId,
			@RequestParam("page") String page, Model model) {
		
	//수정 페이지에 전달해서 출력할 board 정보 조회함
	FreeBoard freeBoard = freeBoardService.selectBoard(boardId);
	
	int currentPage = 1;
	/* 아직 DetailView에 페이지 처리가 안된듯 ( 이 코드 있으면 에러뜸)
	if(page != null) {
		currentPage = Integer.parseInt(page);
	}
	logger.info("메시지"+boardId+page);
	*/
	if(freeBoard != null) {
		model.addAttribute("freeBoard", freeBoard);
		model.addAttribute("page", currentPage);
		
		return "freeboard/freeboardUpdateView";
	} else {
		model.addAttribute("message", boardId + "번 게시글 수정페이지로 이동 실패!");
		return "common/error";
	}
	
	
		
		
		
		
	}
	
	
	
	
	
	
	//원글 수정처리용
	@RequestMapping(value = "freeboardoriginupdate.do", method=RequestMethod.POST)
	public String freeBoardoriginUpdateMethod(
			FreeBoard freeBoard, HttpServletRequest request,
			@RequestParam(name="page", required =false) String page,
			@RequestParam(name="deleteFlag", required=false) String delFlag,
			@RequestParam(name="upfile", required=false) MultipartFile mfile, Model model) {
		
		int currentPage = 1;
		/*
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		*/
		
		//게시글 원글 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath(
				"resources/freeboard_upfiles");
		
		//첨부파일이 변경되었을 때의 처리 ------------------
		//1. 원래 첨부파일이 있는데, '파일삭제'를 선택한 경우
		//2. 원래 첨부파일이 있는데, 새로운 파일이 업로드된 경우 (첨부파일 변경)
		if(freeBoard.getFreeOriginalFileName() != null &&
				((delFlag != null && delFlag.equals("yes")) || !mfile.isEmpty())) {
			//저장 폴더에서 이전 파일을 삭제함
			new File(savePath + "\\" + freeBoard.getFreeRenameFileName()).delete();
			//board 안의 파일정보도 제거함
			freeBoard.setFreeOriginalFileName(null);
			freeBoard.setFreeRenameFileName(null);
			
		}
		
		//3. 새로운 첨부파일이 업로드된 경우
		if(!mfile.isEmpty()) {
			//전송온 첨부파일명 추출함
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			
			//저장 폴더에는 변경된 파일이름으로 파일을 저장함
			//파일 이름 바꾸기함 => 년월일시분초.확장자
			if(fileName != null && fileName.length() > 0) {
				//바꿀 파일명에 대한 문자열 포맷 만들기
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				logger.info("첨부 파일명 변경 확인 : " + fileName + ", " + renameFileName);
				
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
		
	} //첨부파일 있을 때
	
	if(freeBoardService.updateOrigin(freeBoard) > 0) {
		//댓글과 대댓글 수정 성공시 다시 상세보기가 보여지게 처리
		model.addAttribute("boardId", freeBoard.getBoardId());
		model.addAttribute("page", currentPage);
		
		return  "redirect:fbdetail.do";
		
	} else {
		model.addAttribute("message", freeBoard.getBoardId() + "번 글 수정 실패!");
		return "common/error";
		
	}
	
	
	
		
		
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
	//게시글 상세보기 요청 처리용 (이동용)
	@RequestMapping("fbdetail.do")
	public String moveFreeBoardDetail(Model model,
									@RequestParam("boardId") int boardId,
									@RequestParam("page") String currentPage) {
		
		//조회수 1증가 처리
		freeBoardService.updateAddReadCount(boardId);
		
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
	
	// 조회순 구현
	
	@RequestMapping(value = "freeviewslist.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView freeBoardSearchViewsMethod(
		@RequestParam(name="page", required=false) String page,
		ModelAndView mv
			) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		
		
		int listCount = freeBoardService.selectListcount();
		
		Paging paging = new Paging(listCount, currentPage, limit, "freeviewslist.do");
		paging.calculate();
		
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		
		ArrayList<FreeBoard> list = freeBoardService.selectViewsList(search);
		
		
		mv.addObject("list", list);
		mv.setViewName("freeboard/freeboardListView");
		mv.addObject("currentPage", currentPage);
		mv.addObject("paging", paging);
		return mv;
	
	}
	
	
	// 최신순 구현
	
	@RequestMapping(value = "freerecentlist.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView freeBoardSearchRecentMethod(
		@RequestParam(name="page", required=false) String page,
		ModelAndView mv
			) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		
		
		int listCount = freeBoardService.selectListcount();
		
		Paging paging = new Paging(listCount, currentPage, limit, "freerecentlist.do");
		paging.calculate();
		
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		
		ArrayList<FreeBoard> list = freeBoardService.selectRecentList(search);
		
		
		mv.addObject("list", list);
		mv.setViewName("freeboard/freeboardListView");
		mv.addObject("currentPage", currentPage);
		mv.addObject("paging", paging);
		
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
	
	//첨부파일 다운로드 요청 처리용
	//파일 다운로드 처리용 메소드는 리턴 타입이 ModelAndView로 정해져 있음
	@RequestMapping("fbdown.do")
	public ModelAndView freeBoardFileDownMethod(
			@RequestParam("ofile") String originalFileName,
			@RequestParam("rfile") String renameFileName,
			ModelAndView mv, HttpServletRequest request) {
		
		//게시글 첨부파일 저장 폴더 지정
		String savePath = request.getSession().getServletContext().getRealPath(
				"resources/freeboard_upfiles");
		
		//저장 촐더에서 읽을 파일에 대한 File 객체 생성함
		File readFile = new File(savePath + "\\" + renameFileName);
		//파일 다운시 브라우저로 내보낼 원래 파일명에 대한 File 객체 생성함
		File originFile = new File(originalFileName);
		
		//스프링에서는 파일다운로드를 처리하는 뷰클래스를 별도로 작성하도록 되어있음
		//스프링이 제공하는 View 클래스를 상속받은 후손 클래스로 만들어야 함
		
		//파일다운로드용 뷰로 전달할 정보 저장 처리
		mv.setViewName("filedown"); //등록된 파일다운로드용 뷰클래스의 id명
		mv.addObject("renameFile", readFile);
		mv.addObject("originFile", originFile);
		
		return mv;
		
	
		
		
	}
	
	//게시글(원글) 삭제 요청 처리용
	@RequestMapping("freeboarddelete.do")
	public String freeBoardDeleteMethod(
			FreeBoard freeBoard, Model model, HttpServletRequest request ) {
		
		if(freeBoardService.deleteBoard(freeBoard) > 0) {
			//게시글 삭제 성공시 저장 폴더에 있는 첨부파일도 삭제함
			if(freeBoard.getFreeRenameFileName() != null) {
				String savePath = request.getSession().getServletContext().getRealPath(
						"resources/freeboard_upfiles");
				//저장 폴더에서 파일 삭제함
				new File(savePath + "\\" + freeBoard.getFreeRenameFileName()).delete();
				
			}
			return "redirect:freeboardlist.do";
			
		} else {
			model.addAttribute("message", freeBoard.getBoardId() + "번 게시글 삭제 실패!");
			return "common/error";
		}
		
		
	}
	
	
	
	 
	 

}
