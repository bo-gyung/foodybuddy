package com.foodybuddy.userpage.vo;

import java.time.LocalDateTime;

import com.foodybuddy.common.Paging;

public class QnA extends Paging{
	private int qna_no;
	private int user_no;
	private String qna_title;
	private String qna_content;
	private LocalDateTime reg_date;
	private String qna_status;
	private String qna_answer;
	private LocalDateTime mod_date;
	public QnA() {
		super();
		
	}
	public QnA(int qna_no, int user_no, String qna_title, String qna_content, LocalDateTime reg_date, String qna_status,
			String qna_answer, LocalDateTime mod_date) {
		super();
		this.qna_no = qna_no;
		this.user_no = user_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.reg_date = reg_date;
		this.qna_status = qna_status;
		this.qna_answer = qna_answer;
		this.mod_date = mod_date;
		
		
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public LocalDateTime getReg_date() {
		return reg_date;
	}
	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}
	public String getQna_status() {
		return qna_status;
	}
	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	public LocalDateTime getMod_date() {
		return mod_date;
	}
	public void setMod_date(LocalDateTime mod_date) {
		this.mod_date = mod_date;
	}
	
	
	

}
