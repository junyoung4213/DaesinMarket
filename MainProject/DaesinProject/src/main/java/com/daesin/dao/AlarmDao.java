package com.daesin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.AlarmBean;

@Repository
public class AlarmDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public void addAlarm(AlarmBean alarmBean) {
		sqlSessionTemplate.insert("alarm.addAlarm",alarmBean);
	}
	
	public List<AlarmBean> searchAlarm(String receiver){
		return sqlSessionTemplate.selectList("alarm.searchAlarm", receiver);
	}
	
	public void deleteAlarm(String aMsg) {
		sqlSessionTemplate.delete("alarm.deleteAlarm",aMsg);
	}
	
	public void deleteAlarmAll(String receiver) {
		sqlSessionTemplate.delete("alarm.deleteAlarmAll",receiver);
	}
}
