package com.alhl.hz.dao;

import java.sql.Timestamp;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alhl.hz.dto.QuestionDTO;
import com.alhl.hz.dto.UserDTO;
@Repository
public class QuestionDao implements IQuestionDao {

	@Autowired
	public SqlSessionTemplate mybatis;
	@Override
	public List<QuestionDTO> question_info_ALL() {
		return mybatis.selectList("queMapper.question_info_ALL");
	}
	@Override
	public List<QuestionDTO> question_info_user(UserDTO dto) {
		return mybatis.selectList("queMapper.question_info_user", dto);
	}
	@Override
	public QuestionDTO question_info_one(QuestionDTO dto) {
		return mybatis.selectOne("queMapper.question_info_one", dto);
	}
	@Override
	public int question_insert_user(QuestionDTO dto) {
		dto.setQueContents(dto.getQueContents().replaceAll("\r\n", "<br>"));
		dto.setQueTime(new java.sql.Timestamp(new java.util.Date().getTime()));//현재시간담기
		return mybatis.insert("queMapper.question_insert_user", dto);
	}
	@Override
	public int question_update_Answer(QuestionDTO dto) {
		dto.setQueAnswer(dto.getQueAnswer().replaceAll("\r\n", "<br>"));
		return mybatis.update("queMapper.question_update_Answer",dto);
	}
	@Override
	public int question_delete_request(QuestionDTO dto) {
		return mybatis.delete("queMapper.question_delete_request", dto);
	}
	
	
}
