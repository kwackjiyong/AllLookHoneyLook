package com.alhl.hz;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alhl.hz.dto.CommentDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.ICommentService;

@Controller
public class CommentController {

	@Autowired
	ICommentService cSer;

	// 댓글 입력
	@RequestMapping(value = "/reply_insert.do", method = RequestMethod.GET)
	@ResponseBody
	public int replyWrite(CommentDTO dto, HttpSession session, @RequestParam(value = "rContent") String rContent,
			@RequestParam(value = "postId") int postId) throws Exception {

		// 댓글 작성자 아이디
		// 현재 접속중인 사용자의 아이디

		if (session.getAttribute("userData") != null) { // 로그인 상태일 때
			UserDTO userdto = (UserDTO) session.getAttribute("userData"); // 세션에서 사용자 정보 가져옴
			dto.setUserId(userdto.getUserId());
			dto.setUserName(userdto.getUserName());
			dto.setReg_date(new java.sql.Timestamp(new java.util.Date().getTime())); // 현재시간을 등록시간에 담음
		}

		dto.setrContent(rContent);
		dto.setPostId(postId);
		// 댓글이 테이블에 저장된다
		return cSer.commentInsert(dto);
	}

	// 댓글 수정
	@RequestMapping(value="/reply_update.do", method = {RequestMethod.GET, RequestMethod.POST}) // 세부적인 url pattern
	@ResponseBody
	public String reply_update(HttpSession session,CommentDTO dto, HttpServletResponse response) throws Exception {

		if (session.getAttribute("userData") != null) { // 로그인 상태일 때
			dto.setUpreg_date(new java.sql.Timestamp(new java.util.Date().getTime())); // 현재시간을 등록시간에 담음

			System.out.println("dto에 있는값들 출력함" + dto);

			cSer.commentUpdate(dto);
			PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('댓글을 수정완료했습니다.');</script>");
			out.println("<script>location.href='notice_view.do?postId="+dto.getPostId()+"'</script>");
			out.flush();
		}else {
			PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('로그인을 먼저 해주세요.');</script>");
			out.println("<script>location.href='index.do'</script>");
			out.flush();
			return "index";
		}

		return "notice_view.do";

	}

	// 댓글 목록
	@RequestMapping(value = "/reply_list.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView reply_list(@RequestParam int postId, ModelAndView mav) throws Exception {

		List<CommentDTO> list = cSer.commentList(postId);

		System.out.println("뷰에 전달할 데이터" + list);

		mav.setViewName("reply_list");

		mav.addObject("list", list);

		return mav;
	}

	// 댓글 목록을 arraylist로 리턴함
	@RequestMapping(value = "/reply_list_json.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CommentDTO> listJson(@RequestParam int postId) {
		List<CommentDTO> list = cSer.commentList(postId);
		return list;
	}

	// 댓글 삭제
	@RequestMapping(value = "/reply_delete.do",method = {RequestMethod.GET, RequestMethod.POST} ) // 세부적인 url
	@ResponseBody																									// pattern
	public String reply_delete(HttpServletResponse response, HttpSession session, CommentDTO dto) throws Exception {
		System.out.println("삭제");
		// 파라미터로 받는 값은 자동적으로 String타입으로 변환되기 때문에 int타입으로 변환해주어야 한다.
		if (session.getAttribute("userData") != null) { // 로그인 상태일 때
			cSer.commentDelete(dto.getcId());
			PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('댓글을 삭제완료했습니다.');</script>");
			out.println("<script>location.href='index.do?postId="+dto.getPostId()+"'</script>");
			out.flush();
		}else {
			PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('로그인을 먼저 해주세요.');</script>");
			out.println("<script>location.href='index.do'</script>");
			out.flush();
			return "index";
		}
		return "notice_view.do";

	}

}
