package com.alhl.hz;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.openqa.selenium.remote.UnreachableBrowserException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alhl.hz.dto.SearchDTO;
import com.alhl.hz.dto.SearchLogDTO;
import com.alhl.hz.dto.ShopDTO;
import com.alhl.hz.dto.Shop_ProductDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.ISearchLogService;
import com.alhl.hz.service.IShopService;
import com.alhl.hz.util.JsoupParser;


@Controller
public class SearchController {

	@Autowired
	ISearchLogService srchSer;

	@Autowired
	IShopService shopSer;

	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String srchList(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam String searchWord) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// String word = request.getParameter("searchWord");
		model.addAttribute("searchWord", searchWord);
		PrintWriter out = response.getWriter();
		if(searchWord.equals("")) { //빈칸입력시
			out = response.getWriter();
			out.println("<script>alert('검색어를 입력해주세요');</script>");
			out.flush();
			return "index";
		}
		
		try {
			// 이전페이지에서 요청한 검색어를 가져옵니다.
			HttpSession session = request.getSession();
			if (session.getAttribute("userData") != null) {
				SearchLogDTO srchdto = new SearchLogDTO();
				UserDTO userdto = (UserDTO) session.getAttribute("userData");
				
				// 이메일 인증 확인
				if (userdto.getUserEmailCertified() != 1) {
					System.out.println("이메일 인증이 되어있지않습니다.");
					out = response.getWriter();
					out.println("<script>alert('가입된 이메일이 인증되지 않았습니다.');</script>");
					out.flush();
					return new HomeController().index_do(request, response, model);
				}
				
				
				// 오늘 날짜만 구합니다. (시분초제외)
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");

				java.util.Date date_Today = new java.util.Date(); // 오늘 날짜 데이터 가져옴

				String Today = new SimpleDateFormat("yyyyMMdd").format(date_Today);

				try {
					date_Today = formatter.parse(Today);

				} catch (ParseException e1) {

					System.out.println("오늘 날짜변환에 실패했습니다.");
				}
				// 사용자의 검색로그를 확인합니다.
				List<SearchLogDTO> srchLog = srchSer.userLogSelect(userdto);
				
				
				// 가장 최근 검색기록을 확인합니다.
				java.sql.Timestamp lastCheckTime;
				
				if(srchLog.size()!=0) {
					lastCheckTime= srchLog.get(0).getSrchTime();
				}else {
					lastCheckTime= new java.sql.Timestamp(formatter.parse("19700101").getTime());
				}
				// 사용자의 이용권 정보를 확인합니다.
				ShopDTO shopdto = shopSer.shopSelectOne(userdto);
				// 오늘 검색 내역이 없으면 잔여 검색횟수를 리셋해줍니다.*
				
				if(shopdto == null) { //이용권 결제 정보가 없을경우 만들어줍니다.
					shopdto = new ShopDTO();
					shopdto.setUserId(userdto.getUserId());
					shopdto.setProductNum(0);
				}
				
				System.out.println("최근 검색일:"+lastCheckTime);
				System.out.println("오늘 날짜 :"+date_Today);
				if (lastCheckTime.getTime() < date_Today.getTime()) {
					List<Shop_ProductDTO> product_dtos = shopSer.shopProduct_info(); // 이용권 정보 로드
					shopdto.setReCount(product_dtos.get(shopdto.getProductNum()).getBenefit());// 이용권의 혜택만큼 검색횟수를
																								// 지정해줍니다.
					// 잔여 검색횟수를 초기화해줍니다.
					shopSer.shopUpdate_reCount(shopdto);
					out = response.getWriter();
					out.println("<script>alert('오늘의 이용권 횟수를 초기화해드렸습니다.');</script>");
					out.flush();
				}
				
				// 잔여검색횟수가 부족할 때
				if (shopdto.getReCount() <= 0) {
					System.out.println("잔여 검색횟수가 부족해 검색하지 못했습니다.");
					out = response.getWriter();
					out.println("<script>alert('잔여 검색횟수가 부족해 검색하지 못했습니다');</script>");
					out.flush();
					return new HomeController().index_do(request, response, model);
				} else {
					// 잔여검색횟수를 1 차감합니다.
					shopdto.setReCount(shopdto.getReCount() - 1);
					// 차감
					shopSer.shopUpdate_reCount(shopdto);
					ShopDTO shopdto_result = shopSer.shopSelectOne(userdto);//사용자 정보로 이용권 정보 가져옴
					session.setAttribute("user_shopData", shopdto_result); // 세션의 이용권 정보를 갱신 (잔여검색횟수 때문에)
				}
				// 검색로그 남기는 부분*
				srchdto.setUserId(userdto.getUserId());
				srchdto.setSrchWord(searchWord);
				srchdto.setSrchTime(new java.sql.Timestamp(System.currentTimeMillis())); // 현재시간
				srchSer.logInsert(srchdto); // 검색 로그를 남깁니다.
			} else {
				System.out.println("세션이 없어 되돌아갑니다.");
				out = response.getWriter();
				out.println("<script>alert('로그인 후 검색을 이용해주세요.');</script>");
				out.flush();
				return "index";
			}
			
			
			out = response.getWriter();
			out.println("<script>alert('["+searchWord+ "]를 검색시작합니다. 수 초가 걸릴 수 있습니다.');</script>");
			out.flush();
			
			// Jsoup 클래스로 요청한 단어로 검색을 한결과를 가져옵니다.
			List<SearchDTO> dtos = JsoupParser.autoParsing(searchWord, request);
			model.addAttribute("counter", dtos.size());

			// 금액 형식 객체
			DecimalFormat frmt = new DecimalFormat("###,###");
			model.addAttribute("frmt", frmt);
			// 검색결과 갯수
			model.addAttribute("parsing_dtos", dtos);
			model.addAttribute("listCnt", dtos.size());
			return "search_List";
		} catch (UnreachableBrowserException e) {
			// e.printStackTrace();
			System.out.println("세션 상에 웹 드라이버가 없습니다.");
			out = response.getWriter();
			out.println("<script>alert('드라이버 세션이 종료되었습니다. 로그아웃하고 다시 로그인 후 이용해주세요 ');</script>");
			out.flush();
			return "index";
		} catch (NullPointerException e) {
			e.printStackTrace();
			System.out.println("세션이 없어 검색하지 못했습니다.");
			out = response.getWriter();
			out.println("<script>alert('로그인 후 검색을 이용해주세요.(드라이버)');</script>");
			out.flush();
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			out = response.getWriter();
			out.println("<script>alert('예상치 못한 오류로 검색하지 못했습니다.\n다시 로그인해보세요.');</script>");
			out.flush();
			return "index";
		}
	}

	@RequestMapping(value = "search_Random.do", method = RequestMethod.GET)
	public String srchList_Random(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 일단 최신 검색어 종류 최대 1000개 가져옴
		List<SearchLogDTO> dtos = srchSer.logSelect_1000();
		// 랜덤하게 섞어줌
		Collections.shuffle(dtos);
		// 랜덤하게 섞인 리스트중 첫번째 것을 가져옴
		String searchWord = dtos.get(0).getSrchWord();

		// 검색시작
		return srchList(locale, model, request, response, searchWord);

	}

}
