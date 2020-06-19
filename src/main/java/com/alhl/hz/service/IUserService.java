package com.alhl.hz.service;

import java.util.List;

import com.alhl.hz.dto.UserDTO;

// [DB연결 사용법] 5. 서비스 인터페이스 작성
public interface IUserService {
	public List<UserDTO> userSelect();
	
	public UserDTO userSelectOne(UserDTO dto);

	public int userInsert(UserDTO dto);
	
	public int userIdCheck(UserDTO dto);
	
	public int userUpdate_Cash(UserDTO dto);
}
