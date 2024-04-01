package com.develup.noramore.alarm.model.service;

import java.util.ArrayList;

import com.develup.noramore.alarm.model.vo.Alarm;
import com.develup.noramore.common.Paging;

public interface AlarmService {
	ArrayList<Alarm> selectAlarmList(Alarm alarm);

	int updateAlarm(Alarm alarm);
	int selectListCount(String memberId);
	ArrayList<Alarm> selectList(Alarm alarm);
	int insertCommAlarm(Alarm alarm);
	int insertApplAlarm(Alarm alarm);
}
