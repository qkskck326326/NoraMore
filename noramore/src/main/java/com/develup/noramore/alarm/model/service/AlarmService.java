package com.develup.noramore.alarm.model.service;

import java.util.ArrayList;

import com.develup.noramore.alarm.model.vo.Alarm;

public interface AlarmService {
	ArrayList<Alarm> selectAlarmList(Alarm alarm);
	int insertAlarm(Alarm alarm);
	int updateAlarm(Alarm alarm);
}
