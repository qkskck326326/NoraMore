package com.develup.noramore.recrboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.develup.noramore.recrboard.model.service.RecrBoardService;
import com.develup.noramore.recrboard.model.vo.RecrBoard;

// 모집테이블 전체 조회
@Controller("recrBoardController")
public class RecrBoardController {
	@Autowired
	private RecrBoardService recrBoardService;
	
	@RequestMapping("rblist.do")
	public ModelAndView selectRecrBoard(ModelAndView mv) {
		ArrayList<RecrBoard> list = recrBoardService.selectRecrBoard();
		mv.addObject("list", list);
		mv.setViewName("recrBoard/RecrBoardList");
		return mv;
	}//



	
}// CLASS
