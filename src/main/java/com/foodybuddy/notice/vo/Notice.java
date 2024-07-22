package com.foodybuddy.notice.vo;


public class Notice {

  
    private int notice_no;
    private String notice_title;
    private String notice_content;
    private String notice_date;
	private int notice_view_count;

    // 기본 생성자
    public Notice() {}

    // 모든 필드를 포함한 생성자
    public Notice(int notice_no, String notice_title, String notice_content, String notice_date, int notice_view_count) {
        this.notice_no = notice_no;
        this.notice_title = notice_title;
        this.notice_content = notice_content;
        this.notice_date = notice_date;
        this.notice_view_count = notice_view_count;
    }

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_view_count() {
		return notice_view_count;
	}

	public void setNotice_view_count(int notice_view_count) {
		this.notice_view_count = notice_view_count;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + ", notice_view_count=" + notice_view_count + "]";
	}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}