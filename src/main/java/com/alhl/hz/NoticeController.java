package com.alhl.hz;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.alhl.hz.dto.NoticeDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.INoticeService;
import com.alhl.hz.service.IUserService;

@Controller
public class NoticeController {

	@Autowired
	IUserService userSer;
	@Autowired
	INoticeService notSer;

	// _______________________________________________________게시판 페이지이동_______________________________________________________ //

	// 공지사항 테이블 (전체 불러오기)
	@RequestMapping(value = "/notice_board.do", method = RequestMethod.GET)
	public String notice_board(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		model.addAttribute("list", notSer.noticeALLSelect());
		return "notice_board";
	}

	//글쓰기 페이지
	@RequestMapping(value = "/notice_Form.do", method = RequestMethod.GET)
	public String notice_Form(@ModelAttribute("dto") NoticeDTO dto, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		return "notice_Form";
	}

	// 게시글 상세보기 페이지 이동

	@RequestMapping(value = "/notice_view.do", method = RequestMethod.GET)
	public ModelAndView notice_view(@RequestParam int postId) throws Exception {

		notSer.increaseViewcnt(postId);

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("notice_view");
		
		mav.addObject("dto",notSer.read(postId));

		return mav;
	}
	
	//게시글 수정 페이지 이동
	@RequestMapping(value = "/notice_update_pg.do", method = RequestMethod.GET)
	public String notice_update_pg(HttpServletRequest request,
			HttpServletResponse response, Model model,@RequestParam int postId) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		 
		NoticeDTO dto = notSer.read(postId);

		model.addAttribute("dto", dto);
		
		return "notice_update_pg";
	}
	
	
	// _______________________________________________________여기부터 게시판 처리_______________________________________________________ //

	// 글쓰기
	@RequestMapping(value = "/Notice_Writing", method = RequestMethod.POST)
	public String Notice_Writing(@ModelAttribute("dto") NoticeDTO dto, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userId = ((UserDTO) session.getAttribute("userData")).getUserId();
		dto.setUserId(userId);
		notSer.create(dto);

		return "redirect:notice_board.do";
	}
	

	//게시글 수정
	@RequestMapping(value = "/notice_update.ing", method = RequestMethod.POST)
	public String notice_update(@ModelAttribute ("dto") NoticeDTO dto, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		notSer.update(dto);
		return "redirect:notice_board.do";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/notice_delete.ing", method = RequestMethod.POST)
	public String notice_delete(@RequestParam int postId) throws Exception {

		notSer.delete(postId);

		return "redirect:notice_board.do";
	}
	
		
}
