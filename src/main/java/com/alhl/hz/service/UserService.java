package com.alhl.hz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.alhl.hz.dao.IUserDao;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.util.SHA256;

//[DB연결 사용법] 6. 서비스 클래스 작성
@Service("IUserService")
public class UserService implements IUserService {
	// 인터페이스로 생성해야함
	@Autowired
	public IUserDao dao;
	
	@Override
	public List<UserDTO> userSelect() {
		return dao.userSelect();
	}
	
	@Override
	public UserDTO userSelectOne(UserDTO dto) {
		return dao.userSelectOne(dto);
	}
	
	@Override
	public int userInsert(UserDTO dto) {
		return dao.userInsert(dto);
	}
	
	@Override
	public int userIdCheck(UserDTO dto){
		return dao.userIdCheck(dto);
	}
	@Override
	public int userUpdate_Cash(UserDTO dto) {
		return dao.userUpdate_Cash(dto);
	}
	
	
	@Override
	public int userUpdate(UserDTO dto) {
		return dao.userUpdate(dto);
	}
	@Override
	public int userDelete(UserDTO dto) {
		return dao.userDelete(dto);
	}
	@Override
	public int userEmailCheck(UserDTO dto) {
		return dao.userEmailCheck(dto);
	}
}
