package com.alhl.hz.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.alhl.hz.dto.NoticeDTO;

public interface INoticeService {

	// 게시글 전체목록 조회
	public List<NoticeDTO> noticeALLSelect();
	
	//게시글 상세보기
	public NoticeDTO read (int postId);
	
	//게시글 작성
	public void create(NoticeDTO dto);
	
	//게시글 수정
	public void update (NoticeDTO dto);
	
	//게시글 삭제
	public void delete(int postId);
	
	//게시글 조회
	public void increaseViewcnt(int postId); 

	
}
