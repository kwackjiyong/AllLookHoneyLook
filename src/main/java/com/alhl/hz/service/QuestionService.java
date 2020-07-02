package com.alhl.hz.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alhl.hz.dao.IQuestionDao;
import com.alhl.hz.dto.QuestionDTO;
import com.alhl.hz.dto.UserDTO;

@Service("IQuestionService")
public class QuestionService implements IQuestionService{
	
	@Autowired
	public IQuestionDao dao;
	@Override
	public List<QuestionDTO> question_info_ALL() {
		return dao.question_info_ALL();
	}
	@Override
	public List<QuestionDTO> question_info_user(UserDTO dto) {
		return dao.question_info_user(dto);
	}
	@Override
	public QuestionDTO question_info_one(QuestionDTO dto) {
		return dao.question_info_one(dto);
	}
	
	@Override
	public int question_insert_user(QuestionDTO dto) {
		return dao.question_insert_user(dto);
	}
	@Override
	public int question_update_Answer(QuestionDTO dto) {
		return dao.question_update_Answer(dto);
	}
	@Override
	public int question_delete_request(QuestionDTO dto) {
		return dao.question_delete_request(dto);
	}
	
}
