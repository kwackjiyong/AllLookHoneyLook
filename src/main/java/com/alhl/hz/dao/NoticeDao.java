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
	public List<NoticeDTO> noticeSelectAll() {
		// TODO Auto-generated method stub
		return mybatis.selectList("noticeMapper.noticeSelectAll");
	}

}
