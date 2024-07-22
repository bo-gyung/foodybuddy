package com.foodybuddy.user.vo;

import java.time.LocalDateTime;

public class User {
	
	private int user_no;
    private int grade_no;
    private String user_id;
    private String user_pw;
    private String user_name; 
    private String user_phone; 
    private String user_postcode;
    private String user_addr;
    private String user_detailAddr;
    private String user_extraAddr;
    private String user_email; 
    private String user_question;
    private String user_answer;
    private int user_warn;
    private LocalDateTime reg_date;
    
	public User() {
		super();
	}

	public User(int user_no, int grade_no, String user_id, String user_pw, String user_name, String user_phone,
			String user_postcode, String user_addr, String user_detailAddr, String user_extraAddr, String user_email,
			String user_question, String user_answer, int user_warn, LocalDateTime reg_date) {
		super();
		this.user_no = user_no;
		this.grade_no = grade_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_postcode = user_postcode;
		this.user_addr = user_addr;
		this.user_detailAddr = user_detailAddr;
		this.user_extraAddr = user_extraAddr;
		this.user_email = user_email;
		this.user_question = user_question;
		this.user_answer = user_answer;
		this.user_warn = user_warn;
		this.reg_date = reg_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getGrade_no() {
		return grade_no;
	}

	public void setGrade_no(int grade_no) {
		this.grade_no = grade_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_postcode() {
		return user_postcode;
	}

	public void setUser_postcode(String user_postcode) {
		this.user_postcode = user_postcode;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_detailAddr() {
		return user_detailAddr;
	}

	public void setUser_detailAddr(String user_detailAddr) {
		this.user_detailAddr = user_detailAddr;
	}

	public String getUser_extraAddr() {
		return user_extraAddr;
	}

	public void setUser_extraAddr(String user_extraAddr) {
		this.user_extraAddr = user_extraAddr;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_question() {
		return user_question;
	}

	public void setUser_question(String user_question) {
		this.user_question = user_question;
	}

	public String getUser_answer() {
		return user_answer;
	}

	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
	}

	public int getUser_warn() {
		return user_warn;
	}

	public void setUser_warn(int user_warn) {
		this.user_warn = user_warn;
	}

	public LocalDateTime getReg_date() {
		return reg_date;
	}

	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", grade_no=" + grade_no + ", user_id=" + user_id + ", user_pw=" + user_pw
				+ ", user_name=" + user_name + ", user_phone=" + user_phone + ", user_postcode=" + user_postcode
				+ ", user_addr=" + user_addr + ", user_detailAddr=" + user_detailAddr + ", user_extraAddr="
				+ user_extraAddr + ", user_email=" + user_email + ", user_question=" + user_question + ", user_answer="
				+ user_answer + ", user_warn=" + user_warn + ", reg_date=" + reg_date + "]";
	}
	
	

}