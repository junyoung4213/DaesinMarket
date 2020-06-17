package com.daesin.beans;

public class SmsBean {

	private String type;
	private String contentType;
	private String from;
	private String subject;
	private String countryCode;
	private String content;
	private MessageBean messages;
	
	

	public SmsBean(String type, String contentType, String from, String subject, String countryCode, String content,
			MessageBean messages) {
		super();
		this.type = type;
		this.contentType = contentType;
		this.from = from;
		this.subject = subject;
		this.countryCode = countryCode;
		this.content = content;
		this.messages = messages;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MessageBean getMessages() {
		return messages;
	}

	public void setMessages(MessageBean messages) {
		this.messages = messages;
	}

	@Override
	public String toString() {
		return "SmsBean [type=" + type + ", contentType=" + contentType + ", from=" + from + ", subject=" + subject
				+ ", countryCode=" + countryCode + ", content=" + content + ", messages=" + messages + "]";
	}

}
