package com.alhl.hz;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.openqa.selenium.remote.UnreachableBrowserException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alhl.hz.dto.SearchDTO;
import com.alhl.hz.dto.SearchLogDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.ISearchLogService;
import com.alhl.hz.service.IUserService;
import com.alhl.hz.util.JsoupParser;

@Controller
public class SearchController {
	
	@Autowired
	ISearchLogService srchSer;
	
	
	
	
	
	
	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String srchList(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response,@RequestParam String searchWord)throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		
        
        
        //String word = request.getParameter("searchWord");
		model.addAttribute("searchWord", searchWord);
        
		try {
		//이전페이지에서 요청한 검색어를 가져옵니다.
		HttpSession session = 	request.getSession();
		if(session.getAttribute("userData") != null){
			SearchLogDTO srchdto = new SearchLogDTO();
			UserDTO userdto = (UserDTO)session.getAttribute("userData");
			srchdto.setUserId(userdto.getUserId());
			srchdto.setSrchWord(searchWord);
			srchdto.setSrchTime(new java.sql.Timestamp(System.currentTimeMillis())); // 현재시간
			srchSer.logInsert(srchdto); // 검색 로그를 남깁니다.
		}else {
			System.out.println("세션이 없어 검색하지 못했습니다.");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 검색을 이용해주세요.');</script>");
			out.flush();
			return "index";
		}
		
		
		//Jsoup 클래스로 요청한 단어로 검색을 한결과를 가져옵니다.
		List<SearchDTO> dtos= JsoupParser.autoParsing(searchWord,request);
		model.addAttribute("counter", dtos.size());
		
		//금액 형식 객체
		DecimalFormat frmt = new DecimalFormat("###,###");
		model.addAttribute("frmt", frmt);
		//검색결과 갯수
		model.addAttribute("parsing_dtos",dtos);
		model.addAttribute("listCnt", dtos.size());
		return "search_List";
		}catch (UnreachableBrowserException e) {
			//e.printStackTrace();
			System.out.println("세션 상에 웹 드라이버가 없습니다.");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('드라이버 세션이 종료되었습니다. 로그아웃하고 다시 로그인 후 이용해주세요 ');</script>");
			out.flush();
			return "index";
		}catch (NullPointerException e) {
			//e.printStackTrace();
			System.out.println("세션이 없어 검색하지 못했습니다.");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 검색을 이용해주세요.');</script>");
			out.flush();
			return "index";
		}catch(Exception e) {
			e.printStackTrace();
			PrintWriter out = response.getWriter();
			out.println("<script>alert('예상치 못한 오류로 검색하지 못했습니다.\n다시 로그인해보세요.');</script>");
			out.flush();
			return "index";
		}
	}
	
	
	
	@RequestMapping(value = "search_Random.do", method = RequestMethod.GET)
	public String srchList_Random(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response)throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
		
        //일단 최신 검색어 종류 최대 1000개 가져옴
        List<SearchLogDTO> dtos =srchSer.logSelect_1000();
        //랜덤하게 섞어줌
        Collections.shuffle(dtos);
        //랜덤하게 섞인 리스트중 첫번째 것을 가져옴
        String searchWord = dtos.get(0).getSrchWord();
        
        //검색시작
        return srchList(locale,  model, request, response,searchWord);
		
	}
	
	
}
