package com.alhl.hz;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class UserController {

	@Autowired
	IUserService userSer;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "sign_in.do", method = RequestMethod.GET)
	public String sign_in(Locale locale, Model model) throws Exception {

		List<UserDTO> userdtos = userSer.userSelect(); // 쿼리문을 날려서 DB에서 모든 게시판 레코드를 담음
		model.addAttribute("userdata", userdtos);

		return "sign_in";
	}

	// 회원가입
	@RequestMapping(value = "/sign_in.ing", method = RequestMethod.POST)
	public void sign_in(HttpServletRequest request, HttpServletResponse response, Model model, UserDTO userdto)
			throws Exception {

		response.setContentType("text/html; charset=UTF-8");

		if (userSer.userInsert(userdto) == 1) {// 회원가입성공
			PrintWriter out = response.getWriter();
			out.println("<script>alert('" + userdto.getUserName() + "님 회원가입 완료를 축하드립니다.');</script>");
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입 실패');</script>");
			out.flush();
		}
		PrintWriter out = response.getWriter();
		out.println("<script>location.href='index.do'</script>");
		out.flush();
	}

	// 로그인
	@RequestMapping(value = "/login.ing", method = RequestMethod.POST)
	public void login_do(HttpServletRequest request, HttpServletResponse response, Model model, UserDTO userdto)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		// id가 있는지 확인하고 해당 id에서 각종 정보를 검색합니다.
		UserDTO selectDTO = userSer.userSelectOne(userdto);
		// 아이디가 존재할 때
		try {
			if (selectDTO.getUserPassword().equals(userdto.getUserPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("userData", selectDTO); // 유저 정보 한꺼번에 넣음
				model.addAttribute("userData", selectDTO); // 유저 정보 한꺼번에 넣음
				PrintWriter out = response.getWriter();
				out.println("<script>alert('" + userdto.getUserId() + "님 로그인 성공');</script>");
				out.flush();
			} else {
				System.out
						.println("DBPW:" + selectDTO.getUserPassword() + "\n" + "inputPW:" + userdto.getUserPassword());
				PrintWriter out = response.getWriter();
				out.println("<script>alert('패스워드가 틀렸습니다.');</script>");
				out.flush();
			}
		} catch (Exception e) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('" + userdto.getUserId() + "는 존재하지 않는 아이디입니다.');</script>");
			out.flush();
		} finally {
			PrintWriter out = response.getWriter();
			out.println("<script>location.href='index.do'</script>");
			out.flush();
		}
	}


	// 로그아웃

	@RequestMapping("/logout.ing")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.do";
	}

	/*
	 * // 회원정보 수정
	 * 
	 * @RequestMapping("/member_modify.do") public String modify(HttpServletRequest
	 * request, HttpServletResponse response, Model model, Member_dto dto) {
	 * 
	 * System.out.println("member_modify()페이지");
	 * 
	 * return "member_modify"; }
	 * 
	 * // 회원 수정
	 * 
	 * @RequestMapping("/member_modify.ing") public String
	 * modify_ing(HttpServletRequest request, HttpServletResponse response, Model
	 * model, Member_dto dto) {
	 * 
	 * System.out.println("member_modify()진행");
	 * 
	 * int result = memService.memberUpdate(dto);
	 * 
	 * model.addAttribute("modify_request", result);
	 * 
	 * if (result == 1) { System.out.println("회원수정 성공"); } else {
	 * System.out.println("실패"); } return "member_modify"; }
	 * 
	 * // 회원 삭제
	 * 
	 * @RequestMapping("/member_delete.do") public String delete(HttpServletRequest
	 * request, Model model, Member_dto dto) {
	 * 
	 * System.out.println("member_delete()");
	 * 
	 * return "member_delete"; }
	 * 
	 * @RequestMapping("/member_delete.ing") public String
	 * delete_ing(HttpServletRequest request, HttpServletResponse response, Model
	 * model, Member_dto dto) {
	 * 
	 * System.out.println("member_delete()처리");
	 * 
	 * int delete_result = memService.memberDelete(dto);
	 * 
	 * if (delete_result == 1) { System.out.println("탈퇴성공");
	 * 
	 * HttpSession session = request.getSession(); session.invalidate(); } else {
	 * System.out.println("탈퇴 실패"); } return "index"; }
	 */

}
