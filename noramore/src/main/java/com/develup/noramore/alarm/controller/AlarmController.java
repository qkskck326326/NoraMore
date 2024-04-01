package com.develup.noramore.alarm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.develup.noramore.alarm.model.service.AlarmService;
import com.develup.noramore.alarm.model.vo.Alarm;
import com.develup.noramore.common.Paging;
import com.develup.noramore.recrappl.model.vo.RecrAppl;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmService;
	
	//로그인시 알람종버튼에 알람개수 숫자표시
	
	
	//알람 전체 조회
	@RequestMapping("alarmlist.do")
	public String alarmPage(
				@RequestParam(name="page", required=false) String page,
				 @RequestParam(name="limit", required=false) String slimit,
				 HttpServletRequest request, Model model) {
		
		int currentPage = 1;
		if(page != null && page.trim().length() > 0) {
		currentPage = Integer.parseInt(page);
		}
		
		//한 페이지에 게시글 10개씩 출력되게 한다면
		int limit = 10;
		if(slimit != null && slimit.trim().length() > 0) {
		limit = Integer.parseInt(slimit); //전송받은 한 페이지에 출력할 목록 갯수를 적
		}
		
		int listCount = alarmService.selectListCount((String)request.getSession().getAttribute("memberID")); //페이징 계산 처리 실행
		Paging paging = new Paging(listCount, currentPage, limit, "alarmlist.do");
		paging.calculate();
		
		Alarm alarm = new Alarm();
		alarm.setReceiverId((String)request.getSession().getAttribute("memberID"));
		alarm.setStartRow(paging.getStartRow());
		alarm.setEndRow(paging.getEndRow());
		
		//출력할 페이지에 대한 목록 조회
		ArrayList<Alarm> list = alarmService.selectList(alarm);
		
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
	
	
	//(댓글) 알람 생성 : 댓글 작성시 테이블명, 댓글ID 보내줄 것
	@RequestMapping("commAlarm.do")
	public void commAlarmInsert(
			@RequestParam("alarmKind") String alarmKind,
			@RequestParam("commentId") String commentId,
			HttpServletRequest request) {
		
		Alarm alarm = new Alarm();
		alarm.setAlarmKind(alarmKind);
		alarm.setNativeId(commentId);
		alarm.setSenderId((String)request.getSession().getAttribute("memberID"));
		
		alarmService.insertCommAlarm(alarm);
		
  }

	//(신청) 알람 생성 : 신청시 테이블명, 신청정보 요청과 함께 보내줄 것
	@RequestMapping("applAlarm.do")
	public void applAlarmInsert(
			@RequestParam("alarmKind") String alarmKind,
			RecrAppl recrAppl,
			HttpServletRequest request) {
		
		Alarm alarm = new Alarm();
		alarm.setAlarmKind(alarmKind);
		alarm.setNativeId(String.valueOf(recrAppl.getBoardId()));
		alarm.setSenderId((String)request.getSession().getAttribute("memberID"));
		
		alarmService.insertApplAlarm(alarm);
	}
	
	//알람 확인 (y/n 수정)
	@RequestMapping("alarmCheck.do")
	public void alarmChecked(
			@RequestParam("check") String check,
			@RequestParam("alarmId") int alarmId) {
		Alarm alarm = new Alarm();
		alarm.setAlarmId(alarmId);
		
		if(check != null) {
			alarm.setCheckedYN("Y");
		}
		
		alarmService.updateAlarm(alarm);
	}
	
	
	
	
	
	
}
