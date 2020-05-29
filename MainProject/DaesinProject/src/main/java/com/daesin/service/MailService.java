package com.daesin.service;

public interface MailService {
	public void send(String subject, String text, String from, String to, String filePath);

}
