package com.alhl.hz;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alhl.hz.dto.CommentDTO;
import com.alhl.hz.service.ICommentService;

@Controller
public class CommentController {
	
	@Autowired
	ICommentService cSer;
	
	
	// 댓글 입력
	@RequestMapping(value = "/reply_insert.do",method = RequestMethod.POST)
	public void replyWrite(CommentDTO dto, RedirectAttributes rttr) throws Exception {

		cSer.commentInsert(dto);
	}
	//댓글 목록
	@RequestMapping(value = "/reply_list.do",method = RequestMethod.GET)
	public ModelAndView reply_list(@RequestParam int postId,ModelAndView mav) throws Exception {

		List<CommentDTO> list = cSer.commentList(postId);
		
		mav.setViewName("replyList");
		
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping(value ="/reply_list_json.do",method = RequestMethod.POST)
	public List<CommentDTO> listJson(@RequestParam int postId){
		List<CommentDTO> list = cSer.commentList(postId);
		return list;
	}
	
	/*
	 * //댓글 리스트를 호출할때 맵핑되는 메소드
	 * 
	 * @RequestMapping("/board/reply_list.do") public ModelAndView list(int
	 * member_bno, ModelAndView mav, MemberBoardReplyDTO dto,
	 * 
	 * @RequestParam(value="curPage")int curPage,
	 * 
	 * @RequestParam(value="search_option") String search_option,
	 * 
	 * @RequestParam(value="keyword") String keyword ) { List<MemberBoardReplyDTO>
	 * list = memberboardreplyService.list(member_bno);
	 * 
	 * System.out.println("뷰에 전달할 데이터"+list);
	 * 
	 * Map<String,Object> map = new HashMap<>(); //리스트의 값을 저장하기 위해 map객체를 생성하고 그 안에
	 * 리스트를 저장
	 * 
	 * map.put("list", list);
	 * 
	 * System.out.println("뷰에 전달할 데이터"+map);
	 * 
	 * mav.addObject("map", map); //뷰에 전달할 데이터 저장
	 * 
	 * 
	 * mav.setViewName("board/memberboardreply_list"); //뷰의 이름
	 * 
	 * mav.addObject("curPage", curPage); mav.addObject("search_option",
	 * search_option); mav.addObject("keyword", keyword);
	 * 
	 * 
	 * return mav; }
	 * 
	 * 
	 * //댓글 목록을 ArrayList로 리턴함
	 * 
	 * @RequestMapping("/board/reply_list_json.do") public List<MemberBoardReplyDTO>
	 * list_json(int member_bno){
	 * 
	 * return memberboardreplyService.list(member_bno);
	 * 
	 * }
	 * 
	 * //댓글 생성
	 * 
	 * @RequestMapping("/board/reply_insert.do") //세부적인 url pattern public void
	 * insert (MemberBoardReplyDTO dto, HttpSession session,
	 * 
	 * @RequestParam(value="r_content") String r_content,
	 * 
	 * @RequestParam(value="member_bno") int member_bno) {
	 * 
	 * //댓글 작성자 아이디 //현재 접속중인 사용자의 아이디
	 * 
	 * if (session.getAttribute("user_id") != null) {
	 * 
	 * String user_id = (String)session.getAttribute("user_id");
	 * dto.setUser_id(user_id);
	 * 
	 * }
	 * 
	 * 
	 * //소셜로그인한 아이디도 받아와야 하기때문에 세션에 저장된 아이디값들을 추가함
	 * 
	 * if (session.getAttribute("navername") != null) {
	 * 
	 * String user_id = (String)session.getAttribute("navername");
	 * dto.setUser_id(user_id);
	 * 
	 * }
	 * 
	 * 
	 * if (session.getAttribute("kakaonickname") != null) {
	 * 
	 * String user_id = (String)session.getAttribute("kakaonickname");
	 * dto.setUser_id(user_id);
	 * 
	 * }
	 * 
	 * 
	 * if (session.getAttribute("facebookname") != null) {
	 * 
	 * String user_id = (String)session.getAttribute("facebookname");
	 * dto.setUser_id(user_id);
	 * 
	 * }
	 * 
	 * 
	 * dto.setR_content(r_content); dto.setMember_bno(member_bno);
	 * 
	 * 
	 * //댓글이 테이블에 저장된다 memberboardreplyService.create(dto);
	 * 
	 * }
	 * 
	 * 
	 * //댓글 수정
	 * 
	 * @RequestMapping("/board/reply_update.do") //세부적인 url pattern public String
	 * reply_update (@RequestParam(value="rno") int
	 * rno, @RequestParam(value="r_content") String
	 * r_content, @RequestParam(value="user_id") String user_id,
	 * 
	 * @RequestParam(value="curPage")int
	 * curPage, @RequestParam(value="search_option")String
	 * search_option, @RequestParam(value="keyword")String keyword,
	 * 
	 * @RequestParam(value="member_bno")int member_bno, MemberBoardReplyDTO dto)
	 * throws Exception{
	 * 
	 * dto.setRno(rno); dto.setR_content(r_content); dto.setUser_id(user_id);
	 * 
	 * System.out.println("dto에 있는값들 출력함"+dto);
	 * 
	 * memberboardreplyService.reply_update(dto);
	 * 
	 * 
	 * return "forward:/board/list.do"; }
	 * 
	 * 
	 * //댓글 삭제
	 * 
	 * @RequestMapping(value = "/board/reply_delete.do" , method =
	 * {RequestMethod.GET, RequestMethod.POST} ) //세부적인 url pattern public String
	 * reply_delete (@RequestParam(value="rno") int rno, MemberBoardReplyDTO
	 * dto, @RequestParam(value="member_bno") int member_bno,
	 * 
	 * @RequestParam(value="curPage")int
	 * curPage, @RequestParam(value="search_option")String
	 * search_option, @RequestParam(value="keyword")String keyword) throws
	 * Exception{
	 * 
	 * 
	 * //파라미터로 받는 값은 자동적으로 String타입으로 변환되기 때문에 int타입으로 변환해주어야 한다.
	 * 
	 * memberboardreplyService.delete(rno);
	 * 
	 * 
	 * return "forward:/board/view.do";
	 * 
	 * }
	 */
}
