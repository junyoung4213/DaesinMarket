package com.daesin.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.daesin.beans.MemberBean;
import com.daesin.beans.QuestionBean;
import com.daesin.service.MemberService;
import com.daesin.service.SupporterService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private SupporterService supporterService;

	@ModelAttribute("random")
	public int getRandomNumber() {
		int ran = new Random().nextInt(900000) + 100000;
		return ran;
	}

	@GetMapping("/join")
	public ModelAndView join(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean) {

		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("member/join");
		mv.addObject("random", ran);
		return mv;
	}

	@PostMapping("/join_pro")
	public String join_pro(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean) {

		joinMemberBean.setmId(joinMemberBean.getmId2());
		joinMemberBean.setmPw(joinMemberBean.getmPw2());
		
		memberService.addMemberInfo(joinMemberBean);

		return "member/join_success";
	}

	@GetMapping("/modify")
	public String modify(@SessionAttribute("member") MemberBean modifyMemberBean, Model model) {

		model.addAttribute("modifyMemberBean", modifyMemberBean);

		return "member/modify";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@ModelAttribute("modifyMemberBean") MemberBean modifyMemberBean) {
		System.out.println(modifyMemberBean.toString());
		memberService.modifyMemberInfo(modifyMemberBean);

		return "member/modify_success";

	}

	@GetMapping("/mypage")
	public String mypage() {
		return "member/mypage";
	}

	@GetMapping("/point")
	public String point() {
		return "member/point";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "member/logout";
	}

	@GetMapping("/not_login")
	public String not_login() {
		return "member/not_login";
	}

	@GetMapping("/support")
	public String support(@ModelAttribute("tempSupporterBean") MemberBean tempSupporterBean) {

		return "member/support";
	}

	@PostMapping("/support_pro")
	public String support_pro(@ModelAttribute("tempSupporterBean") MemberBean tempSupporterBean) {

		supporterService.addSupporterInfo(tempSupporterBean);

		return "member/support_success";
	}

	@GetMapping("/faq")
	public String faq(@ModelAttribute("questionBean") QuestionBean questionBean) {
		return "member/faq";
	}

	@GetMapping("/findId")
	public String findId(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean,@ModelAttribute("tempMemberBean") MemberBean tempMemberBean) {
		return "member/find_id";
	}

	@GetMapping("/findPw")
	public String findPw(@ModelAttribute("tempMemberBean") MemberBean tempMemberBean) {
		return "member/find_pw";
	}

	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean,@ModelAttribute("joinMemberBean") MemberBean joinMemberBean, Model model) {
		
		int ran = new Random().nextInt(900000) + 100000;
		model.addAttribute("random",ran);
		
		return "member/login";
	}

	@PostMapping("/login_pro")
	public String login_pro(@ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean, Model model) {

		MemberBean memberVO = memberService.getLoginMemberInfo(tempLoginMemberBean);
		if (memberVO == null) {
			return "member/login_fail";
		}
		model.addAttribute("member",memberVO);
		return "member/login_success";
	}

	/*
	 * 추후에 수정할것. 유효성 검사.
	 * 
	 * @InitBinder public void initBinder(WebDataBinder binder) { UserValidator
	 * validator1 = new UserValidator(); binder.addValidators(validator1); }
	 */
}
