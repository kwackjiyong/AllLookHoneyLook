package com.alhl.hz.dao;

import java.util.List;

import com.alhl.hz.dto.QuestionDTO;
import com.alhl.hz.dto.UserDTO;

// [DB연결 사용법] 2. Dao인터페이스 생성
public interface IQuestionDao {
	public List<QuestionDTO> question_info_ALL();
	public List<QuestionDTO> question_info_user(UserDTO dto);
	public QuestionDTO question_info_one(QuestionDTO dto);
	public int question_insert_user(QuestionDTO dto);
	public int question_update_Answer(QuestionDTO dto);
	public int question_delete_request(QuestionDTO dto);
}
