package com.alhl.hz.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.SortedSet;
import java.util.function.Function;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;

import com.alhl.hz.dto.SearchDTO;

public class JsoupParser {
	
	//Jsoup로 파싱하는 메서드
	public static Elements parsing_Jsoup(String url, String selector) {
		
		Document doc = null;
		try {
			doc = Jsoup.connect(url).maxBodySize(0).userAgent("Mozilla").get();
			//System.out.println(doc);
			
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}
		
		Elements titles = doc.select(selector);//선택자를 통해 문서객체에서 태그들을 가져옵니다.
		return titles;
	}
	
	//Selenium으로 파싱하는 메서드
	public static List<WebElement> parsing_Selenium(String url, String selector) {
		System.setProperty("webdriver.chrome.driver", "D:\\chromedriver_2\\chromedriver.exe");
		//Driver SetUp
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		options.addArguments("headless");
		options.addArguments("disable-gpu");
		options.addArguments("disable-infobars");
		options.addArguments("--disable-extensions");
		WebDriver driver = new ChromeDriver(options);
		driver.get(url);
		// Find the element
		List<WebElement> element = driver.findElements(By.className(selector));
		while(element.size()<10) {
			element = driver.findElements(By.className(selector));
		}
		//driver.close();
		return element;
	}
	
	
	//중고나라 파싱 메서드 - 셀레니움 웹드라이버 사용
	public static List<SearchDTO> parsing_JGN(String word){
		List<SearchDTO> dtos = new ArrayList<SearchDTO>();
		//중고나라
				String url = "https://m.joongna.com/search-list?searchword="+word; // URL
				String selector = "//div[@class='pd_h15']";								// 선택자
				
				//웹드라이버 로드부분************************************************************
				System.setProperty("webdriver.chrome.driver", "C:\\chromedriver_2\\chromedriver.exe");
				//Driver SetUp
				ChromeOptions options = new ChromeOptions(); // 크롬드라이버 옵션들 
				options.setCapability("ignoreProtectedModeSettings", true);
				options.addArguments("headless");
				options.addArguments("disable-gpu");
				options.addArguments("disable-infobars");
				options.addArguments("--disable-extensions");
				WebDriver driver = new ChromeDriver(options);
				driver.get(url);
				// Find the element
				List<WebElement> jElements = driver.findElements(By.xpath(selector));
				while(jElements.size()<10) {
					jElements = driver.findElements(By.xpath(selector));
				}
				
				//*********************************************************************************
				
				System.out.println("중고나라 검색된 갯수:"+jElements.size());
				int cnt=0;
				try {
				for(WebElement element: jElements) {
					SearchDTO dto = new SearchDTO();
					WebElement mElement = element.findElement(By.tagName("img")); // 이미지 태그
					dto.setSrchImageURL(mElement.getAttribute("src")); // 이미지 url 입력
					WebElement tElement = element.findElement(By.tagName("span")); // 제목 태그
					dto.setSrchTitle(tElement.getText()); //제목 입력
					dto.setSrchSiteName("중고나라");
					WebElement uElement = element.findElement(By.tagName("a")); // a태그 가져옴
					String url_a = uElement.getAttribute("href");// url
					dto.setSrchURL(url_a); // url 입력
					WebElement pElement = element.findElement(By.tagName("p")); // 가격태그
					String strtemp = pElement.getText(); 
					strtemp = strtemp.replace(",", "");
					strtemp = strtemp.replace("원", "");
					strtemp = strtemp.replace("-", "");
					strtemp = strtemp.replace("무료나눔", "");
					try {
						dto.setSrchPrice(Integer.parseInt(strtemp)); // 가격 입력
					}catch (Exception e){
						dto.setSrchPrice(0); // 형식에 안맞으면 그냥 0으로 입력
					}
					
					dtos.add(dto); // 리스트에 추가
				}
				}catch(Exception e) {
					
				}finally {
					driver.close();// 다쓰고난 드라이버는 종료합니다.
					driver.quit();// 모든 드라이버를 닫습니다.
				}
		
		return dtos;
	}
	
	
	
	//각종 사이트들을 자동으로 파싱하는 메서드입니다.
	public static List<SearchDTO> autoParsing(String word){
		//각종 사이트들의 검색 결과를 담을 그릇 준비
		List<SearchDTO> dtos = new ArrayList<SearchDTO>();
		System.out.println("크롤링 시작");
		String url;
		String selector;
		//*********************************중고나라 검색*************************************
		//중고나라
		List<SearchDTO> dtos_JGN = parsing_JGN(word); // 셀레니움 검색 
		dtos.addAll(dtos_JGN); // 검색된 리스트 추가
		//*********************************중고나라 끝*************************************
		
		//*********************************번개장터 검색*************************************
		//번개장터
		
		url="https://m.bunjang.co.kr/search/products?q="+word;
		selector="div#root";
		Elements bTitles = parsing_Jsoup(url,selector);					// 위 두가지를 가지고 크롤링
		System.out.println("번개장터 검색된갯수:"+bTitles.size());
		
		
		//*********************************번개장터 끝*************************************
		//*********************************당근마켓 검색*************************************
		//당근마켓
		url="https://www.daangn.com/search/"+word;			// URL
		selector = "article.flea-market-article.flat-card";	// 선택자
		Elements titles = parsing_Jsoup(url,selector);					// 위 두가지를 가지고 크롤링
		
		System.out.println("당근마켓 검색된갯수:"+titles.size());
		int count=titles.size();
		for(Element element: titles) {
			SearchDTO dto = new SearchDTO();
			Elements els = new Elements();
			if(element.children().get(0).tagName()== "a") { //첫번쨰 자식태그에 a태그가 아닌 hr태그가 있는 경우가 섞여서 존재해서 예외처리
				els= element.children().get(0).children().get(1).children(); //첫번쨰 자식 가져오기
				dto.setSrchURL("https://www.daangn.com"+element.children().get(0).attr("href"));//링크 입력
				dto.setSrchImageURL(element.children().get(0).children().get(0).children().get(0).attr("src")); //이미지 소스 입력
			}else {
				els= element.children().get(1).children().get(1).children(); //두번쨰 자식 가져오기
				dto.setSrchURL("https://www.daangn.com"+element.children().get(1).attr("href"));//링크 입력
				dto.setSrchImageURL(element.children().get(1).children().get(0).children().get(0).attr("src"));//이미지 소스 입력
			}
			
			
			dto.setSrchTitle(els.get(0).child(0).text()); // 제목 입력
			dto.setSrchSiteName("당근마켓"); //검색 사이트명 입력
			//가격 int형으로 변환/예외처리
			String strtemp = els.get(2).text();
			strtemp = strtemp.replace(",", "");
			strtemp = strtemp.replace("원", "");
			strtemp = strtemp.replace("-", "");
			strtemp = strtemp.replace("무료나눔", "");
			try {
				dto.setSrchPrice(Integer.parseInt(strtemp)); // 가격 입력
			}catch (Exception e){
				//e.printStackTrace(); 
				dto.setSrchPrice(0); // 형식에 안맞으면 그냥 0으로 입력
			}
			dtos.add(dto); //찾은 레코드들을 차곡차곡 담습니다.
		}
		//**********************************당근마켓 검색 끝***********************************
		
		Collections.sort(dtos); //마지막으로 모든 결과값들을 가격순으로 정렬합니다.
		for(int i=0;i<dtos.size();i++) { // 가격순으로 인덱스 달아줌
			dtos.get(i).setSrchIndex(i+1);
		}
		
		System.out.println("크롤링 끝");
		return dtos;
	}
	
	
	
}
