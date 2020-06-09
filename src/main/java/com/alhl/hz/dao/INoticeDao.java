package com.alhl.hz.dao;


import java.util.List;

import com.alhl.hz.dto.NoticeDTO;

// [DB연결 사용법] 2. Dao인터페이스 생성
public interface INoticeDao {
	
	//게시글 전체 불러오기
	public List<NoticeDTO>noticeSelectAll();
	
	//게시글 
}
