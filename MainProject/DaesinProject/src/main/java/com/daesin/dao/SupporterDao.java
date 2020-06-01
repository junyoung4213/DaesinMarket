package com.daesin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.SupporterBean;

@Repository
public class SupporterDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void addSupporterInfo(SupporterBean tempSupporterBean) {
		sqlSessionTemplate.insert("supporter.addSupporterInfo",tempSupporterBean);
	}
}
