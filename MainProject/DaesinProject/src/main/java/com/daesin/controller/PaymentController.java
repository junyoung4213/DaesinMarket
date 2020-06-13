package com.daesin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daesin.beans.MemberBean;
import com.daesin.beans.PaymentBean;
import com.daesin.service.MemberService;
import com.daesin.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private MemberService memberService;

	@RequestMapping("/success")
	public String success(@RequestParam("amount") int amount, @RequestParam("mNo") int mNo,
			@ModelAttribute("paymentBean") PaymentBean paymentBean, HttpSession session) {
		paymentBean.setPAmount(amount);
		paymentBean.setPMno(mNo);

		try {

			paymentService.updatePointInfo(paymentBean);
			MemberBean memberVO = memberService.getLoginMemberInfo((MemberBean) session.getAttribute("member"));
			session.setAttribute("member", memberVO);
		} catch (Exception e) {
			e.printStackTrace();
			return "payment/fail";
		}
		return "payment/success";
	}
	
	@RequestMapping("/success2")
	@ResponseBody
	public String success2(@RequestParam("amount") int amount, @RequestParam("mNo") int mNo,
			@ModelAttribute("paymentBean") PaymentBean paymentBean, HttpSession session) {
		paymentBean.setPAmount(amount);
		paymentBean.setPMno(mNo);

		try {

			paymentService.updatePointInfo(paymentBean);
			MemberBean memberVO = memberService.getLoginMemberInfo((MemberBean) session.getAttribute("member"));
			session.setAttribute("member", memberVO);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
}
