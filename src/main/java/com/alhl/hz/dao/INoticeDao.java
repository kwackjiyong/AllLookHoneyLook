package com.alhl.hz.dao;

import java.util.List;

import com.alhl.hz.dto.NoticeDTO;

// [DB연결 사용법] 2. Dao인터페이스 생성
public interface INoticeDao {

	// 게시글 전체목록 조회
	public List<NoticeDTO> noticeALLSelect();

	// 게시글 상세보기
	public NoticeDTO read(int postId);

	// 게시글 작성
	public void create(NoticeDTO dto);

	// 게시글 수정
	public void update(NoticeDTO dto);

	// 게시글 삭제
	public void delete(int postId);

	// 게시글 조회
	public void increaseViewcnt(int postId);
}
