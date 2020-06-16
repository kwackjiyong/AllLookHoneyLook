package com.alhl.hz;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alhl.hz.dto.UserDTO;

@Controller
public class ShopController {
	
	
	
	//이용권 관리 메인페이지
	@RequestMapping(value = "/shop_main.do", method = RequestMethod.GET)
	public String shopMain(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("userData") != null){ //로그인 상태일 때
			UserDTO userdto = (UserDTO)session.getAttribute("userData");
			
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
