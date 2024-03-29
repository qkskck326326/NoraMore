package com.develup.noramore.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.develup.noramore.common.Paging;
import com.develup.noramore.notice.model.service.NoticeBoardService;
import com.develup.noramore.notice.model.vo.Notice;

@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping("noticewrite.do")
	public String insertNoticeBoard() {
		return "notice/noticewrite";
	}//
	
	
	@RequestMapping("notice.do")
	public String selectNoticeBoard() {
	
		return "notice/notice";
	}
	
	
	@RequestMapping("nlist.do")
	public String noticeListMethod(
			@RequestParam(name="page", required=false) String page, 
			@RequestParam(name="limit", required=false) String slimit, 
			Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//한 페이지 공지 10개씩 출력되게 한다면
		int limit = 10;
		if (slimit != null) {
			limit = Integer.parseInt(slimit);
		}
		
		//총 페이지 수 계산을 위한 공지글 총갯수 조회
		int listCount = noticeBoardService.selectListCount();
		//페이지 관련 항목 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "nlist.do");
		paging.calculate();				
		
		//페이지에 출력할 목록 조회해 옴
		ArrayList<Notice> list = noticeBoardService.selectList(paging);
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);
			
			return "notice/notice";
		}else {
			model.addAttribute("message", currentPage + "페이지 목록 조회 실패!");
			return "common/error";
		}
	}
	
	@RequestMapping("noticedetail.do")
	public ModelAndView noticeDetailMethod(
			@RequestParam("no") int noticeno, ModelAndView mv, HttpSession session) {
		
		Notice notice = noticeBoardService.selectOne(noticeno);
		
		noticeBoardService.updateAddReadCount(noticeno);
		
		if(notice != null) {
			mv.addObject("notice", notice);
			
			mv.setViewName("notice/noticedetail");
		}
		
		return mv;
	}
		
}





























