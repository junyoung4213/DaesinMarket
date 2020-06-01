package com.daesin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesin.beans.SupporterBean;
import com.daesin.dao.SupporterDao;

@Service
public class SupporterService {

	@Autowired
	private SupporterDao supporterDao;

	public void addSupporterInfo(SupporterBean tempSupporterBean) {
		supporterDao.addSupporterInfo(tempSupporterBean);
	}

}
