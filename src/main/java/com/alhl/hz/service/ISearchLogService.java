package com.alhl.hz.service;

import java.util.List;

import com.alhl.hz.dto.SearchLogDTO;
import com.alhl.hz.dto.UserDTO;

// [DB연결 사용법] 5. 서비스 인터페이스 작성
public interface ISearchLogService {
	public List<SearchLogDTO> userLogSelect(UserDTO userDTO);
	public int logInsert(SearchLogDTO dto);
}
