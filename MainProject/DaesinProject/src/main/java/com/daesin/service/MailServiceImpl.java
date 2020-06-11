package com.daesin.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
// org.springframework.mail.javamail.JavaMailSender
	@Autowired
	@Lazy
	private JavaMailSender mailService;

	public void setJavaMailSender(JavaMailSender mailService) {
		this.mailService = mailService;
	}

	@Override
	public void send(String subject, String text, String from, String to, String filePath) {
// javax.mail.internet.MimeMessage
		MimeMessage message = mailService.createMimeMessage();
		try {
// org.springframework.mail.javamail.MimeMessageHelper
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);
// 첨부 파일 처리
			if (filePath != null) {
				File file = new File(filePath);
				if (file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
// 첨부 파일 처리 다른방법(이건 확인함)
// FileSystemResource file = new FileSystemResource(new File("D:/load.gif"));
// helper.addAttachment("load.gif", file);
// 메일에 이미지 심어서 보내는 방법(한글파일은 안됨)
// String contents = text + "<br><br><img src=\"cid:emailPic.png \">";
// helper.setText(contents, true);
// FileSystemResource file = new FileSystemResource(new File("D:/emailPic.png"));
// helper.addInline("emailPic.png", file);
			mailService.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
