package com.alhl.hz;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alhl.hz.dto.CommentDTO;
import com.alhl.hz.service.CommentService;

public class CommentController {
	
	@Autowired
	CommentService cSer;
	
	//댓글 입력
	@RequestMapping(value = "/insert.do")
	public void reply_insert(@ModelAttribute CommentDTO dto,HttpSession session) throws Exception {

		String userId = (String)session.getAttribute("userId");
		
		dto.setWriter(userId);
		
		cSer.commentInsert(dto);
		
	}
	
	//댓글 목록
	@RequestMapping(value = "/list.do")
	public ModelAndView reply_list(@RequestParam int bId,ModelAndView mav) throws Exception {

		List<CommentDTO> list = cSer.commentList(bId);
		
		mav.setViewName("replyList");
		
		mav.addObject("list",list);
		
		return mav;
		
	}
	
	@RequestMapping("listJson.do")
	@ResponseBody
	public List<CommentDTO> listJson(@RequestParam int bId){
		List<CommentDTO> list = cSer.commentList(bId);
		return list;
	}
	
}
