package com.develup.noramore.recrboard.controller;

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
import com.develup.noramore.recrboard.model.service.RecrBoardService;
import com.develup.noramore.recrboard.model.vo.RecrBoard;

// 모집테이블 전체 조회
@Controller("recrBoardController")
public class RecrBoardController {
	private static final Logger logger = LoggerFactory.getLogger(RecrBoardController.class);
	@Autowired
	private RecrBoardService recrBoardService;
	
	
	// 테이블 검색
	@RequestMapping("rblist.do")
	public ModelAndView selectRecrBoard(ModelAndView mv, @RequestParam(name = "page", required = false) String page) {
		// ArrayList<RecrBoard> list = recrBoardService.selectRecrBoard();
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10;
		if (page != null) {
			currentPage = Integer.parseInt(page);

		}

		int listCount = recrBoardService.selectListcount();

		Paging paging = new Paging(listCount, currentPage, limit, "rblist.do");
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

	
	  // 모집테이블 생성
	  @RequestMapping(value="insertrb.do", method=RequestMethod.POST) 
	  public String insertRecrBoard(RecrBoard recrBoard, HttpServletRequest request, Model model, 
			  		@RequestParam(name="upfile", required=false) MultipartFile mfile,
			  		@RequestParam("maxRecr1") String maxRecr, @RequestParam(name="ageMinCondition1", required=false) String ageMinCondition, 
			  		@RequestParam(name="ageMaxCondition1", required=false) String ageMaxCondition) {
		  // input을 number 로 해도 이쪽으로 보낼 때는 String 형태로 넘어와서 취한 조취
		  if(!ageMaxCondition.isEmpty()) {
			    recrBoard.setAgeMaxCondition(Integer.parseInt(ageMaxCondition));
			}
			if(!ageMinCondition.isEmpty()) {
			    recrBoard.setAgeMinCondition(Integer.parseInt(ageMinCondition));
			}
			if(!maxRecr.isEmpty()) {
			    recrBoard.setMaxRecr(Integer.parseInt(maxRecr));
			}


		  
		  
		  
		  String savePath = request.getSession().getServletContext().getRealPath("resources/recrboard_upfiles");
		  
		  if(!mfile.isEmpty()){
				//전송온 첨부파일명 추출함
				String fileName = mfile.getOriginalFilename();
				String renameFileName = null;
				
				// 저장 폴더는 변경된 파일 이름으로 파일 저장
				// 파일 이름 바꾸기 => 년월일시분초.확장자
				if(fileName != null && fileName.length() > 0) {
					// 바꿀 파일명에 대한 문자열 포멧 만들기
					renameFileName = FileNameChange.change(fileName, "yyyyMMddhhmmss");
					logger.info("파일명 변경 : " + fileName + " => " + renameFileName);
					
					try {
						// 지정한 저장 폴더에 파일명 바꾸기 처리함
						mfile.transferTo(new File(savePath + "\\" + renameFileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("message", "첨부파일 파일명 변환 중 에러가 발생했습니다. ");
						return "recerBoarad/RecrBoardList";
					}
				}/// 파일명 바꾸기
				
				recrBoard.setRecrOriginalFilename(fileName);
				recrBoard.setRecrRenameFilename(renameFileName);
			}
		  
		  
		  if(recrBoardService.insertRecrBoard(recrBoard) > 0) {
			  model.addAttribute("message", " 글이 등록되었습니다.");
			  model.addAttribute("RecrBoard", recrBoard);
			  return "recrBoard/RecrBoardDetail"; 
		  }else{
			  model.addAttribute("message", " 글 등록에 실패하였습니다.");
			  return "recerBoarad/RecrBoardList";
		  }
		  
		 
	  }//
	  
	  // 파일 다운로드 처리
	@RequestMapping("rbdown.do")
	public ModelAndView fileDown(
			@RequestParam("ofile") String originalFileName, 
			@RequestParam("rfile") String renameFileName,
			ModelAndView mv, HttpServletRequest request) {
		
		return mv;
	}
	
	// ****************************** 이동용 *********************************

	@RequestMapping("rbdetail.do")
	public String moveRecrBoardDetail(Model model, @RequestParam("boardId") int boardId,
										@RequestParam("page") String currentPage) {
		RecrBoard recrBoard = recrBoardService.selectBoardId(boardId);
		model.addAttribute("RecrBoard", recrBoard);
		model.addAttribute("page", currentPage);
		return "recrBoard/RecrBoardDetail";
	}

	@RequestMapping("rbwriteform.do")
	public String moveRecrBoardWriteForm() {
		return "recrBoard/RecrBoardWriteForm";
	}

//	Board board, Model model, HttpServletRequest request, 
//	@RequestParam(name="upfile", required=false) MultipartFile mfile

}// CLASS
