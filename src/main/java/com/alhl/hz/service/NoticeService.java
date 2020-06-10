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
		//title = title.replace(" ", "&nbsp;&nbsp;");
	
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
	public void increaseViewcnt(int postId, HttpSession session){

		long update_time = 0;
		
		//세션에 저장된 조회시간 검색
		//최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행 x
		
		if(session.getAttribute("update_time_"+postId) !=null){
			update_time = (Long) session.getAttribute("update_time_"+postId);
		}
		
		//시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		
		//일정시간 경과 후 조회수 증가처리 (24*60*60*1000(24시간)
		//시스템 현재시간 - 열람시간 > 일정시간 (조회수 증가가 가능하도록 지정한 시간)
		
		if(current_time - update_time > 5*1000) {
			dao.increaseViewcnt(postId);
			//세션에 시간을 저장 :"update_time_"+postId 는 다른 변수와 중복되지 않게 명명한 것
			session.setAttribute("update_time_"+postId, current_time);
		}
	}
	
	
	
}
