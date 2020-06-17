package com.alhl.hz.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alhl.hz.dao.INoticeDao;
import com.alhl.hz.dto.NoticeDTO;

@Service("INoticeService")
public class NoticeService implements INoticeService{
	
	@Autowired
	public INoticeDao dao;

	//게시글 전체조회
	@Override
	public List<NoticeDTO> noticeALLSelect(){

		return dao.noticeALLSelect();
	}
	
	//게시글 상세보기
	@Override
	public NoticeDTO read(int postId) {
		return dao.read(postId);
	}
	
	//게시글 작성
	@Override
	public void create(NoticeDTO dto)  {
		
		String title = dto.getTitle();
		String contents = dto.getContents();
		
		//공백문자 처리
		title = title.replace(" ",    "&nbsp;&nbsp;");
		
		//줄바꿈 문자처리
		contents = contents.replace("\n", "<br>");
		
		dto.setTitle(title);
		dto.setContents(contents);
		
		dao.create(dto);
	}
	
	//게시글 수정
	@Override
	public void update(NoticeDTO dto)  {
		dao.update(dto);
	}

	@Override
	public void delete(int postId) {
		dao.delete(postId);
	}

	@Override
	public void increaseViewcnt(int postId){
		dao.increaseViewcnt(postId);
	}
	
	
	
}
