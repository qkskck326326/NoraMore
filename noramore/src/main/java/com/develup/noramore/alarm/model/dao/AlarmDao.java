package com.develup.noramore.alarm.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.alarm.model.vo.Alarm;
import com.develup.noramore.common.Paging;

@Repository("alarmDao")
public class AlarmDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Alarm> selectAlarmList(Alarm alarm) {
		List list = sqlSessionTemplate.selectList("selectAlarmList", alarm);
		return (ArrayList<Alarm>)list;
	}

	public int insertAlarm(Alarm alarm) {
		return sqlSessionTemplate.insert("insertAlarm", alarm);
	}

	public int updateAlarm(Alarm alarm) {
		return sqlSessionTemplate.update("updateAlarm", alarm);
	}

	public int selectListCount(String memberId) {
		return sqlSessionTemplate.selectOne("alarm.selectListCount", memberId);
	}

	public ArrayList<Alarm> selectList(Paging paging) {
		List list = sqlSessionTemplate.selectList("alarm.selectList", paging);
		return (ArrayList)list;
	}
}
