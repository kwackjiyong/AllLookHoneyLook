package com.alhl.hz.service;

import java.util.List;

import com.alhl.hz.dto.CommentDTO;

public interface ICommentService {

	 // 댓글 개수
    public int commentCount();
 
    // 댓글 목록
    public List<CommentDTO> commentList(int bId);
 
    // 댓글 작성
    public void commentInsert(CommentDTO comment);
    
    // 댓글 수정
    public void commentUpdate(CommentDTO comment);
 
    // 댓글 삭제
    public void commentDelete(int cId);
	
}
