package com.daesin.service;

import org.springframework.scheduling.annotation.Async;

public interface MailService {
	
	@Async
	public void send(String subject, String text, String from, String to, String filePath);

}
