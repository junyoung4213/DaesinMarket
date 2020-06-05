package com.daesin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.PaymentBean;

@Repository
public class PaymentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addPaymentInfo(PaymentBean paymentBean) {
		sqlSessionTemplate.insert("payment.addPaymentInfo",paymentBean);
	}
	
	public void updatePointInfo(PaymentBean paymentBean) {
		sqlSessionTemplate.update("payment.updatePointInfo",paymentBean);
	}

}
