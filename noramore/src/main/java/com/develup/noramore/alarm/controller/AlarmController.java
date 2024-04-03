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
import com.develup.noramore.member.model.vo.Member;
import com.develup.noramore.recrappl.model.vo.RecrAppl;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmService;
	
	//로그인시 알람종버튼에 알람개수 숫자표시
	@RequestMapping("alarmbell.do")
	public String alarmBell(HttpServletRequest request, Model model){
		Member member = (Member)request.getSession().getAttribute("loginMember");
		int listCount = alarmService.selectNewCount(member.getMemberID());
		
		if(listCount > 0) {
			model.addAttribute("listCount", listCount);
		}
		return "";
	}
	
	
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
		
		Member member = (Member)request.getSession().getAttribute("loginMember");
		
		int listCount = alarmService.selectListCount(member.getMemberID()); //페이징 계산 처리 실행
		Paging paging = new Paging(listCount, currentPage, limit, "alarmlist.do");
		paging.calculate();
		
		Alarm alarm = new Alarm();
		alarm.setReceiverId(member.getMemberID());
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
			@RequestParam(name="boardId", required=false) int boardId,
			@RequestParam(name="refCommentId", required=false) String refCommentId,
			HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginMember");
		Alarm alarm = new Alarm();

		alarm.setNativeId(commentId);
		alarm.setSenderId(member.getMemberID());
		
		
		if(refCommentId != null) {							//상위댓글에 대한 대댓글이면
			alarm.setAlarmKind(alarmKind);
			alarm.setRefCommentId(refCommentId);		//상위댓글id(상위 댓글 작성자 id select 목적)
			alarmService.insertCommAlarm(alarm);
		}else if(refCommentId == null) {										//원글에 대한 댓글이면
			alarm.setAlarmKind(alarmKind.substring(5) + "_BOARD");		// (RECR || FREE)_BOARD
			alarm.setBoardId(boardId);											//원글 번호(작성자 id select 목적)
			alarmService.insertCommRefAlarm(alarm);
		}

  }

	//(신청) 알람 생성 : 신청시 테이블명, 신청정보 요청과 함께 보내줄 것
	@RequestMapping("applAlarm.do")
	public void applAlarmInsert(
			@RequestParam("alarmKind") String alarmKind,
			RecrAppl recrAppl,
			HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginMember");
		Alarm alarm = new Alarm();
		alarm.setAlarmKind(alarmKind);
		alarm.setNativeId(String.valueOf(recrAppl.getBoardId()));
		alarm.setSenderId(member.getMemberID());
		
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
