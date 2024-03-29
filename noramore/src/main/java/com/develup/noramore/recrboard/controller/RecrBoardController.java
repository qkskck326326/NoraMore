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

	
	  @RequestMapping("rbinsert.do") 
	  public String insertRecrBoard(RecrBoard recrBoard, HttpServletRequest request, Model model, 
			  		@RequestParam("memberId") String memberId, 
			  		@RequestParam(name="upfile", required=false) MultipartFile mfile) {
		  
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
			  model.addAttribute("memberId", recrBoard.getMemberId());
			  return "recrBoard/RecrBoardDetail"; 
		  }else{
			  model.addAttribute("message", " 글 등록에 실패하였습니다.");
			  return "recerBoarad/RecrBoardList";
		  }
		  
		 
	  }//
	 

	// ****************************** 이동용 *********************************

	@RequestMapping("rbdetail.do")
	public String moveRecrBoardDetail(Model model, @RequestParam("boardId") int boardId) {
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
