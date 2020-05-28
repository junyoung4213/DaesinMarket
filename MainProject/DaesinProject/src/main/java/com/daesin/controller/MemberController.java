package com.daesin.controller;

import java.util.Random;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daesin.beans.MemberBean;
import com.daesin.service.MemberService;
import com.daesin.validator.UserValidator;

@Controller
@RequestMapping("/member")
public class MemberController extends HomeController {

	@Autowired
	private MemberService memberService;

	@Resource(name = "loginMemberBean")
	@Lazy
	private MemberBean loginMemberBean;
	
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
	public String join_pro(@Valid @ModelAttribute("joinMemberBean") MemberBean joinMemberBean, BindingResult result) {
		if (result.hasErrors()) {
			return "member/join";
		}
		memberService.addMemberInfo(joinMemberBean);

		return "member/join_success";
	}

	@GetMapping("/modify")
	public String modifyMemberBean() {
		return "member/modify";
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
	public String logout() {

		loginMemberBean.setMemberLogin(false);

		return "member/logout";
	}

	@GetMapping("/not_login")
	public String not_login() {
		return "member/not_login";
	}

	@GetMapping("/support")
	public String support() {
		return "member/support";
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
	public String findPw(@ModelAttribute("joinMemberBean") MemberBean joinMemberBean) {
		return "member/find_pw";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator validator1 = new UserValidator();
		binder.addValidators(validator1);

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

}
