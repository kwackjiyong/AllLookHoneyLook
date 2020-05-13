package com.alhl.hz;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.IUserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	IUserService userSer;

	
	/** 
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model)throws Exception {
		
		List<UserDTO> userdtos= userSer.userSelect(); // 쿼리문을 날려서 DB에서 모든 게시판 레코드를 담음  
		model.addAttribute("userdata",userdtos);
		
		return "home";
	}
	
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model)throws Exception {
		
		List<UserDTO> userdtos= userSer.userSelect(); // 쿼리문을 날려서 DB에서 모든 게시판 레코드를 담음  
		model.addAttribute("userdata",userdtos);
		
		return "index";
	}
	
	
	
	
}
