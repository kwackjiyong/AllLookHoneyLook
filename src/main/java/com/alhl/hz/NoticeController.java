package com.alhl.hz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.ISearchLogService;
import com.alhl.hz.service.IUserService;

@Controller
public class NoticeController {
	
	@Autowired
	IUserService userSer;
	@Autowired
	ISearchLogService srchSer;
	
	
	@RequestMapping(value = "/notice_board.do", method = RequestMethod.GET)
	public String notice_board(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			System.out.println("userdto : " + userdto.getUserId());
			model.addAttribute("userData", userdto);
		}

		return "notice_board";
	}
	
	@RequestMapping(value = "/notice_manager.do", method = RequestMethod.GET)
	public String notice_manager(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			System.out.println("userdto : " + userdto.getUserId());
			model.addAttribute("userData", userdto);
		}

		return "notice_manager";
	}
}