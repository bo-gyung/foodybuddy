package com.foodybuddy.common;

public class Paging {
	// 전체 게시글 갯수
		private int totalData;
		
		// 전체 페이지 갯수
		private int totalPage;
		
		// 페이징바 구성요소 --> 밑에오는 1, 2, 3, 4, 5 바꿀수있도록 설정해준다.
		private int pageBarSize = 3; // 일단은 3로 고정해준다, 추후 수정가능
		
		// 페이징바 페이지 시작, 끝 담을수 잇는 필드 생성
		private int pageBarStart;
		private int pageBarEnd;
		
		//현재 페이지 (지금페이지) 기준이 되는 애
		private int nowPage = 1; //목록 진입하면 무조건 1로 진입하기때문에
		
		//목록에 보여질 게시글 갯수를 설정 ex 1~10번페이지 --> 따로변수로 빼준다 일단은,추후 변경가능
		private int numPerPage = 5;
		
		// 쿼리에 사용할 LIMIT 값 
		private int limitPageNo;
		
		// 이전, 다음 여부 
		// 일단은 시작은하고, 없으면 끝을내는 방향으로 갈거야
		private boolean prev = true; 
		private boolean next = true;
		
		public int getTotalData() {
			return totalData;
		}
		public void setTotalData(int totalData) {
			this.totalData = totalData;
			calcPaging();
		}
		public int getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}
		public int getPageBarSize() {
			return pageBarSize;
		}
		public void setPageBarSize(int pageBarSize) {
			this.pageBarSize = pageBarSize;
		}
		public int getPageBarStart() {
			return pageBarStart;
		}
		public void setPageBarStart(int pageBarStart) {
			this.pageBarStart = pageBarStart;
		}
		public int getPageBarEnd() {
			return pageBarEnd;
		}
		public void setPageBarEnd(int pageBarEnd) {
			this.pageBarEnd = pageBarEnd;
		}
		public int getNowPage() {
			return nowPage;
		}
		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
		}
		public int getNumPerPage() {
			return numPerPage;
		}
		public void setNumPerPage(int numPerPage) {
			this.numPerPage = numPerPage;
		}
		public int getLimitPageNo() {
			return limitPageNo;
		}
		public void setLimitPageNo(int limitPageNo) {
			this.limitPageNo = limitPageNo;
		}
		public boolean isPrev() {
			return prev;
		}
		public void setPrev(boolean prev) {
			this.prev = prev;
		}
		public boolean isNext() {
			return next;
		}
		public void setNext(boolean next) {
			this.next = next;
		}
		
		// 전체 게시글 갯수를 set 해줬을때 동작할 메소드를 만들어준다.
		private void calcPaging() {
			// 내가 우리 쿼리에서 데이터를 조회할때 사용할 limit 페이지no를 설정해준다.
			// 내가 만약 2번페이지를 보고싶으면 -> 10,10 (앞 10, 뒤10중 바뀌지않는건 뒤10)
			// 3번페이지(21~30) -> 20,10
			limitPageNo = (nowPage-1)*numPerPage;
			// 전체 페이지 갯수를 조회해야한다.(26 -> 26은 3개의 페이지)
			totalPage = (int)Math.ceil((double)totalData/numPerPage); // 26/10 ->몫 2 나머지는 6
			// 소수점으로 나와서 2.6이나온다. ==> 그러면 앞에 Math.ceil 붙여서 3으로 올린다음 int 타입으로 변환
			
			// 현재 : 3번페이지 -> 페이지바 시작은 1번이다.
			// 현재 : 8번페이지 -> 페이지바 시작은 6번이다.
			// 시작페이지 계산법
			pageBarStart = ((nowPage-1)/pageBarSize)*pageBarSize+1; // (3-1)/5 * 5+1 ==> 이러면 3
			// 끝페이지 계산법
			pageBarEnd = pageBarStart + pageBarSize -1;
			// 만약에 끝페이지가 전체페이지 갯수보다 크다면 페이지를 끝낼게(몇번 보여줄거냐)
			if(pageBarEnd > totalPage) pageBarEnd = totalPage; 
			
			// 이전, 다음 
			// 무조건 페이지바1이아니면 다 생긴다.
			if(pageBarStart == 1) prev = false; // 만약에 페이지가1이라면 이전은 없다.
			if(pageBarEnd >= totalPage) next = false; //만약에 토탈페이지가 끝페이지보다 작으면 다음은 없다.
			
			
			
			
		}

}
