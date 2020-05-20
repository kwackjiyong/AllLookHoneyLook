package com.alhl.hz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.util.SHA256;

//[DB연결 사용법] 3. 인터페이스 받아서 클래스 생성
@Repository
public class UserDao implements IUserDao {
	// 컨테이너가 객체를 자동으로 생성 Autowired
	@Autowired
	public SqlSessionTemplate mybatis;

	/*
	 * @Override public List<UserDTO> userSelect(){ // TODO Auto-generated method
	 * stub return mybatis.selectList("userMapper.userSelectALL"); }
	 */
	@Override
	public UserDTO userSelectOne(UserDTO dto) {
		// TODO Auto-generated method stub
		dto.setUserPassword(SHA256.getSHA256(dto.getUserPassword()));
		return mybatis.selectOne("userMapper.userSelectOne", dto);
	}
	@Override
	public int userInsert(UserDTO dto) {
		// TODO Auto-generated method stub
		dto.setUserPassword(SHA256.getSHA256(dto.getUserPassword()));
		return mybatis.insert("userMapper.userInsert", dto);
	}
	@Override
	public List<UserDTO> userSelect() {
		// TODO Auto-generated method stub
		return null;
	}
}
