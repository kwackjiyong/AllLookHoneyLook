package com.alhl.hz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@RequestMapping(value = "/")
	public String home(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		return "index";
	}

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index_do(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		if ((UserDTO) request.getSession().getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) request.getSession().getAttribute("userData");
			userdto.setUserId(userdto.getUserId());
		}

		return "index";
	}
}
