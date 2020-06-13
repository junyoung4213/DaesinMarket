package com.daesin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.daesin.service.MemberService;

@RestController
public class RestApiController {

	@Autowired
	private MemberService memberService;

	@GetMapping(value = "/member/checkMemberIdExist/{m_id}")
	public String checkMemberIdExist(@PathVariable String m_id) {
		boolean chk = memberService.checkMemberIdExist(m_id);

		return chk + "";
	}

	@GetMapping(value = "/member/returnId/{m_email}")
	public String returnId(@PathVariable String m_email) {
		// 이메일 주소를 서버에서 받을 때, '.com'을 잘라내는 현상을 발견.
		// 뒷 부분에 '.com'을 붙여줘야 제대로 해당 이메일로 가입한 아이디를 찾을 수 있다.
		m_email += ".com";
		String member_id = memberService.returnId(m_email);
		return member_id + "";
	}
	
	@GetMapping(value = "/member/returnPoint/{m_id}")
	public String returnPoint(@PathVariable String m_id) {
		// 이메일 주소를 서버에서 받을 때, '.com'을 잘라내는 현상을 발견.
		// 뒷 부분에 '.com'을 붙여줘야 제대로 해당 이메일로 가입한 아이디를 찾을 수 있다.
	 
		return memberService.returnPoint(m_id) + "";
	}
}
