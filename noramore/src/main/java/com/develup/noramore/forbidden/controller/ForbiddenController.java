package com.develup.noramore.forbidden.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.develup.noramore.common.Paging;
import com.develup.noramore.forbidden.model.service.ForbiddenService;
import com.develup.noramore.forbidden.model.vo.Forbidden;

@Controller
public class ForbiddenController {
	@Autowired
	private ForbiddenService forbiddenService;
	
	
	//금지어 추가 페이지(팝업) 이동
	@RequestMapping("forbiddenInsert.do")
	public String forbiddenPage(@RequestParam("fbWord") String fbWord) {
		
		int result = forbiddenService.insertForbidden(fbWord);
		
		return "forbidden/forbiddenListView";
	}
	
	//금지어 전체 조회
	@RequestMapping("fblist.do")
	public String forbiddenList(/*
								 * @RequestParam(name="page", required=false) String page,
								 * 
								 * @RequestParam(name="limit", required=false) String slimit, Model model
								 */) {
		
		/*
		 * int currentPage = 1; if(page != null && page.trim().length() > 0) {
		 * currentPage = Integer.parseInt(page); }
		 * 
		 * //한 페이지에 게시글 10개씩 출력되게 한다면 int limit = 10; if(slimit != null &&
		 * slimit.trim().length() > 0) { limit = Integer.parseInt(slimit); //전송받은 한 페이지에
		 * 출력할 목록 갯수를 적용 }
		 * 
		 * //총페이지수 계산을 위해 게시글 전체 갯수 조회해 옴 int listCount =
		 * forbiddenService.selectListCount(); //페이징 계산 처리 실행 Paging paging = new
		 * Paging(listCount, currentPage, limit, "blist.do"); paging.calculate();
		 * 
		 * //출력할 페이지에 대한 목록 조회 ArrayList<Forbidden> list =
		 * forbiddenService.selectList(paging);
		 */
		return "forbidden/forbiddenListView";
	}
	
	//금지어 정렬
	@RequestMapping("")
	public String forbiddenSortList() {
		
		return "";
	}
	
	//금지어 검색
	@RequestMapping("fbsearch.do")
	public String forbiddenSearch() {
		return "";
		
//		if() {
//		return "";
//		
//		}else{
//			
//		}
	}
	
	//금지어 추가
	@RequestMapping("fbinsert.do")
	public String forbiddenInsert() {
		
		return "forbidden/forbiddenInsertView";
	}
	
	//금지어 삭제
	@RequestMapping("fbdelete.do")
	public String forbiddenDelete() {
		
		return "";
	}
	
}
