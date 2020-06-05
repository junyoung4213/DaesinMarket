package com.daesin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.daesin.beans.PaymentBean;
import com.daesin.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;

	@RequestMapping("/success")
	public String success(@RequestParam("amount") int amount,@RequestParam("mNo") int mNo, @ModelAttribute("paymentBean") PaymentBean paymentBean) {
		paymentBean.setPAmount(amount);
		paymentBean.setPMno(mNo);
		paymentService.addPaymentInfo(paymentBean);
		return "payment/success";
	}
}
