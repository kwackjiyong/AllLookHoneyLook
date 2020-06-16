package com.alhl.hz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alhl.hz.dto.UserDTO;

@Controller
public class ShopController {
	
	
	
	//상품 구입
	@RequestMapping(value = "/shopPurchase.ing", method = RequestMethod.POST)
	public void shopUpdate(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception {
			
	}
}
