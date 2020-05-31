package com.alhl.hz.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.openqa.selenium.WebDriver;

public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession ss = event.getSession();
		ss.setMaxInactiveInterval(300);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession ss = event.getSession();
		System.out.println("세션 제거됨");
		try {
		WebDriver wDriver = (WebDriver) ss.getAttribute("webdriver");
		
		wDriver.close();
		wDriver.quit();
		System.out.println("세션 웹드라이버 종료됨");
		}catch(NullPointerException e) {
			System.out.println("크롬드라이버가 존재하지 않음");
		}

	}
}
