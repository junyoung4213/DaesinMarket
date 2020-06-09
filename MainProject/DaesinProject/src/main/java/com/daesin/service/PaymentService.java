package com.daesin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.daesin.beans.PaymentBean;
import com.daesin.dao.PaymentDao;

@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
@Service
public class PaymentService {

	@Autowired
	private PaymentDao paymentDao;

	@Autowired
	@Lazy
	private PaymentBean paymentBean;

	public void updatePointInfo(PaymentBean paymentBean) {
		paymentDao.addPaymentInfo(paymentBean);
		paymentDao.updatePointInfo(paymentBean);
	}
}
