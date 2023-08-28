package com.pcwk.ehr.service;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

/**
 * 개발 환경에서 메일이 전송되지 않도록 설정
 * @author user
 *
 */
public class DummyMailSender implements MailSender {

	@Override
	public void send(SimpleMailMessage simpleMessage) throws MailException {

	}

	@Override
	public void send(SimpleMailMessage... simpleMessages) throws MailException {

	}

}
