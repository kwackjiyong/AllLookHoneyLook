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

	@Override
	public List<UserDTO> userSelect(){
		// TODO Auto-generated method stub
		return mybatis.selectList("userMapper.userSelectALL");
	}
	
}
