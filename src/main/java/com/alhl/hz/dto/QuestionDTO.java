package com.alhl.hz.dto;
//문의 테이블 dto
public class QuestionDTO {
	private static int queId;
	private static String userId;
	private static String queTitle;
	private static String queContents;
	private static java.sql.Timestamp queTime;
	private static String queAnswer;
	public static int getQueId() {
		return queId;
	}
	public static void setQueId(int queId) {
		QuestionDTO.queId = queId;
	}
	public static String getUserId() {
		return userId;
	}
	public static void setUserId(String userId) {
		QuestionDTO.userId = userId;
	}
	public static String getQueTitle() {
		return queTitle;
	}
	public static void setQueTitle(String queTitle) {
		QuestionDTO.queTitle = queTitle;
	}
	public static String getQueContents() {
		return queContents;
	}
	public static void setQueContents(String queContents) {
		QuestionDTO.queContents = queContents;
	}
	public static java.sql.Timestamp getQueTime() {
		return queTime;
	}
	public static void setQueTime(java.sql.Timestamp queTime) {
		QuestionDTO.queTime = queTime;
	}
	public static String getQueAnswer() {
		return queAnswer;
	}
	public static void setQueAnswer(String queAnswer) {
		QuestionDTO.queAnswer = queAnswer;
	}
	
	
}
