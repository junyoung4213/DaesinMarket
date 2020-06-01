package com.daesin.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daesin.beans.MemberBean;
import com.daesin.beans.QuestionBean;
import com.daesin.service.MailService;
import com.daesin.service.MemberService;

@Controller
@RequestMapping(value = "/email")
@EnableAsync
public class EmailController {

	@Autowired
	private MailService mailService;

	@Autowired
	private MemberService memberService;

	// 이메일 인증
	@RequestMapping(value = "/createEmailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public void createEmailCheck(@RequestParam String userEmail, HttpServletRequest req) {
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		String subject = "인증코드";
		StringBuilder sb = new StringBuilder();
		sb.append("인증코드는 [" + authCode + "] 입니다.");
		sendEmail(subject, sb.toString(), userEmail);
	}

	@RequestMapping(value = "/emailAuth.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, HttpSession session) {
		String originalJoinCode = (String) session.getAttribute("authCode");
		if (originalJoinCode.equals(authCode))
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		else
			return new ResponseEntity<String>("false", HttpStatus.OK);
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findPassword.do", method = RequestMethod.POST)
	public ResponseEntity<String> findPassword(@ModelAttribute("tempMemberBean") MemberBean tempMemberBean) {
		MemberBean MemberVO = memberService.checkCorrectMember(tempMemberBean);

		if (MemberVO != null) {
			String password = MemberVO.getM_pw();
			String userEmail = MemberVO.getM_email();
			System.out.println(password);
			String subject = "비밀번호";
			StringBuilder sb = new StringBuilder();
			sb.append("비밀번호는 " + password + " 입니다.");
			sendEmail(subject, sb.toString(), userEmail);
			return new ResponseEntity<String>("complete", HttpStatus.OK);

		} else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}

	// 문의메일 보내기
	@RequestMapping(value = "/question.do", method = RequestMethod.POST)
	public String question(@ModelAttribute("questionBean") QuestionBean questionBean) {

		if (questionBean != null) {
			String title = questionBean.getTitle();
			String content = questionBean.getContent();
			String m_email = questionBean.getM_email();
			String m_id = questionBean.getM_id();
			int m_no = questionBean.getM_no();
			StringBuilder sb = new StringBuilder();
			sb.append("<h1>제목: " + title + "</h1>" + "<p>내용: " + content + "</p><br>" + "이메일주소: " + m_email + "<br>"
					+ "고객번호: " + m_no);
			sendEmail(m_id + " 고객님의", sb.toString(), "junyoung4213@gmail.com");
			return "member/faq_success";
		} else {
			return "member/faq_fail";
		}
	}

	public void sendEmail(String subject, String message, String userEmail) {
		mailService.send(subject + " 전송 메일입니다.", message, "junyoung4213@gmail.com", userEmail, null);
	}

}