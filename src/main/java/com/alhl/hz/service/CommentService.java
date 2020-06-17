package com.alhl.hz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alhl.hz.dto.CommentDTO;

@Service("ICommentService")
public class CommentService implements ICommentService{

	// 인터페이스로 생성해야함
	@Autowired
	public ICommentService dao;

	// 댓글 개수
	@Override
	public int commentCount() {
		return dao.commentCount();
	}
	
	// 댓글 목록
	@Override
	public List<CommentDTO> commentList(int bId) {
		return null;
	}
	
	// 댓글 작성
	@Override
	public void commentInsert(CommentDTO comment) {
		dao.commentInsert(comment);
	}
	
	// 댓글 수정
	@Override
	public void commentUpdate(CommentDTO comment) {
		dao.commentUpdate(comment);
	}
	
	// 댓글 삭제
	@Override
	public void commentDelete(int cId) {
		dao.commentDelete(cId);
	}
	
}