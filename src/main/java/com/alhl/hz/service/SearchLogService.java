package com.alhl.hz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.alhl.hz.dao.ISearchLogDao;
import com.alhl.hz.dao.IUserDao;
import com.alhl.hz.dao.SearchLogDao;
import com.alhl.hz.dto.SearchLogDTO;
import com.alhl.hz.dto.UserDTO;

//[DB연결 사용법] 6. 서비스 클래스 작성
@Service("ISearchLogService")
public class SearchLogService implements ISearchLogService {
	// 인터페이스로 생성해야함
	@Autowired
	public ISearchLogDao dao;
	@Override
	public List<SearchLogDTO> userLogSelect(UserDTO userDTO){
		return dao.userLogSelect(userDTO);
	}
	
	
	@Override
	public int logInsert(SearchLogDTO dto) {
		return dao.logInsert(dto);
	}
	
}
