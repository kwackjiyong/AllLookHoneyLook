package com.alhl.hz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alhl.hz.dto.SearchLogDTO;
import com.alhl.hz.dto.UserDTO;
import com.alhl.hz.util.SHA256;

//[DB연결 사용법] 3. 인터페이스 받아서 클래스 생성
@Repository
public class SearchLogDao implements ISearchLogDao {
	// 컨테이너가 객체를 자동으로 생성 Autowired
	@Autowired
	public SqlSessionTemplate mybatis;
	@Override
	public List<SearchLogDTO> userLogSelect(UserDTO userDTO){
		return mybatis.selectList("searchLogMapper.SearchLog_USER");
	}
	@Override
	public int logInsert(SearchLogDTO dto) {
		return mybatis.insert("searchLogMapper.SearchLog_INSERT",dto);
	}
}
