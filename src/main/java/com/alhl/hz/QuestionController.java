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
	
	
	//문의 내역 리스트 보기
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
				separatorNum = 5;//페이지 분할 갯수가 지정하지 않았을시 7개씩
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
	
	
	
	
	
	
	
	
	
		
			//문의 등록 페이지
			@RequestMapping(value = "/question_write.do", method = RequestMethod.GET)
			public String que_insert_do(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

				response.setContentType("text/html; charset=UTF-8");
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");

				PrintWriter out;
				HttpSession session = request.getSession();
				if ((UserDTO) session.getAttribute("userData") != null) {
					return "question_write";
				}else {
					out = response.getWriter();
					out.println("<script>alert('로그인을 먼저 해주세요.');</script>");
					out.println("<script>location.href='index.do'</script>");
					out.flush();
					return "index";
				}
				
			}
		
	
	
		//문의 등록
		@RequestMapping(value = "/question_write.ing", method = RequestMethod.GET)
		public String que_insert_ing(HttpServletRequest request, HttpServletResponse response, Model model, QuestionDTO qdto) throws Exception {

			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");

			PrintWriter out;
			HttpSession session = request.getSession();
			if ((UserDTO) session.getAttribute("userData") != null) {
				UserDTO userdto = (UserDTO) session.getAttribute("userData");
					qdto.setUserId(userdto.getUserId()); // 사용자명 등록
					if(queSer.question_insert_user(qdto) == 1) {
						out = response.getWriter();
						out.println("<script>alert('문의 등록에 성공했습니다.');</script>");
						out.println("<script>location.href='question_list.do'</script>");
						out.flush();
						return "question_list";
					}else {
						out = response.getWriter();
						out.println("<script>alert('문의 등록에 실패했습니다.');</script>");
						out.println("<script>location.href='question_list.do'</script>");
						out.flush();
						return "question_list";
					}
				
			}else {
				out = response.getWriter();
				out.println("<script>alert('로그인을 먼저 해주세요.');</script>");
				out.println("<script>location.href='index.do'</script>");
				out.flush();
				return "index";
			}
			
		}
	
	
	
	
	
	//문의 내역보기
	@RequestMapping(value = "/question_info.do", method = RequestMethod.GET)
	public String que_info_do(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out;
		HttpSession session = request.getSession();
		if ((UserDTO) session.getAttribute("userData") != null) {
			int queId;
			try {
				queId = Integer.parseInt(request.getParameter("queId")); //글번호 받아옴
			}catch(Exception e){
				out = response.getWriter();
				out.println("<script>alert('글번호를 가져오는데 실패했습니다.');</script>");
				out.println("<script>location.href='question_list.do'</script>");
				out.flush();
				return "question_list";
			}
			QuestionDTO inputdto = new QuestionDTO();
			inputdto.setQueId(queId);
			QuestionDTO qdto = queSer.question_info_one(inputdto);
			model.addAttribute("quedto", qdto); // 모델에 글내용 담음
		}else {
			out = response.getWriter();
			out.println("<script>alert('로그인을 먼저 해주세요.');</script>");
			out.println("<script>location.href='index.do'</script>");
			out.flush();
			return "index";
		}
		
		
		return "question_info";
	}
	
	
	
	//문의 삭제 (사용자)
	@RequestMapping(value = "/question_delete.ing", method = RequestMethod.GET)
	public String que_delete_ing(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out;
		HttpSession session = request.getSession();
		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			int queId;
			try {
				queId = Integer.parseInt(request.getParameter("queId")); //글번호 받아옴
			}catch(Exception e){
				out = response.getWriter();
				out.println("<script>alert('글번호를 가져오는데 실패했습니다.');</script>");
				out.println("<script>location.href='question_list.do'</script>");
				out.flush();
				return "question_list";
			}
			QuestionDTO inputdto = new QuestionDTO();
			inputdto.setQueId(queId);
			QuestionDTO qdto = queSer.question_info_one(inputdto);
			if(qdto.getUserId().equals(userdto.getUserId())) { // 글작성자와 사용자가 같을 때에만 삭제
				if(queSer.question_delete_request(qdto) == 1) {
					out = response.getWriter();
					out.println("<script>alert('글삭제에 성공했습니다.');</script>");
					out.println("<script>location.href='question_list.do'</script>");
					out.flush();
					return "question_list";
				}else {
					out = response.getWriter();
					out.println("<script>alert('글삭제에 실패했습니다.');</script>");
					out.println("<script>location.href='question_list.do'</script>");
					out.flush();
					return "question_list";
				}
			}else {
				out = response.getWriter();
				out.println("<script>alert('작성자만 삭제가 가능합니다.');</script>");
				out.println("<script>location.href='question_list.do'</script>");
				out.flush();
				return "question_list";
			}
		}else {
			out = response.getWriter();
			out.println("<script>alert('로그인을 먼저 해주세요.');</script>");
			out.println("<script>location.href='index.do'</script>");
			out.flush();
			return "index";
		}
		
	}
	
	
	
	
	//문의 답변 달기
	@RequestMapping(value = "/question_edit.ing", method = RequestMethod.GET)
	public String que_edit_ing(HttpServletRequest request, HttpServletResponse response, Model model, QuestionDTO qdto) throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out;
		HttpSession session = request.getSession();
		if ((UserDTO) session.getAttribute("userData") != null) {
			UserDTO userdto = (UserDTO) session.getAttribute("userData");
			if(userdto.getUserAuthority() == 3 ) { // 문의내역 변경은 관리자만 가능
				if(queSer.question_update_Answer(qdto) == 1) {
					out = response.getWriter();
					out.println("<script>alert('문의내용변경에 성공했습니다.');</script>");
					out.println("<script>location.href='question_list.do'</script>");
					out.flush();
					return "question_list";
				}else {
					out = response.getWriter();
					out.println("<script>alert('문의내용변경에 실패했습니다.');</script>");
					out.println("<script>location.href='question_list.do'</script>");
					out.flush();
					return "question_list";
				}
			}else {
				out = response.getWriter();
				out.println("<script>alert('관리자만 가능한 기능입니다.');</script>");
				out.println("<script>location.href='question_list.do'</script>");
				out.flush();
				return "question_list";
			}
		}else {
			out = response.getWriter();
			out.println("<script>alert('로그인을 먼저 해주세요.');</script>");
			out.println("<script>location.href='index.do'</script>");
			out.flush();
			return "index";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
