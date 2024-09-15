package com.foodybuddy.qna_manage.vo;

import java.sql.Timestamp;

public class Qna {
    private int qna_no;
    private int user_no;
    private String qna_title;
    private String qna_content;
    private String reg_date;
    private String qna_status;
    private String qna_answer;
    private String mod_time;
    private String complete_date;

    public Qna() {}

    public Qna(int qna_no, int user_no, String qna_title, String qna_content, String reg_date, String qna_status, String qna_answer, String mod_time, String complete_date) {
        this.qna_no = qna_no;
        this.user_no = user_no;
        this.qna_title = qna_title;
        this.qna_content = qna_content;
        this.reg_date = reg_date;
        this.qna_status = qna_status;
        this.qna_answer = qna_answer;
        this.mod_time = mod_time;
        this.complete_date = complete_date;
    }

    // Getters and Setters
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

    public String getreg_date() {
        return reg_date;
    }

    public void setreg_date(String reg_date) {
        this.reg_date = reg_date;
    }

    // Timestamp를 받아서 String으로 변환하여 설정하는 메서드
    public void setreg_date(Timestamp reg_date) {
        this.reg_date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(reg_date);
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

    public String getMod_time() {
        return mod_time;
    }

    public void setmod_time(String mod_time) {
        this.mod_time = mod_time;
    }

    
    public void setmod_time(Timestamp mod_time) {
        if (mod_time != null) {
            this.mod_time = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(mod_time);
        } else {
            this.mod_time = "없음"; 
        }
    }

    public String getComplete_date() {
        return complete_date;
    }

    public void setComplete_date(String complete_date) {
        this.complete_date = complete_date;
    }

    
    public void setComplete_date(Timestamp complete_date) {
        if (complete_date != null) {
            this.complete_date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(complete_date);
        } else {
            this.complete_date = "없음";  
        }
    }
}
