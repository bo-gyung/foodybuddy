package com.foodybuddy.message.vo;

import java.time.LocalDateTime;

public class Message {
	
	private int message_id;
	private String sender_id;
	private String receiver_id;
	private String message_title;
	private String message_text;
	private LocalDateTime sent_at;
	private boolean is_deleted;
	
	public Message() {
		super();
	}

	public Message(int message_id, String sender_id, String receiver_id, String message_title, String message_text,
			LocalDateTime sent_at, boolean is_deleted) {
		super();
		this.message_id = message_id;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.message_title = message_title;
		this.message_text = message_text;
		this.sent_at = sent_at;
		this.is_deleted = is_deleted;
	}

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_text() {
		return message_text;
	}

	public void setMessage_text(String message_text) {
		this.message_text = message_text;
	}

	public LocalDateTime getSent_at() {
		return sent_at;
	}

	public void setSent_at(LocalDateTime sent_at) {
		this.sent_at = sent_at;
	}

	public boolean isIs_deleted() {
		return is_deleted;
	}

	public void setIs_deleted(boolean is_deleted) {
		this.is_deleted = is_deleted;
	}

	@Override
	public String toString() {
		return "Message [message_id=" + message_id + ", sender_id=" + sender_id + ", receiver_id=" + receiver_id
				+ ", message_title=" + message_title + ", message_text=" + message_text + ", sent_at=" + sent_at
				+ ", is_deleted=" + is_deleted + "]";
	}

	
	
	
}
