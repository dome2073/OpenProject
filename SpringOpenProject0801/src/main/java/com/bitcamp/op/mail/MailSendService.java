package com.bitcamp.op.mail;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailSendService {

	@Autowired
	private JavaMailSender mailSender;
	
	public static final String NEW = "new";
	
	private String fromEmail = "wlgns2073@gmail.com";
	private String fromPerson = "관리자";
	// 메일로 파일보내기
	public void MailSender(String toEmail, String type) {
		// 1. MimeMessage 사용
		MimeMessage message = mailSender.createMimeMessage();

		try {
			// 2.MimeMessageHelper사용
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

			
			if(type.equals("new")) {
				
				// 제목 설정
				// 인코딩정보를 설정하지 않아도됨. 위에서 생성할 때 했으므로.
				messageHelper.setSubject("[공지] 안녕하세요 회원님. ");
				
				// 내용구성(HTML)
				String html = "<h1> 안녕하세요 회원님</h1> 회원가입을 진심으로 감사드립니다<br>" + "재 방문을 원하실 경우 아래 링크를 클릭해주세요 <br><br>"
						+ "<a href=\'http://localhost/op\'>사이트 가기</a>";
				// 내용을 담는다.
				messageHelper.setText(html, true);
			}

			// 보내는 사람의 메일 주소를 설정
			messageHelper.setFrom(fromEmail,fromPerson);

			// 받는 사람의 메일 주소를 설정
			messageHelper.setTo(new InternetAddress(toEmail , "회원님", "utf-8"));
			
			// 보내기
			mailSender.send(message);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
