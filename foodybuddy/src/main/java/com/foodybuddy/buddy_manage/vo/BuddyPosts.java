package com.foodybuddy.buddy_manage.vo;

import java.sql.Timestamp;

public class BuddyPosts {
    private int buddy_no;
    private int user_no;
    private String user_name;
    private String buddy_title;
    private String buddy_main;
    private int buddy_view;
    private Timestamp reg_date;
    private String buddy_approve;

    // Getters and setters
    public int getBuddy_no() {
        return buddy_no;
    }

    public void setBuddy_no(int buddy_no) {
        this.buddy_no = buddy_no;
    }

    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getBuddy_title() {
        return buddy_title;
    }

    public void setBuddy_title(String buddy_title) {
        this.buddy_title = buddy_title;
    }

    public String getBuddy_main() {
        return buddy_main;
    }

    public void setBuddy_main(String buddy_main) {
        this.buddy_main = buddy_main;
    }

    public int getBuddy_view() {
        return buddy_view;
    }

    public void setBuddy_view(int buddy_view) {
        this.buddy_view = buddy_view;
    }

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }

    public String getBuddy_approve() {
        return buddy_approve;
    }

    public void setBuddy_approve(String buddy_approve) {
        this.buddy_approve = buddy_approve;
    }

    @Override
    public String toString() {
        return "BuddyPosts [buddy_no=" + buddy_no + ", user_no=" + user_no + ", user_name=" + user_name
                + ", buddy_title=" + buddy_title + ", buddy_main=" + buddy_main + ", buddy_view=" + buddy_view
                + ", reg_date=" + reg_date + ", buddy_approve=" + buddy_approve + "]";
    }
}
