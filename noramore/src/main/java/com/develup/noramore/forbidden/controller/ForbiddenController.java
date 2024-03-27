package com.develup.noramore.forbidden.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.develup.noramore.common.Paging;
import com.develup.noramore.forbidden.model.service.ForbiddenService;
import com.develup.noramore.forbidden.model.vo.Forbidden;

@Controller
public class ForbiddenController {
	@Autowired
	private ForbiddenService forbiddenService;
	
	@RequestMapping(value="fbchk.do", method=RequestMethod.POST)
	public void dupCheckIdMethod(@RequestParam("fbWord") String fbWord, 
			HttpServletResponse response) throws IOException {
		//메소드 매개변수 영역에서 사용하는 어노테이션 중에
		//@RequestParam("전송온이름")  자료형 값저장변수명
		//자료형 값저장변수명 = request.getParameter("전송온이름");  코드와 같음
		
		int fbCount = forbiddenService.selectCheckFb(fbWord);
		
		String returnStr = null;
		if(fbCount == 0) {
			returnStr = "ok";
		}else {
			returnStr = "dup";
		}
		
		//response 를 이용해서 클라이언트와 출력스트림을 열어서 문자열값 내보냄
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		out.close();
	}
	//금지어 추가 페이지(팝업) 이동
	@RequestMapping("forbiddenInsert.do")
	public String forbiddenPage(@RequestParam("fbWord") String fbWord) {

			if(forbiddenService.insertForbidden(fbWord) > 0) {
				return "redirect:fblist.do";
			}else {
				//중복 상황 제외 실패
				return "";

		}
		
		
	}
	
	
	
	//금지어 전체 조회
	@RequestMapping("fblist.do")
	public String forbiddenList(
						 @RequestParam(name="page", required=false) String page,
						 @RequestParam(name="limit", required=false) String slimit, Model model) {
		
		
		 int currentPage = 1; if(page != null && page.trim().length() > 0) {
		 currentPage = Integer.parseInt(page); }
		 
		 //한 페이지에 게시글 10개씩 출력되게 한다면
		 int limit = 10;
		 if(slimit != null && slimit.trim().length() > 0) {
			 limit = Integer.parseInt(slimit); //전송받은 한 페이지에 출력할 목록 갯수를 적
		 }
		 
		 //총페이지수 계산을 위해 게시글 전체 갯수 조회해 옴
		 int listCount = forbiddenService.selectListCount(); //페이징 계산 처리 실행
		 Paging paging = new Paging(listCount, currentPage, limit, "blist.do");
		 paging.calculate();
		 
		 //출력할 페이지에 대한 목록 조회 ArrayList<Forbidden> list =
		 ArrayList<Forbidden> list = forbiddenService.selectList(paging);
		 
		 model.addAttribute("list", list);
		 model.addAttribute("paging", paging);
		 model.addAttribute("currentPage", currentPage);
		 model.addAttribute("limit", limit);
		 
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
