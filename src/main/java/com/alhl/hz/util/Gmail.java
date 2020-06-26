package com.alhl.hz.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.*;

public class Gmail extends Authenticator{
	
	
	//   ※전송자의 네이버/구글 계정에 보안낮음 설정해야함
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("alhlcert@gmail.com","1234zz!!");
	}
	
	// 일반
	public static int mailSend(String user_Id,String user_Email) {
		String host = "http://192.168.56.1:8181/hz/"; // 호스트
	   	String from = "alhlcert@gmail.com"; //전송자의 구글 이메일 계정
	   	String to = user_Email;
	   	String subject = "올룩꿀룩를 위한 이메일 인증 메일입니다.";
	   	//메일서버에서 링크 제한을 두어 주소를  a태그 없이 그냥 출력하였음
	   	String content = "다음 버튼을 클릭해서 이메일 인증을 진행하세요."
	   			+ "<form action='"+host+"emailCheck.ing'>"
	   			+ "<input type='hidden' name='userId' value='"+user_Id+"'></input>"
	   			+ "<input type='hidden' name='code' value='"+SHA256.getSHA256(to)+"'></input>"
	   			+ "  >>>>>><input type='submit' value='인증하기'><<<<<<</input>"
	   			+ "</form>";
	   	Properties p = new Properties();
	   
	   	p.put("mail.smtp.user",from);
	   	p.put("mail.smtp.host","smtp.gmail.com");
	   	p.put("mail.smtp.port","587");
	   	p.put("mail.smtp.starttls.enable","true");
	   	p.put("mail.smtp.auth","true");
	   	p.put("mail.smtp.debug","true");
	   	p.put("mail.smtp.socketFactory.port","587");
	   	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	   	p.put("mail.smtp.socketFactory.fallback","false");
		
	   	try{
	   		Authenticator auth = new Gmail();
	   		Session ses =Session.getInstance(p,auth);
	   		ses.setDebug(true);
	   		MimeMessage msg = new MimeMessage(ses);
	   		msg.setSubject(subject);
	   		Address fromAddr = new InternetAddress(from);
	   		msg.setFrom(fromAddr);
	   		Address toAddr = new InternetAddress(to);
	   		msg.addRecipient(Message.RecipientType.TO, toAddr);
	   		msg.setContent(content,"text/html;charset=UTF8"); //이메일 내용
	   		Transport.send(msg); //실제로 전송
	   		return 1;
	   	}catch(Exception e){
	  		e.printStackTrace();
	   		return 0;
	   	}
	}
}