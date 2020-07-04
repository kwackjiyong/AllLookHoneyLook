package com.alhl.hz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alhl.hz.dto.CommentDTO;
@Repository
public class CommentDao implements ICommentDAO{
	
	@Autowired
	public SqlSessionTemplate mybatis;

	@Override
	public int commentCount() {
		return 0;
	}

	// 댓글 목록
	@Override
	public List<CommentDTO> commentList(int postId) {
		return mybatis.selectList("commentMapper.listReply",postId);
	}

	//댓글 입력
	@Override
	public int commentInsert(CommentDTO comment) {
		return mybatis.insert("commentMapper.cInsert",comment);
	}

	//댓글 수정
	@Override
	public void commentUpdate(CommentDTO comment) {
		mybatis.update("commentMapper.cUpdate",comment);
	}

	//댓글 삭제
	@Override
	public void commentDelete(int cId) {
		 mybatis.delete("commentMapper.cDelete",cId);
	}
	
	
}

