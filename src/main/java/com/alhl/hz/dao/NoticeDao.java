package com.alhl.hz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alhl.hz.dto.NoticeDTO;
@Repository
public class NoticeDao implements INoticeDao {

	@Autowired
	public SqlSessionTemplate mybatis;
	
	@Override
	public List<NoticeDTO> noticeALLSelect(){
		return mybatis.selectList("noticeMapper.SelectAll");
	}

	@Override
	public NoticeDTO read(int postId){
		return mybatis.selectOne("noticeMapper.noticeSelectOne",postId);
	}

	@Override
	public void create(NoticeDTO dto){
		dto.setCreatTime(new java.sql.Timestamp(new java.util.Date().getTime()));
		mybatis.update("noticeMapper.noticeCreate",dto);
	}

	@Override
	public void update(NoticeDTO dto){
		mybatis.update("noticeMapper.noticeUpdate",dto);
	}

	@Override
	public void delete(int postId){
		mybatis.update("noticeMapper.noticeDelete",postId);
	}

	@Override
	public void increaseViewcnt(int postId){

		mybatis.update("noticeMapper.increaseViewcnt",postId);
	}



}
