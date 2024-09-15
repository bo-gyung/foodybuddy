package com.foodybuddy.buddy.vo;

import java.time.LocalDateTime;

public class PartyMember {
	int member_no;
	int buddy_no;
	private LocalDateTime meet_date;
	
	public PartyMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PartyMember(int member_no, int buddy_no, LocalDateTime meet_date) {
		super();
		this.member_no = member_no;
		this.buddy_no = buddy_no;
		this.meet_date = meet_date;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getBuddy_no() {
		return buddy_no;
	}

	public void setBuddy_no(int buddy_no) {
		this.buddy_no = buddy_no;
	}

	public LocalDateTime getMeet_date() {
		return meet_date;
	}

	public void setMeet_date(LocalDateTime meet_date) {
		this.meet_date = meet_date;
	}

	@Override
	public String toString() {
		return "PartyMember [member_no=" + member_no + ", buddy_no=" + buddy_no + ", meet_date=" + meet_date + "]";
	}
	
	
	
	
	
	
}
