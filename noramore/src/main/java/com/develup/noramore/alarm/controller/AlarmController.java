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
		alarm.setPaging(paging);
		
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
	
	
	//(댓글) 알람 생성
	@RequestMapping("commAlarm.do")
	public void commAlarmInsert(
			@RequestParam("alarmKind") String alarmKind,
			@RequestParam("commentId") String NativeId,
			HttpServletRequest request) {
		
		Alarm alarm = new Alarm();
		alarm.setAlarmKind(alarmKind);
		alarm.setNativeId(NativeId);
		alarm.setSenderId((String)request.getSession().getAttribute("memberID"));
		
		alarmService.insertAlarm(alarm);
		
//		//댓글 내용이 10글자 넘어가면 10글자 ... 
//		if(context != null && context.length() > 10) {
//			alarm.setContext(context.substring(0, 10) + "... ");
//		}else if(context != null && context.length() <= 10){
//			alarm.setContext(context);
//		}
//		
//		switch(alarmKind) {
//		case "commentRecrboard" : 
//			RecrBoard recrBoard = alarmService.selectBoardInfo(alarm);
//			alarm.setReceiverId(recrBoard.getMemberId());
//			alarm.setTitle(recrBoard.getTitle());
//			alarmService.insertAlarm(alarm);
//			break;
//		case "commentFreeboard" : 
//			FreeBoard freeBoard = alarmService.selectBoardInfo(alarm);
//			alarm.setReceiverId(freeBoard.getMemberId());
//			alarm.setTitle(freeBoard.getTitle());
//			alarmService.insertAlarm(alarm);
//			break;
//		case "recrAppl" : 
//			RecrAppl recrAppl = alarmService.selectRecrAppl();
//			alarm.setReceiverId(recrAppl.getMemberId());
//			alarm.setTitle(recrAppl.getTitle());
//			alarmService.insertAlarm(alarm);
//			break;
//		default:
//			return "common/error";
//		}
  }

	//(댓글) 알람 생성
	@RequestMapping("applAlarm.do")
	public void applAlarmInsert(
			@RequestParam("alarmKind") String alarmKind,
			RecrAppl recrAppl,
			HttpServletRequest request) {
		
		Alarm alarm = new Alarm();
		alarm.setAlarmKind(alarmKind);
		alarm.setNativeId(String.valueOf(recrAppl.getBoardId()));
		// ID로 RECR_BOARD join 조회해서 member_id 를 receiver_id로 입력
		alarm.setSenderId((String)request.getSession().getAttribute("memberID"));
		//alarm.setReceiverId(selectBoardInfo(alarm.getNativeId()).getMemberID);
		
		alarmService.insertAlarm(alarm);
	}
	
	//알람 확인 (y/n 수정)
	
	public String alarmRecieve() {
		
		return "";
	}
	
	
	
	
	
	
}
