package com.alhl.hz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alhl.hz.dto.NoticeDTO;

@Service("INoticeService")
public class NoticeService implements INoticeService{
	
	@Autowired
	public INoticeService dao;

	@Override
	public List<NoticeDTO> noticeALLSelect() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
