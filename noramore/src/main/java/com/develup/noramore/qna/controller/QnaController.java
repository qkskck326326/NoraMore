package com.develup.noramore.qna.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.develup.noramore.common.Paging;
import com.develup.noramore.notice.model.vo.Notice;
import com.develup.noramore.qna.model.service.QnaService;
import com.develup.noramore.qna.model.vo.Qna;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;

	@RequestMapping("qnawrite.do")
	public String insertQna() {
		return "qna/qnawrite";
	}//

	@RequestMapping("qna.do")
	public String selectQna() {

		return "qna/qna";
	}//
	
	// Qna 수정페이지로 이동
	@RequestMapping("qmoveup.do")
	public ModelAndView moveUpdatePage(@RequestParam("boardId") int boardId, ModelAndView mv) {
		// 수정페이지에 출력할 공지글 조회해 옴
		Qna qna = qnaService.selectOne(boardId);

		if (qna != null) {
			mv.addObject("qna", qna);
			mv.setViewName("qna/qnaupdate");
		} else {
			mv.addObject("message", boardId + "번 공지글 수정페이지로 이동 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}
	
	//첨부파일 다운로드 요청 처리용
			@RequestMapping("qfdown.do")
			public ModelAndView fileDownMethod(
					ModelAndView mv, HttpServletRequest request, 
					@RequestParam("ofile") String originalFileName,
					@RequestParam("rfile") String renameFileName) {
				//파일 다운 메소드는 리턴 타입이 ModelAndView 로 정해져 있음
				
				//공지사항 첨부파일 저장 폴더 경로 지정
				String savePath = request.getSession().getServletContext().getRealPath(
						"resources/qna_upfiles");
				
				//저장 폴더에서 읽을 파일에 대한 파일 객체 생성함
				File renameFile = new File(savePath + "\\" + renameFileName);
				//파일 다운시 브라우저 내보낼 원래 파일이름에 대한 파일 객체 생성함
				File originFile = new File(originalFileName);
				
				//파일 다운로드용 뷰로 전달할 정보 저장 처리
				mv.setViewName("filedown");   //등록된 파일다운로드용 뷰클래스의 id명
				mv.addObject("renameFile", renameFile);
				mv.addObject("originFile", originFile);
				
				return mv;
			}
			
			
			@RequestMapping("qlist.do")
			public String qnaListMethod(@RequestParam(name = "page", required = false) String page,
					@RequestParam(name = "limit", required = false) String slimit, Model model) {
				int currentPage = 1;
				if (page != null) {
					currentPage = Integer.parseInt(page);
				}

				// 한 페이지 공지 10개씩 출력되게 한다면
				int limit = 10;
				if (slimit != null) {
					limit = Integer.parseInt(slimit);
				}

				// 총 페이지 수 계산을 위한 공지글 총갯수 조회
				int listCount = qnaService.selectListCount();
				// 페이지 관련 항목 계산 처리
				Paging paging = new Paging(listCount, currentPage, limit, "qlist.do");
				paging.calculate();

				// 페이지에 출력할 목록 조회해 옴
				ArrayList<Qna> list = qnaService.selectList(paging);

				if (list != null && list.size() > 0) {
					model.addAttribute("list", list);
					model.addAttribute("paging", paging);
					model.addAttribute("currentPage", currentPage);
					model.addAttribute("limit", limit);

					return "qna/qna";
				} else {
					model.addAttribute("message", currentPage + "페이지 목록 조회 실패!");
					return "common/error";
				}
			}
			
			@RequestMapping("qnadetail.do")
			public ModelAndView qnaDetailMethod(@RequestParam("no") int boarId, ModelAndView mv, HttpSession session) {

				Qna qna = qnaService.selectOne(boarId);

				qnaService.updateAddReadCount(boarId);

				if (qna != null) {
					mv.addObject("qna", qna);

					mv.setViewName("qna/qnadetail");
				}

				return mv;
			}
			
			
}






















