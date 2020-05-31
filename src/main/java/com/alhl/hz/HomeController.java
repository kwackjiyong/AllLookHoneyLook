package com.alhl.hz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alhl.hz.dto.SearchLogDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.ISearchLogService;
import com.alhl.hz.service.IUserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	IUserService userSer;
	
	
	@Autowired
	ISearchLogService srchSer;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/")
	public String home(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		return "index";
	}

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index_do(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData"); 
			System.out.println("접속중 id : " + userdto.getUserId());
			model.addAttribute("userData", userdto);
			List<SearchLogDTO> srchdto_hot = srchSer.hotLogSelect(); //인기검색어
			List<SearchLogDTO> srchdto_user = srchSer.userLogSelect(userdto); //유저의 최근 검색어
			if(srchdto_hot.size() >= 5) {
				srchdto_hot = srchdto_hot.subList(0, 4);
			}
			if(srchdto_user.size() >= 5) {
				srchdto_user = srchdto_user.subList(0, 4);
			}
			for(int i=0;i<srchdto_hot.size();i++) {
				srchdto_hot.get(i).setSrchId(i+1);
			}
			for(int i=0;i<srchdto_user.size();i++) {
				srchdto_user.get(i).setSrchId(i+1);
			}
			
			model.addAttribute("hotlog", srchdto_hot);
			model.addAttribute("userlog", srchdto_user);
		}

		return "index";
	}

	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage_do(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			System.out.println("userdto : " + userdto.getUserId());
			model.addAttribute("userData", userdto);
		}

		return "mypage";
	}

	@RequestMapping(value = "/help_one.do", method = RequestMethod.GET)
	public String help_one(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			System.out.println("userdto : " + userdto.getUserId());
			model.addAttribute("userData", userdto);
		}

		return "help_one";
	}

	@RequestMapping(value = "/help_one_suggest.ing", method = RequestMethod.GET)
	public String help_one_suggest(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			System.out.println("userdto : " + userdto.getUserId());
			model.addAttribute("userData", userdto);
		}

		return "mypage";
	}

	@RequestMapping(value = "/myhelp_board.do", method = RequestMethod.GET)
	public String myhelp_board(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			System.out.println("userdto : " + userdto.getUserId());
			model.addAttribute("userData", userdto);
		}

		return "myhelp_board";
	}

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
