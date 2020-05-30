package com.alhl.hz.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.function.Function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.core.io.ClassPathResource;

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
	
	//웹드라이버 (크롬)를 생성하여 세션에 부여하는 메서드
	public static void webDriver_init(HttpServletRequest request){
		// 서블릿 리퀘스트로부터 실제 프로젝트 경로를 받아옴
		String path = request.getSession().getServletContext().getRealPath("");
		path = path + "resources/chromedriver/chromedriver.exe";
		System.out.println("리소스 드라이버 경로:" + path);
		System.setProperty("webdriver.chrome.driver", path); // 크롬 드라이버 생성
		// Driver 옵션추가
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		options.addArguments("headless");
		options.addArguments("disable-gpu");
		options.addArguments("disable-infobars");
		options.addArguments("--disable-extensions");
		WebDriver driver = new ChromeDriver(options);
		HttpSession session = request.getSession();
		session.setAttribute("webdriver", driver);
	}
	
	//Selenium으로 파싱하는 메서드 (웹드라이버를 세션으로 가져오는 버전
		public static List<SearchDTO> parsing_Selenium_Session(String word,HttpServletRequest request) {
			//리퀘스트(사용자요청)로부터 세션을 가져옵니다.
			HttpSession session = request.getSession();
			//지정 웹드라이버를 세션에서 가져옵니다.
			WebDriver driver = (WebDriver) session.getAttribute("webdriver");
			//같은 드라이버를 사용하여 시간을 단축합니다.
			List<SearchDTO> dtos_jgn = parsing_JGN(word,driver);//중고나라 검색하는 메서드
			List<SearchDTO> dtos_bgj = parsing_BGJ(word,driver);//번개장터 검색하는 메서드
			
			//전체 리스트
			List<SearchDTO> dtos_ALL = new ArrayList<SearchDTO>();
			dtos_ALL.addAll(dtos_jgn);
			dtos_ALL.addAll(dtos_bgj);
			driver.close();// 다쓰고난 드라이버는 종료합니다.
			driver.quit();// 모든 드라이버를 닫습니다.
			return dtos_ALL;
		}
	
	
	
	
	
	
	
	
	//Selenium으로 파싱하는 메서드
	public static List<SearchDTO> parsing_Selenium(String word,HttpServletRequest request) {
		//서블릿 리퀘스트로부터 실제 프로젝트 경로를 받아옴
		String path = request.getSession().getServletContext().getRealPath("");
		path=path+"resources/chromedriver/chromedriver.exe";
		System.out.println("리소스 드라이버 경로1:"+ path);
		System.setProperty("webdriver.chrome.driver", path);
		//Driver SetUp
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true);
		options.addArguments("headless");
		options.addArguments("disable-gpu");
		options.addArguments("disable-infobars");
		options.addArguments("--disable-extensions");
		WebDriver driver = new ChromeDriver(options);
		//같은 드라이버를 사용하여 시간을 단축합니다.
		List<SearchDTO> dtos_jgn = parsing_JGN(word,driver);//중고나라 검색하는 메서드
		List<SearchDTO> dtos_bgj = parsing_BGJ(word,driver);//번개장터 검색하는 메서드
		
		//전체 리스트
		List<SearchDTO> dtos_ALL = new ArrayList<SearchDTO>();
		dtos_ALL.addAll(dtos_jgn);
		dtos_ALL.addAll(dtos_bgj);
		driver.close();// 다쓰고난 드라이버는 종료합니다.
		driver.quit();// 모든 드라이버를 닫습니다.
		return dtos_ALL;
	}
	
	
	//중고나라 (웹드라이버 받아서 검색하는 메서드)
	public static List<SearchDTO> parsing_JGN(String word,WebDriver wDriver){
		//빈 리스트 생성
		List<SearchDTO> dtos = new ArrayList<SearchDTO>();
		String url = "https://m.joongna.com/search-list?searchword="+word; // URL
		String selector = "//div[@class='pd_h15']";								// 선택자
		
		
		// 드라이버 로드
		wDriver.get(url);
		// Find the element
		List<WebElement> jElements = wDriver.findElements(By.xpath(selector));
		while(jElements.size()<10) {
			jElements = wDriver.findElements(By.xpath(selector));
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
			if(dto.getSrchPrice() !=0) {
				dtos.add(dto); // 리스트에 추가
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	//번개장터(웹드라이버 받아서 검색하는 메서드) 
	public static List<SearchDTO> parsing_BGJ(String word,WebDriver wDriver){
		//빈 리스트 생성
		List<SearchDTO> dtos = new ArrayList<SearchDTO>();
		String url="https://m.bunjang.co.kr/search/products?q="+word;
		String selector = "//div[@class='app']/div[1]/div[5]/div[1]/div[4]/div[1]/div";								// 선택자
		//드라이버 로드
		wDriver.get(url);
		// Find the element
		List<WebElement> jElements = wDriver.findElements(By.xpath(selector));
		while(jElements.size()<10) {
			jElements = wDriver.findElements(By.xpath(selector));
		}
		
		//*********************************************************************************
		
		System.out.println("번개장터 검색된 갯수:"+jElements.size());
		int cnt=0;
		try {
		for(WebElement element: jElements) {
			SearchDTO dto = new SearchDTO();
			WebElement aElement = element.findElement(By.tagName("a")); // 앵커 태그
			String adata_pid = aElement.getAttribute("data-pid");
			dto.setSrchURL(aElement.getAttribute("href"));
			WebElement mElement = element.findElement(By.tagName("img")); // 이미지 태그
			dto.setSrchImageURL(mElement.getAttribute("src"));
			dto.setSrchSiteName("번개장터");
			
			WebElement tElement = element.findElement(By.xpath("a[@data-pid='"+adata_pid+"']/div[2]/div[1]"));
			dto.setSrchTitle(tElement.getAttribute("innerText"));
			
			WebElement pElement = element.findElement(By.xpath("a[@data-pid='"+adata_pid+"']/div[2]/div[2]/div[1]")); // 가격태그
			String strtemp = pElement.getAttribute("innerText");
			
			strtemp = strtemp.replace(",", "");
			strtemp = strtemp.replace("원", "");
			strtemp = strtemp.replace("-", "");
			strtemp = strtemp.replace("무료나눔", "");
			try {
				dto.setSrchPrice(Integer.parseInt(strtemp)); // 가격 입력
			}catch (Exception e){
				dto.setSrchPrice(0); // 형식에 안맞으면 그냥 0으로 입력
			}
			
			if(dto.getSrchPrice() !=0) {
				dtos.add(dto); // 리스트에 추가
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	
	//중고나라 파싱 메서드 - 셀레니움 웹드라이버 사용
	public static List<SearchDTO> parsing_JGN(String word,HttpServletRequest request){
		List<SearchDTO> dtos = new ArrayList<SearchDTO>();
		//중고나라
				String url = "https://m.joongna.com/search-list?searchword="+word; // URL
				String selector = "//div[@class='pd_h15']";								// 선택자
				
				//웹드라이버 로드부분************************************************************
				String path = request.getSession().getServletContext().getRealPath("");
				path=path+"resources/chromedriver/chromedriver.exe";
				System.out.println("리소스 드라이버 경로1:"+ path);
				System.setProperty("webdriver.chrome.driver", path);
				//System.setProperty("webdriver.chrome.driver", resource.getPath());
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
					if(dto.getSrchPrice() !=0) {
						dtos.add(dto); // 리스트에 추가
					}
				}
				}catch(Exception e) {
					
				}finally {
					driver.close();// 다쓰고난 드라이버는 종료합니다.
					driver.quit();// 모든 드라이버를 닫습니다.
				}
		
		return dtos;
	}
	
	
	//번개장터 파싱 메서드 - 셀레니움 웹드라이버 사용
		public static List<SearchDTO> parsing_BGJ(String word,HttpServletRequest request){
			List<SearchDTO> dtos = new ArrayList<SearchDTO>();
					String url="https://m.bunjang.co.kr/search/products?q="+word;
					String selector = "//div[@class='app']/div[1]/div[5]/div[1]/div[4]/div[1]/div";								// 선택자
					
					//웹드라이버 로드부분************************************************************
					String path = request.getSession().getServletContext().getRealPath("");
					path=path+"resources/chromedriver/chromedriver.exe";
					System.out.println("리소스 드라이버 경로1:"+ path);
					System.setProperty("webdriver.chrome.driver", path);
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
					
					System.out.println("번개장터 검색된 갯수:"+jElements.size());
					int cnt=0;
					try {
					for(WebElement element: jElements) {
						SearchDTO dto = new SearchDTO();
						WebElement aElement = element.findElement(By.tagName("a")); // 앵커 태그
						String adata_pid = aElement.getAttribute("data-pid");
						dto.setSrchURL(aElement.getAttribute("href"));
						WebElement mElement = element.findElement(By.tagName("img")); // 이미지 태그
						dto.setSrchImageURL(mElement.getAttribute("src"));
						dto.setSrchSiteName("번개장터");
						
						WebElement tElement = element.findElement(By.xpath("a[@data-pid='"+adata_pid+"']/div[2]/div[1]"));
						dto.setSrchTitle(tElement.getAttribute("innerText"));
						
						WebElement pElement = element.findElement(By.xpath("a[@data-pid='"+adata_pid+"']/div[2]/div[2]/div[1]")); // 가격태그
						String strtemp = pElement.getAttribute("innerText");
						
						strtemp = strtemp.replace(",", "");
						strtemp = strtemp.replace("원", "");
						strtemp = strtemp.replace("-", "");
						strtemp = strtemp.replace("무료나눔", "");
						try {
							dto.setSrchPrice(Integer.parseInt(strtemp)); // 가격 입력
						}catch (Exception e){
							dto.setSrchPrice(0); // 형식에 안맞으면 그냥 0으로 입력
						}
						
						if(dto.getSrchPrice() !=0) {
							dtos.add(dto); // 리스트에 추가
						}
					}
					}catch(Exception e) {
						
					}finally {
						driver.close();// 다쓰고난 드라이버는 종료합니다.
						driver.quit();// 모든 드라이버를 닫습니다.
					}
			return dtos;
		}
	
	
	
	
	//각종 사이트들을 자동으로 파싱하는 메서드입니다.
	public static List<SearchDTO> autoParsing(String word,HttpServletRequest request){
		//각종 사이트들의 검색 결과를 담을 그릇 준비
		List<SearchDTO> dtos = new ArrayList<SearchDTO>();
		System.out.println("크롤링 시작");
		String url;
		String selector;
		
		
		//**********셀레니움 통합 검색***************
		List<SearchDTO> dtos_selenium = parsing_Selenium_Session(word,request);
		dtos.addAll(dtos_selenium); // 검색된 리스트 추가
		
		
		
		//*********************************중고나라 검색*************************************
		//중고나라
		//List<SearchDTO> dtos_JGN = parsing_JGN(word,request); // 셀레니움 검색 
		//dtos.addAll(dtos_JGN); // 검색된 리스트 추가
		//*********************************중고나라 끝*************************************
		
		//*********************************번개장터 검색*************************************
		//번개장터
		//List<SearchDTO> dtos_BGJ = parsing_BGJ(word,request); // 셀레니움 검색 
		//dtos.addAll(dtos_BGJ); // 검색된 리스트 추가
		
		
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
			if(dto.getSrchPrice() !=0) {
				dtos.add(dto); //찾은 레코드들을 차곡차곡 담습니다.
			}
		}
		//**********************************당근마켓 검색 끝***********************************
		
		Collections.sort(dtos); //마지막으로 모든 결과값들을 가격순으로 정렬합니다.
		for(int i=0;i<dtos.size();i++) { // 가격순으로 인덱스 달아줌
			dtos.get(i).setSrchIndex(i+1);
		}
		System.out.println("가격미정 제품을 제외한 총갯수:"+dtos.size()+"개");
		System.out.println("크롤링 끝");
		return dtos;
	}
	
	
	
}
