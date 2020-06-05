package com.daesin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.daesin.beans.PaymentBean;
import com.daesin.dao.PaymentDao;

@Service
public class PaymentService {

	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	@Lazy
	private PaymentBean paymentBean;
	
	
	public void addPaymentInfo(PaymentBean paymentBean) {
		paymentDao.addPaymentInfo(paymentBean);
	}
}
