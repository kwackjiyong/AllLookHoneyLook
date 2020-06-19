package com.alhl.hz.dao;

import java.util.List;

import com.alhl.hz.dto.UserDTO;

// [DB연결 사용법] 2. Dao인터페이스 생성
public interface IUserDao {
	public List<UserDTO> userSelect();
	public UserDTO userSelectOne(UserDTO dto);
	int userInsert(UserDTO dto);
	public int userIdCheck(UserDTO dto);
	public int userUpdate_Cash(UserDTO dto);
}
