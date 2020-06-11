package com.daesin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.daesin.beans.AlarmBean;
import com.daesin.dao.AlarmDao;

@Service
public class AlarmService {

	@Autowired
	private AlarmDao alarmDao;
	
	@Autowired
	@Lazy
	private AlarmBean alarmBean;
	
	public void addAlarm(AlarmBean alarmBean) {
		alarmDao.addAlarm(alarmBean);
	}
	
	public List<AlarmBean> searchAlarm(String receiver){
		return alarmDao.searchAlarm(receiver);
	}
	
}
