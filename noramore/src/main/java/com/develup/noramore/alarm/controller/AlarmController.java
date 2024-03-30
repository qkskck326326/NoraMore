package com.develup.noramore.alarm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.develup.noramore.alarm.model.service.AlarmService;
import com.develup.noramore.alarm.model.vo.Alarm;
import com.develup.noramore.common.Paging;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmService;
	
	
	//알람 전체 조회
	@RequestMapping(value="alarmlist.do", method=RequestMethod.POST)
	public String alarmPage(
				@RequestParam("memberID") String memberId,
				@RequestParam(name="page", required=false) String page,
				 @RequestParam(name="limit", required=false) String slimit, Model model) {
		
		int currentPage = 1;
		if(page != null && page.trim().length() > 0) {
		currentPage = Integer.parseInt(page);
		}
		
		//한 페이지에 게시글 10개씩 출력되게 한다면
		int limit = 10;
		if(slimit != null && slimit.trim().length() > 0) {
		limit = Integer.parseInt(slimit); //전송받은 한 페이지에 출력할 목록 갯수를 적
		}
		
		int listCount = alarmService.selectListCount(memberId); //페이징 계산 처리 실행
		Paging paging = new Paging(listCount, currentPage, limit, "alarmlist.do");
		paging.calculate();
		
		//출력할 페이지에 대한 목록 조회
		ArrayList<Alarm> list = alarmService.selectList(paging);
		
		//받은 결과로 성공/실패 페이지 내보냄
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);
		
			return "alarm/alarmListView";
		}else {
			model.addAttribute("message", currentPage + " 페이지 목록 조회 실패!");
			return "common/error";
		}
	}
	
	
	//알람 조회
	
	public String alarmCheck() {
		
		return "";
	}
	
	
	//알람 생성
	
	public String alarmInsert() {
		
		return "";
	}
	
	//알람 확인 (y/n 수정)
	
	public String alarmRecieve() {
		
		return "";
	}
	
	
	
	
	
	
}
