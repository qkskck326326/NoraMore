package com.develup.noramore.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	}//
	
	// 전체 공지사항 출력용 메소드
	@RequestMapping("nlist.do")
	public String noticeListMethod(
			@RequestParam(name="page", required=false) String page,
			@RequestParam(name="limit", required=false) String slimit,
			Model model) {
		
		int currentPage = 1;
		if(page != null && page.trim().length() > 0) {
			currentPage = Integer.parseInt(page);
		}
		
		// 한페이지에 10개의 게시물을 출력
		int limit = 10;
		if(slimit != null && slimit.trim().length() > 0) {
			limit = Integer.parseInt(slimit);
		}
		
		// 총 페이지 수 계산을 위한 공짓글 총 갯수
		int listCount = noticeBoardService.selectListCount();
		Paging paging = new Paging(listCount, currentPage, limit, "nlist.do");
		paging.calculate();
		
		ArrayList<Notice> list = noticeBoardService.selectList(paging);
		
		
		return "notice/notice";
	}
}
