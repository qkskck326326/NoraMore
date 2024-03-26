package com.develup.noramore.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.develup.noramore.alarm.model.service.AlarmService;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmService;
	
	
	//알람페이지로 이동
	public String alarmPage() {
		
		return "";
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
