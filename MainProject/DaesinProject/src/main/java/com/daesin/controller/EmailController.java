package com.daesin.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daesin.service.MailService;

@Controller
@RequestMapping(value = "/email")
@EnableAsync
public class EmailController {

	@Autowired
	private MailService mailService;

//	@Resource(name="mailSender")
//	private JavaMailSender mailSender;
//	
//	@RequestMapping(value = "/email")
//	public String emailPage() {
//		
//		return "email";
//	}
//	
//	@RequestMapping(value="/searchPw.do", method=RequestMethod.GET)
//    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv) throws Exception {
// 
//        String USERNAME = (String) paramMap.get("username");
//        String EMAIL = (String) paramMap.get("email");
//        String PASSWORD = "1111111111";
//             
//        try {
//            MimeMessage msg = mailSender.createMimeMessage();
//            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
//             
//            messageHelper.setSubject(USERNAME+"님 비밀번호 찾기 메일입니다.");
//            messageHelper.setText("비밀번호는 "+PASSWORD+" 입니다.");
//            messageHelper.setTo(EMAIL);
//            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(EMAIL));
//            mailSender.send(msg);
//             
//        }catch(MessagingException e) {
//            System.out.println("MessagingException");
//            e.printStackTrace();
//        }
////        mv.setViewName("redirect:/emailSuccess");
//        mv.setViewName("emailSuccess");
//        return mv;
//    }

	@RequestMapping(value = "/createEmailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	@Async
	public boolean createEmailCheck(@RequestParam String userEmail, @RequestParam int random, HttpServletRequest req) {
		// 이메일 인증
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
		return mailService.send(subject, sb.toString(), "junyoung4213@gmail.com", userEmail, null);
	}

	@RequestMapping(value = "/emailAuth.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random,
			HttpSession session) {
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		if (originalJoinCode.equals(authCode) && originalRandom.equals(random))
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		else
			return new ResponseEntity<String>("false", HttpStatus.OK);
	}

}