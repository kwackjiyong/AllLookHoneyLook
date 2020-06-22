package com.alhl.hz;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alhl.hz.dto.ShopDTO;
import com.alhl.hz.dto.Shop_ProductDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.IShopService;
import com.alhl.hz.service.IUserService;

@Controller
public class ShopController {
	
	@Autowired
	IUserService userSer;
	
	@Autowired
	IShopService shopSer;
	
	//이용권 관리 메인페이지
	@RequestMapping(value = "/shop_main.do", method = RequestMethod.GET)
	public String shopMain(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("userData") != null){ //로그인 상태일 때
			UserDTO userdto = (UserDTO)session.getAttribute("userData"); // 세션에서 사용자 정보 가져옴
			ShopDTO shopdto = shopSer.shopSelectOne(userdto);//사용자 정보로 이용권 정보 가져옴
			if(shopdto == null) {
				shopdto = new ShopDTO();
				shopdto.setProductNum(0); //등급을 0으로 설정
			}
			List<Shop_ProductDTO> productdtos = shopSer.shopProduct_info(); // 상품리스트 정보 가져옴
			model.addAttribute("shopData" ,shopdto);//모델에 이용권 정보 전달
			model.addAttribute("productData" ,productdtos);//모델에 이용권 리스트 정보 전달
		}else {// 비로그인상태일 때
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용해주세요.');</script>");
			out.flush();
			return "index";
		}
		return "shop_main";
	}
	
	
	//상품 결제 페이지
	@RequestMapping(value = "/shop_Purchase.do", method = RequestMethod.GET)
	public String shopUpdate(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		int pNum = Integer.parseInt(request.getParameter("productNum")); // 어떤 상품인가?
		
		if(session.getAttribute("userData") != null){ //로그인 상태일 때
			UserDTO userdto = (UserDTO)session.getAttribute("userData"); // 세션에서 사용자 정보 가져옴
			ShopDTO shopdto = shopSer.shopSelectOne(userdto);//사용자 정보로 이용권 정보 가져옴
			if(shopdto == null) {
				shopdto = new ShopDTO();
				shopdto.setProductNum(0); //등급을 0으로 설정
			}

			List<Shop_ProductDTO> productdtos = shopSer.shopProduct_info(); // 상품리스트 정보 가져옴
			
			int saleprice =0;
			if(shopdto.getProductNum()!=0) { // 할인을 받으려면 기본등급이 아니어야 함
				long distemp = shopdto.getCheckOutTime().getTime()- new java.util.Date().getTime();
				long onemonth = 2592000000L;
				
				if(distemp > 0 ){ // 현재시간보다 커야함
					saleprice = (int)((productdtos.get(shopdto.getProductNum()).getPrice()*distemp )/ onemonth); // 원래 가격에서 남은 시간을 곱하고 한달을 나눈 값
					saleprice = (int)Math.floor(saleprice);// 소숫점제거 
				}
			}
			model.addAttribute("shopData" ,shopdto);//모델에 이용권 정보 전달
			model.addAttribute("user_productName" ,productdtos.get(shopdto.getProductNum()).getProductName());//모델에 사용자 이용권 명 전달
			model.addAttribute("productData" ,productdtos.get(pNum));//모델에 구매 이용권 명 전달
			model.addAttribute("saleprice",saleprice); // 잔여이용권만큼의 할인 금액 전달
		}else {// 비로그인상태일 때
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용해주세요.');</script>");
			out.flush();
			return "index";
		}
		return "shop_Purchase";
	}
	
	
	// 상품 결제
	@RequestMapping(value = "/shop_Purchase.ing", method = RequestMethod.GET)
	public String shopPurchase(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		int pNum = Integer.parseInt(request.getParameter("productNum")); // 어떤 상품인가?

		if (session.getAttribute("userData") != null) { // 로그인 상태일 때
			UserDTO userdto = (UserDTO) session.getAttribute("userData"); // 세션에서 사용자 정보 가져옴
			ShopDTO shopdto = shopSer.shopSelectOne(userdto);// 사용자 정보로 이용권 정보 가져옴
			if (shopdto == null) {
				shopdto = new ShopDTO();
				shopdto.setProductNum(0); // 등급을 0으로 설정
			}

			List<Shop_ProductDTO> productdtos = shopSer.shopProduct_info(); // 상품리스트 정보 가져옴

			int saleprice = 0;
			if (shopdto.getProductNum() != 0) { // 할인을 받으려면 기본등급이 아니어야 함
				long distemp = shopdto.getCheckOutTime().getTime() - new java.util.Date().getTime();
				long onemonth = 2592000000L;

				if (distemp > 0) { // 현재시간보다 커야함
					saleprice = (int) ((productdtos.get(shopdto.getProductNum()).getPrice() * distemp) / onemonth);
					saleprice = (int) Math.floor(saleprice);// 소숫점제거
				}
			}
			
			//결제 처리
			int resultcash =  productdtos.get(pNum).getPrice()- saleprice;
			//userdto.setCash(userdto.getCash() - resultcash); //call by reference issue로 인해서 방식 변경
			//결제처리를 담당 dto 생성
			UserDTO userdto_purchase = new UserDTO();
			userdto_purchase.setCash(userdto.getCash() - resultcash);
			userdto_purchase.setUserId(userdto.getUserId());
			if(1==userSer.userUpdate_Cash(userdto_purchase)){
				PrintWriter out = response.getWriter();
				out.println("<script>alert('결제 완료!');</script>");
				out.flush();
				//이용권 등록
				ShopDTO sDto = new ShopDTO();
				sDto.setProductNum(pNum); //상품 번호 등록
				sDto.setUserId(userdto.getUserId());//변경할 사용자명
				sDto.setReCount(productdtos.get(pNum).getBenefit()); // 횟수 리셋
				sDto.setCheckOutTime(new java.sql.Timestamp(new java.util.Date().getTime()+2592000000L)); // 현재 시간에 한달을 더한 값
				if(1==shopSer.shopUpdateOne(sDto)) {//이용권 등록
					userdto.setCash(userdto_purchase.getCash()); //캐쉬값 초기화
					session.setAttribute("userData", userdto); //세션 새로고침
					//이용권 정보도 세션에 다시 추가하는 과정
					ShopDTO shopdto_new = shopSer.shopSelectOne(userdto);//사용자 정보로 이용권 정보 가져옴
					if(shopdto_new == null) {
						shopdto_new = new ShopDTO();
						shopdto_new.setProductNum(0); //등급을 0으로 설정
					}
					session.setAttribute("user_shopData",shopdto_new);//세션에 이용권 정보 전달
					session.setAttribute("user_productName" ,productdtos.get(shopdto_new.getProductNum()).getProductName());//세션에 사용자 이용권 명 전달
					
					
					
					out = response.getWriter();
					out.println("<script>alert('이용권 등록 완료!');</script>");
					out.flush();
					return shopMain(request,response,model);
				}else {
					session.setAttribute("userData", userdto); //세션 새로고침
					out = response.getWriter();
					out.println("<script>alert('이용권 등록 실패\n1:1문의 바랍니다.');</script>");
					out.flush();
					return shopMain(request,response,model);
				}
			}else {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('[결제 실패] 캐쉬가 모자랍니다.');</script>");
				out.flush();
				return shopMain(request,response,model);
			}
			
			
			
		} else {// 비로그인상태일 때
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용해주세요.');</script>");
			out.flush();
			return "index";
		}
		
	}
	
	
}
