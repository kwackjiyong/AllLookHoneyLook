package com.alhl.hz.dao;

import java.util.List;

import com.alhl.hz.dto.SearchLogDTO;
import com.alhl.hz.dto.UserDTO;

// [DB연결 사용법] 2. Dao인터페이스 생성
public interface ISearchLogDao {
	public List<SearchLogDTO> userLogSelect(UserDTO userDTO);
	public int logInsert(SearchLogDTO dto);
}
