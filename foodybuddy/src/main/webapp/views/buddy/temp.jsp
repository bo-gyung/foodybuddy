<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>BUDDY(같이가기)</title>
    <!-- BUDDY(같이가기) 글 열람 -->
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1330c1e595053f9256580cf7b68a8cf4&libraries=services"></script>
    
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../../resources/template/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../resources/template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../../resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../resources/template/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../resources/template/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Navbar Link -->
	<%@ include file="../include/navbar.jsp" %>
	
	<!-- Hero Start -->
	<div class="container-xxl py-5 bg-dark hero-header mb-5">
	    <div class="container text-center my-5 pt-5 pb-4">
	        <nav aria-label="breadcrumb">
	            <ol class="breadcrumb justify-content-center text-uppercase">
	                <li class="breadcrumb-item"><a href="/">Home</a></li>
	                <li class="breadcrumb-item"><a href="/board/foody">Foody</a></li>
	                <li class="breadcrumb-item"><a href="/board/buddy" style="color:white;">Buddy</a></li>
	            </ol>
	        </nav>
	    </div>
	</div>
	<!-- Hero End -->

	<!-- Contact Start --> 
	<%@page import="com.foodybuddy.buddy.vo.Buddy, java.util.*" %>
	<%@ page import="com.foodybuddy.foodyPic.vo.Foody_Pic" %>
	<% Map<String,Object> post = (Map<String,Object>)request.getAttribute("post"); %>
	
	

	<div class="container-xxl py-5">
	    <div class="container">
	        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
	            <h5 class="section-title ff-secondary text-center text-primary fw-normal">Buddy</h5>
	            <h1 class="mb-5"><%=post.get("글제목") %></h1>
	        </div>
	            <div class="col-12">
	                <div class="row gy-4" style="text-align : center">
		                <div class="col-md-4">
		                    <h5 class="section-title ff-secondary fw-normal text-start text-primary">가게이름</h5>
		                    <p><i class="fa fa-envelope-open text-primary me-2"></i><%=post.get("가게이름") %></p>
		                </div>
		                <div class="col-md-4">
		                    <h5 class="section-title ff-secondary fw-normal text-start text-primary">가게주소</h5>
		                    <p><i class="fa fa-envelope-open text-primary me-2"></i><%=post.get("가게주소") %></p>
		                </div>
		                <div class="col-md-4">
		                    <h5 class="section-title ff-secondary fw-normal text-start text-primary">주차여부</h5>
		                    <p><i class="fa fa-envelope-open text-primary me-2"></i><%=(post.get("주차여부") ==null) ? "정보없음" : post.get("주차여부") %></p>
	                    </div>
					</div>
				</div>
	        <div class="row g-4">
				<div style="display:flex; justify-content:center;">
					<div class="col-md-9">
					    <div class="wow fadeInUp" data-wow-delay="0.2s">
					        <form action="/board/buddy/edit" name="buddy_edit">
					            <div class="row g-3">
					            
								<!-- Testimonial Start -->
							        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
							            <div class="container">
							                <div class="owl-carousel testimonial-carousel">
							                    <%
									                    List<Foody_Pic> fPic = (List<Foody_Pic>) request.getAttribute("fp");
									                    if (fPic != null) {
									                        for (Foody_Pic fp : fPic) {
									                %>
							                    
							                    <div class="testimonial-item bg-transparent border rounded p-4">
							                        <div class="d-flex align-items-center">
							                            <img class="img-fluid flex-shrink-0" src="/upload/<%= fp.getPic_sub() %>" style="width: 300px; height: 200px;">
						                            </div>
							                    </div>
							                    <%
									                        }
									                    }
									                %>
							                    
							                </div>
							            </div>
							        </div>
							    	<!-- Testimonial End -->
						    	
				            		<div class="col-12">
                                        <div class="form-floating">
                                            <input type="hidden" id="foody_no" name="foody_no" value="<%=post.get("원본글번호")%>">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="hidden" id="buddy_no" name="buddy_no" value="<%=post.get("글번호")%>">
                                        </div>
                                    </div>
								<div class="col-6">
				    				<div class="form-floating pt-5">
				        				<div id="map" class="form-control" style="height:380px;"></div>
				        				<label for="subject">지도</label>
				    				</div>
				   				</div>
								<div class="col-6">
									<div>
                                        <div class="form-floating pt-5">
                                            <input type="text" class="form-control" id="user_name" name="user_name" 
                                            disabled="disabled" style="background: white;" value="<%=post.get("작성자") %>">
                                            <label for="user_name">작성자</label>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="form-floating pt-5">
                                            <input type="text" class="form-control" id="party_name" name="party_name" 
                                            disabled="disabled" style="background: white;" value="<%=post.get("모임이름") %>">
                                            <label for="party_name">모임이름</label>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="form-floating pt-5">
                                            <input type="text" class="form-control" id="meet_date" name="meet_date" 
                                            disabled="disabled" style="background: white;" value="<%=post.get("모임날짜") %>">
                                            <label for="meet_date">모임날짜</label>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="form-floating pt-5">
                                            <input type="text" class="form-control" id="party_number" name="party_number" 
                                            disabled="disabled" style="background: white;" value="<%=post.get("모임인원") %>">
                                            <label for="party_number">모임인원</label>
                                        </div>
                                    </div>
                            	</div>
                                   <div class="col-12">
                                       <div class="form-floating">
                                           <textarea class="form-control" id="buddy_main" name="buddy_main" disabled="disabled" 
                                           style="height: 500px; background: white;"><%=post.get("글내용") %></textarea>
                                           <label for="message">모집내용</label>
                                       </div>
                                   </div>
                                   <%@ page import="com.foodybuddy.user.vo.User" %>
							    <%
							    User u = (User)session.getAttribute("user");
                                   String write_no = (String)post.get("작성자번호");
								if(u.getUser_no() == Integer.parseInt(write_no)){%>
					            <!-- 작성자 메뉴(수정, 삭제, 모임결성) 시작 -->
					            <div class="row g-3" style="margin-left:12%;">
					            	<div class="col-3">
										<button class="btn btn-primary w-100 py-3" type="button" 
										onclick="editPost(<%=post.get("글번호")%>,<%=post.get("작성자번호")%>);">수정</button>
									</div>
									<div class="col-3">
										<button class="btn btn-primary w-100 py-3" type="button" 
										onclick="deletePost(<%=post.get("글번호")%>);">삭제</button>
									</div>
									<div class="col-3">
										<button class="btn btn-primary w-100 py-3" type="button" 
										onclick="createGroup(<%=post.get("글번호")%>)">모임 결성</button>
									</div>
					            </div>
					            <!-- 작성자 메뉴(수정, 삭제, 모임결성) 종료 -->
								<%} else {%>
								<div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="button" 
                                        onclick="foodyPost(<%=post.get("원본글번호")%>);">원본 글 보러가기</button>
                                    </div>
								<%} %>
								</div>
	                        </form>
	                    </div>
	                </div>
				</div>
	            </div>
	            <!-- 댓글영역 시작 -->
				<div class=" mt-5 row d-flex justify-content-center">
					<div class="col-md-8 col-lg-9">
						<p>COMMENT</p>
						<div class="card shadow-0 border" style="background-color: #f8f9fa;">
							<div id="result_div" class="card-body p-4">
					            <!-- 댓글창 링크 삽입 -->
								<%@ include file="/views/buddy/buddy_comment.jsp" %>
					            <!-- 댓글 입력창 시작 -->
									<div data-mdb-input-init class="card-body">
							            <form action="/insertBuddyComment" method="post" id="insert_comment_form">
												<input type="hidden" id="buddy_no" name="buddy_no" value="<%=post.get("글번호")%>">
												<a id="user_name" name="user_name"><%= u.getUser_name() %></a>
												<textarea id="comment_main" name="comment_main" class="form-control" placeholder="댓글을 입력하세요." ></textarea>
												<a class="form-label btn btn-primary m-2" href="#" onclick="submit_btn();">작성</a>
										</form>
									</div>
								<!-- 댓글 입력창 종료 -->
					      </div>
					    </div>
					  </div>
					</div>
	            	<!-- 댓글영역 종료 -->
	       </div>
	   </div>
	   <!-- Contact End -->
	
	
	<!-- 푸터 외부링크 -->
	<%@ include file="../include/footer.jsp" %>


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
	<!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../resources/template/lib/wow/wow.min.js"></script>
    <script src="../../resources/template/lib/easing/easing.min.js"></script>
    <script src="../../resources/template/lib/waypoints/waypoints.min.js"></script>
    <script src="../../resources/template/lib/counterup/counterup.min.js"></script>
    <script src="../../resources/template/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../../resources/template/lib/tempusdominus/js/moment.min.js"></script>
    <script src="../../resources/template/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="../../resources/template/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="../../resources/template/js/main.js"></script>
    
    
  	<!-- 지도 API 스크립트 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae96fe5b21048be0c855431d0416eea1"></script>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표. 지도를 생성하는데 반드시 필요
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// center 에 할당할 값은 LatLng 클래스를 사용하여 생성합니다. 
		// 흔히 위경도 좌표라고 부르는 WGS84 좌표계의 좌표값을 넣어서 만드는데요, 
		// 생성인자는 위도(latitude), 경도(longitude) 순으로 넣어주세요.

	</script>

	<script type="text/javascript">
		
		// 수정하기
		function editPost(buddy_no, user_no){
			window.location.href = '/board/buddy/edit?buddy_no='+buddy_no+'&user_no='+user_no;
		}
		
		// 삭제하기
		function deletePost(buddy_no){
			const result = confirm("정말 삭제하시겠습니까?");
			if(result){
			window.location.href = '/board/buddy/delete?buddy_no='+buddy_no;
			}
		}
		
		// 그룹만들기 창 띄우기
		function createGroup(buddy_no){
		    // 새창 띄우기
			const partyNumber = document.getElementById('party_number').value;
		    console.log(partyNumber);
		    const newWindow = window.open("/views/buddy/groupSelect.jsp?party_number="+partyNumber+"", "_blank", "width=800,height=600");
		}
		
		// 원본글 보러가기
		function foodyPost(foody_no){
			window.location.href = '/foody/view?foody_no='+foody_no;
        }
		
		// 댓글 작성
  
        function submit_btn(){
        	 event.preventDefault();
        	 const form = document.getElementById('insert_comment_form');
        	 form.submit();
		}

		
    </script>
    
</body>

</html>