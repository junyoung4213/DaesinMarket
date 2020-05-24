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
}
