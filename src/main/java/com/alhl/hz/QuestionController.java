package com.alhl.hz;

import java.io.PrintWriter;
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

import com.alhl.hz.dto.QuestionDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.IQuestionService;
import com.alhl.hz.service.IUserService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class QuestionController {

	@Autowired
	IUserService userSer;
	@Autowired
	IQuestionService queSer;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/question_list.do", method = RequestMethod.GET)
	public String que_list_do(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			model.addAttribute("userData", userdto);
			
			int pageNum;
			int separatorNum;
			int pgseparatorNum;
			try {
				pageNum = Integer.parseInt(request.getParameter("pageNum")); // 페이지 넘버를 리퀘스트에서 받아서 지정해유
			}catch(Exception e) {
				pageNum = 1; //페이지넘버가 지정하지않았을시 1페이지루 가 
			}
			try {
				separatorNum = Integer.parseInt(request.getParameter("separatorNum")); //리스트 분할갯수를 리퀘스트에서 받아서 지정해유
			}catch(Exception e) {
				separatorNum = 7;//페이지 분할 갯수가 지정하지 않았을시 7개씩
			}
			try {
				pgseparatorNum = Integer.parseInt(request.getParameter("pgseparatorNum")); //페이지 분할갯수를 리퀘스트에서 받아서 지정해유
			}catch(Exception e) {
				pgseparatorNum = 5;//페이지 분할 갯수가 지정하지 않았을시 5개씩
			}
			List<QuestionDTO> quedtos = new ArrayList();
			if(userdto.getUserAuthority() == 3) { 
				quedtos= queSer.question_info_ALL(); // 관리자일경우 모든 사용자
			}else {
				quedtos= queSer.question_info_user(userdto); // 일반사용자일경우 자신의 문의내역만 
			}
			if(quedtos.size() != 0) { //없을경우 페이징 안함
				com.alhl.hz.util.Paging.AutoPaging(request, response, model, quedtos, pageNum, separatorNum,pgseparatorNum); //자동페이징
			}
		}else {
			PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('로그인을 먼저 해주세요.');</script>");
			out.println("<script>location.href='index.do'</script>");
			out.flush();
			return "index";
		}
		
		
		return "question_list";
	}
	
	@RequestMapping(value = "/question_info.do", method = RequestMethod.GET)
	public String que_info_do(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			model.addAttribute("userData", userdto);
			
			int pageNum;
			int separatorNum;
			int pgseparatorNum;
			try {
				pageNum = Integer.parseInt(request.getParameter("pageNum")); // 페이지 넘버를 리퀘스트에서 받아서 지정해유
			}catch(Exception e) {
				pageNum = 1; //페이지넘버가 지정하지않았을시 1페이지루 가 
			}
			try {
				separatorNum = Integer.parseInt(request.getParameter("separatorNum")); //리스트 분할갯수를 리퀘스트에서 받아서 지정해유
			}catch(Exception e) {
				separatorNum = 7;//페이지 분할 갯수가 지정하지 않았을시 7개씩
			}
			try {
				pgseparatorNum = Integer.parseInt(request.getParameter("pgseparatorNum")); //페이지 분할갯수를 리퀘스트에서 받아서 지정해유
			}catch(Exception e) {
				pgseparatorNum = 5;//페이지 분할 갯수가 지정하지 않았을시 5개씩
			}
			List<QuestionDTO> quedtos = new ArrayList();
			if(userdto.getUserAuthority() == 3) {
				quedtos= queSer.question_info_ALL(); // 쿼리문을 날려서 DB에서 모든 게시판 레코드를 담음
			}else {
				quedtos= queSer.question_info_user(userdto); // 쿼리문을 날려서 DB에서 모든 게시판 레코드를 담음  
			}
			if(quedtos.size() != 0) {
				com.alhl.hz.util.Paging.AutoPaging(request, response, model, quedtos, pageNum, separatorNum,pgseparatorNum); //자동페이징
			}
		}else {
			PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('로그인을 먼저 해주세요.');</script>");
			out.println("<script>location.href='index.do'</script>");
			out.flush();
			return "index";
		}
		
		
		return "question_list";
	}
	
	
	
}
