package com.alhl.hz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.service.IUserService;

@Controller
public class AjaxController {
	@Autowired
	IUserService userSer;
	
	@RequestMapping(value = "idCheck.ing", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String user_id) {
		UserDTO dto = new UserDTO();
		dto.setUserId(user_id);
		return userSer.userIdCheck(dto);
	}
}
