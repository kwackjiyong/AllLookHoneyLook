package com.alhl.hz;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alhl.hz.dto.ShopDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.IShopService;

@Controller
public class ShopController {
	
	@Autowired
	IShopService shopSer;
	
	//이용권 관리 메인페이지
	@RequestMapping(value = "/shop_main.do", method = RequestMethod.GET)
	public String shopMain(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userData") != null){ //로그인 상태일 때
			UserDTO userdto = (UserDTO)session.getAttribute("userData"); // 세션에서 사용자 정보 가져옴
			ShopDTO shopdto = shopSer.shopSelectOne(userdto);//사용자 정보로 이용권 정보 가져옴
			if(shopdto == null) {
				shopdto = new ShopDTO();
				shopdto.setProductNum(0); //등급을 0으로 설정
			}
			model.addAttribute("shopData" ,shopdto);//모델에 이용권 정보 전달
			
		}else {// 비로그인상태일 때
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용해주세요.');</script>");
			out.flush();
			return "index";
		}
		
		
		
		
		return "shop_main";
	}
	
	
	//상품 구입
	@RequestMapping(value = "/shopPurchase.ing", method = RequestMethod.POST)
	public void shopUpdate(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception {
			
	}
}
