package com.alhl.hz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alhl.hz.dto.CommentDTO;
import com.alhl.hz.service.ICommentService;

@Controller
public class CommentController {
	
	@Autowired
	ICommentService cSer;
	
	
	
	 //댓글 리스트를 호출할때 맵핑되는 메소드
    @RequestMapping("/board/reply_list.do")
    public ModelAndView list(int postId, ModelAndView mav, CommentDTO dto,
            @RequestParam(value="curPage")int curPage,
            @RequestParam(value="search_option") String search_option,
            @RequestParam(value="keyword") String keyword
            ) {
        List<CommentDTO> list = cSer.commentList(postId);
 
        System.out.println("뷰에 전달할 데이터"+list);
        
        Map<String,Object> map = new HashMap<String, Object>();    //리스트의 값을 저장하기 위해 map객체를 생성하고 그 안에 리스트를 저장
        
        map.put("list", list);
        
        System.out.println("뷰에 전달할 데이터"+map);
        
        mav.addObject("map", map);    //뷰에 전달할 데이터 저장
        
    
        mav.setViewName("notice_view");    //뷰의 이름
        
        mav.addObject("curPage", curPage);
        mav.addObject("search_option", search_option);
        mav.addObject("keyword", keyword);
 
        
        return mav;
    }
	
	// 댓글 입력
	@RequestMapping(value = "/reply_insert.do", method = RequestMethod.POST)
	public void replyWrite(CommentDTO dto,HttpSession session,@RequestParam(value="rContent") String rContent,@RequestParam(value="postId") int postId) throws Exception {

		// 댓글 작성자 아이디
		// 현재 접속중인 사용자의 아이디

		if (session.getAttribute("userId") != null) {

			String userId = (String) session.getAttribute("userId");
			dto.setUserId(userId);

		}
		
		dto.setrContent(rContent);
		dto.setPostId(postId);
		// 댓글이 테이블에 저장된다
		cSer.commentInsert(dto);

	}
    
    
    //댓글 수정
    @RequestMapping("/reply_update.do")    //세부적인 url pattern
    public String reply_update (@RequestParam(value="cId") int cId, @RequestParam(value="rContent") String rContent, @RequestParam(value="userId") String userId,
            @RequestParam(value="curPage")int curPage, @RequestParam(value="search_option")String search_option,
            @RequestParam(value="postId")int postId, CommentDTO dto) throws Exception{
        
        dto.setcId(cId);
        dto.setrContent(rContent);
        dto.setUserId(userId);
        
        System.out.println("dto에 있는값들 출력함"+dto);
 
        cSer.commentUpdate(dto);
        
        return "notice_view.do";
		
	}
    
	//댓글 목록
	@RequestMapping(value = "/reply_list.do",method = RequestMethod.GET)
	public ModelAndView reply_list(@RequestParam int postId,ModelAndView mav) throws Exception {

		List<CommentDTO> list = cSer.commentList(postId);
		
		System.out.println("뷰에 전달할 데이터"+list);
		
		mav.setViewName("replyList");
		
		mav.addObject("list",list);
		
		return mav;
	}
	
	// 댓글 목록을 arraylist로 리턴함
	@RequestMapping(value ="/reply_list_json.do",method = RequestMethod.POST)
	public List<CommentDTO> listJson(@RequestParam int postId){
		List<CommentDTO> list = cSer.commentList(postId);
		return list;
	}
	
	/*
	 * //댓글 삭제
	 * 
	 * @RequestMapping(value = "/board/reply_delete.do" , method =
	 * {RequestMethod.GET, RequestMethod.POST} ) //세부적인 url pattern public String
	 * reply_delete (@RequestParam(value="cId") int cId, CommentDTO
	 * dto, @RequestParam(value="postId") int postId,
	 * 
	 * @RequestParam(value="curPage")int
	 * curPage, @RequestParam(value="search_option")String
	 * search_option, @RequestParam(value="keyword")String keyword) throws
	 * Exception{
	 * 
	 * 
	 * //파라미터로 받는 값은 자동적으로 String타입으로 변환되기 때문에 int타입으로 변환해주어야 한다.
	 * 
	 * cSer.commentDelete(cId);
	 * 
	 * 
	 * return "forward:/board/view.do";
	 * 
	 * }
	 */
	
}
