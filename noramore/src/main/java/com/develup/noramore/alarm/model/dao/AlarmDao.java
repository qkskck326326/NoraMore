package com.develup.noramore.alarm.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.alarm.model.vo.Alarm;

@Repository("alarmDao")
public class AlarmDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Alarm> selectAlarmList(Alarm alarm) {
		return (ArrayList)sqlSessionTemplate.selectList("selectAlarmList", alarm);
	}

	public int insertAlarm(Alarm alarm) {
		return sqlSessionTemplate.insert("insertAlarm", alarm);
	}

	public int updateAlarm(Alarm alarm) {
		return sqlSessionTemplate.update("updateAlarm", alarm);
	}
}
