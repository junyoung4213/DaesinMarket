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

	@GetMapping("/member/checkMemberIdExist/{mId}")
	public String checkMemberIdExist(@PathVariable String mId) {
		boolean chk = memberService.checkMemberIdExist(mId);

		return chk + "";
	}
	
	@GetMapping("/member/returnId/{mEmail}")
	public String returnId(@PathVariable String mEmail) {
		// 이메일 주소를 서버에서 받을 때, '.com'을 잘라내는 현상을 발견.
		// 뒷 부분에 '.com'을 붙여줘야 제대로 해당 이메일로 가입한 아이디를 찾을 수 있다.
		mEmail+=".com";
		String member_id = memberService.returnId(mEmail);
		return member_id + "";
	}
}
