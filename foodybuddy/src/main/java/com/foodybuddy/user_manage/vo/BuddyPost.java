package com.foodybuddy.user_manage.vo;

import java.sql.Timestamp;

public class BuddyPost {
    private int buddy_no;
    private String buddy_title;
    private String buddy_main;
    private Timestamp reg_date;
    private int buddy_view;

    // Getter와 Setter 메서드들
    public int getBuddy_no() {
        return buddy_no;
    }

    public void setBuddy_no(int buddy_no) {
        this.buddy_no = buddy_no;
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

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }

    public int getBuddy_view() {
        return buddy_view;
    }

    public void setBuddy_view(int buddy_view) {
        this.buddy_view = buddy_view;
    }
}
