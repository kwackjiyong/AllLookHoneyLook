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

@Controller
public class ShopController {
	
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
	
	
	//상품 구입
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
					System.out.println(saleprice);
					saleprice = (int)Math.floor(saleprice);// 소숫점제거 
					System.out.println(saleprice);
				}
			}
			
			model.addAttribute("shopData" ,shopdto);//모델에 이용권 정보 전달
			model.addAttribute("user_productNum" ,productdtos.get(shopdto.getProductNum()).getProductName());//모델에 사용자 이용권 명 전달
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
}
