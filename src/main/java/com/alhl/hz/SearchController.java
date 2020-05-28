package com.alhl.hz;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alhl.hz.dto.SearchDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.util.JsoupParser;

@Controller
public class SearchController {
	
	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String srchList(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response)throws Exception {
		//이전페이지에서 요청한 검색어를 가져옵니다.
		String word = request.getParameter("searchWord");
		
		model.addAttribute("searchWord", word);
		int pageNum; //페이지 번호
		int separatorNum; //결과리스트를 몇개씩 볼것인지 
		int pgseparatorNum; // 페이지목록이 몇개씩 나올 것인지 
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum")); // 페이지 넘버를 리퀘스트에서 받아서 지정해유
		}catch(Exception e) {
			pageNum = 1; //페이지넘버가 지정하지않았을시 1페이지루 가 
		}
		try {
			separatorNum = Integer.parseInt(request.getParameter("separatorNum")); //리스트 분할갯수를 리퀘스트에서 받아서 지정해유
		}catch(Exception e) {
			separatorNum = 7;//페이지 분할 갯수가 지정하지 않았을시 7개씩
		}
		try {
			pgseparatorNum = Integer.parseInt(request.getParameter("pgseparatorNum")); //페이지 분할갯수를 리퀘스트에서 받아서 지정해유
		}catch(Exception e) {
			pgseparatorNum = 5;//페이지 분할 갯수가 지정하지 않았을시 5개씩
		}
		
		//Jsoup 클래스로 요청한 단어로 검색을 한결과를 가져옵니다.
		List<SearchDTO> dtos= JsoupParser.autoParsing(word,request);
		model.addAttribute("counter", dtos.size());
		//리스트가 1개이상 존재할 때
		if(dtos.size()>0) {
		com.alhl.hz.util.Paging.AutoPaging(request, response, model, dtos, pageNum, separatorNum,pgseparatorNum);// 페이징 API [페이지 분할,리스트분할,페이지 추적]
		}
		
		//금액 형식 객체
		DecimalFormat frmt = new DecimalFormat("###,###");
		model.addAttribute("frmt", frmt);
		//검색결과 갯수
		model.addAttribute("parsing_dtos",dtos);
		model.addAttribute("listCnt", dtos.size());
		return "search_List";
	}
}
