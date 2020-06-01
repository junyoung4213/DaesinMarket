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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.daesin.beans.MemberBean;
import com.daesin.beans.SupporterBean;
import com.daesin.service.MemberService;
import com.daesin.service.SupporterService;

@Controller
@RequestMapping("/member")
public class MemberController extends HomeController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private SupporterService supporterService;

	@ModelAttribute("random")
	public int getRandomNumber() {
		int ran = new Random().nextInt(900000) + 100000;
		return ran;
	}

	/*
	 * @GetMapping("/login") public String
	 * login(@ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean,
	 * 
	 * @RequestParam(value = "fail", defaultValue = "false") boolean fail, Model
	 * model) {
	 * 
	 * model.addAttribute("fail", fail);
	 * 
	 * return "member/login"; }
	 * 
	 * @PostMapping("/login_pro") public String
	 * login_pro(@Valid @ModelAttribute("tempLoginMemberBean") MemberBean
	 * tempLoginMemberBean, BindingResult result) { if (result.hasErrors()) { return
	 * "member/login"; }
	 * 
	 * memberService.getLoginMemberInfo(tempLoginMemberBean);
	 * 
	 * if (loginMemberBean.isMemberLogin() == true) { return "member/login_success";
	 * } else { return "member/login_fail"; }
	 * 
	 * }
	 */

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

	/*
	 * @GetMapping("/modify") public String modify(@ModelAttribute("modifyUserBean")
	 * UserBean modifyUserBean) {
	 * 
	 * userService.getModifyUserInfo(modifyUserBean);
	 * 
	 * return "user/modify"; }
	 * 
	 * @PostMapping("/modify_pro") public String
	 * modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean,
	 * BindingResult result) {
	 * 
	 * if (result.hasErrors()) { return "user/modify"; }
	 * 
	 * userService.modifyUserInfo(modifyUserBean);
	 * 
	 * return "user/modify_success";
	 * 
	 * }
	 */

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
	public String support(@ModelAttribute("tempSupporterBean") SupporterBean tempSupporterBean, HttpSession session) {

		System.out.println(session.getAttribute("member").toString());

		return "member/support";
	}

	@PostMapping("/support_pro")
	public String support_pro(@ModelAttribute("tempSupporterBean") SupporterBean tempSupporterBean) {

		System.out.println(tempSupporterBean.toString());

		supporterService.addSupporterInfo(tempSupporterBean);

		return "member/support_success";
	}

	@GetMapping("/faq")
	public String faq() {
		return "member/faq";
	}

	@GetMapping("/about")
	public String about() {
		return "member/about";
	}

	@GetMapping("/findId")
	public String findId(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean) {
		return "member/find_id";
	}

	@GetMapping("/findPw")
	public String findPw(@ModelAttribute("tempMemberBean") MemberBean tempMemberBean) {
		return "member/find_pw";
	}

	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean) {
		return "member/login";
	}

	@PostMapping("/login_pro")
	public String login_pro(@ModelAttribute("tempLoginMemberBean") MemberBean tempLoginMemberBean, Model model) {

		MemberBean memberVO = memberService.getLoginMemberInfo(tempLoginMemberBean);

		if (memberVO == null) {
			return "member/login_fail";
		}

		model.addAttribute("member", memberVO);

		return "member/login_success";
	}

	/* 추후에 수정할것. 유효성 검사.
	 * @InitBinder public void initBinder(WebDataBinder binder) { UserValidator
	 * validator1 = new UserValidator(); binder.addValidators(validator1); }
	 */
}
