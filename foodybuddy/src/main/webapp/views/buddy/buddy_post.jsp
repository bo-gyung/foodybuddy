<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		                    <p id="foody_name"><i class="fa fa-envelope-open text-primary me-2"></i><%=post.get("가게이름") %></p>
		                </div>
		                <div class="col-md-4">
		                    <h5 class="section-title ff-secondary fw-normal text-start text-primary">가게주소</h5>
		                    <p id="foody_address"><i class="fa fa-envelope-open text-primary me-2"></i><%=post.get("가게주소") %></p>
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
							    	
							    	<!-- 글번호 히든으로 남겨두기 시작 -->
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
                                    <!-- 글번호 히든으로 남겨두기 끝 -->
                                    
                                    <!-- 필수 입력 정보 시작 -->
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
                                    <!-- 필수 입력 정보 끝 -->
                                    
                                    <!-- 본문 입력 시작 -->
                                    <div class="col-12">
                                       <div class="form-floating">
                                           <textarea class="form-control" id="buddy_main" name="buddy_main" disabled="disabled" 
                                           style="height: 500px; background: white;"><%=post.get("글내용") %></textarea>
                                           <label for="message">모집내용</label>
                                       </div>
                                    </div>
                                    <!-- 본문 입력 끝 -->
                                    
						            <!-- 작성자 메뉴(수정, 삭제, 모임결성) / 원본글 보러가기 버튼 시작 -->
                                    <%@ page import="com.foodybuddy.user.vo.User" %>
								    <%
								    User u = (User)session.getAttribute("user");
	                                   String write_no = (String)post.get("작성자번호");
									if(u.getUser_no() == Integer.parseInt(write_no)){%>
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
									<%} else {%>
									<div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="button" 
                                        onclick="foodyPost(<%=post.get("원본글번호")%>);">원본 글 보러가기</button>
                                    </div>
									<%} %>
						            <!-- 작성자 메뉴(수정, 삭제, 모임결성) / 원본글 보러가기 버튼 종료 -->
						            <!-- 댓글창 시작 -->
									<div class="comment_list" id="comment_place">
										<c:choose>
											<c:when test="${empty c_list }">
												<div class="card mb-4">
														<div class="card-body">
															<p>작성된 댓글이 없습니다.</p>
														</div>
													</div>
											</c:when>
											<c:otherwise>
												<c:forEach items="${c_list }" var="c" varStatus="status">
													<div class="card mb-4">
														<div class="card-body">
															<p>${c.comment_main }</p>
															<div class="d-flex justify-content-between">
																<div class="d-flex flex-row align-items-center">
																	<p class="small mb-0 ms-2">${c.user_name }</p>
																</div>
																<div class="d-flex flex-row align-items-center">
																	<p class="small text-muted mb-0">${c.reg_date }</p>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>
						            <!-- 댓글창 종료 -->
						            <!-- 댓글 입력창 시작 -->
									<div data-mdb-input-init class="card-body">
										<a id="user_name" name="user_name"><%= u.getUser_name() %></a>
										<input type="hidden" id="user_no" name="user_no" value="<%= u.getUser_no() %>">
										<textarea id="comment_main" name="comment_main" class="form-control" placeholder="댓글을 입력하세요." ></textarea>
										<button class="btn btn-primary m-2" type="button" onclick="addComment();">댓글 작성</button>
									</div>
									<!-- 댓글 입력창 종료 -->
						    	</div>
					    	</form>
				    	</div>
			    	</div>
		    	</div>
			</div>
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
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
	
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표. 지도를 생성하는데 반드시 필요
			level: 1 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// center 에 할당할 값은 LatLng 클래스를 사용하여 생성합니다. 
		// 흔히 위경도 좌표라고 부르는 WGS84 좌표계의 좌표값을 넣어서 만드는데요, 
		// 생성인자는 위도(latitude), 경도(longitude) 순으로 넣어주세요.
		
		const fName = document.getElementById("foody_name").innerText;
		const fAddr = document.getElementById("foody_address").innerText;
		console.log(fName+" : "+fAddr);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(fAddr, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+fName+'</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    

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
        const addComment = function(){
			const buddyNo = document.getElementById('buddy_no').value;
			const userNo = document.getElementById('user_no').value;
			const commentMain = document.getElementById('comment_main').value;
			// console.log(buddyNo+" : "+userNo+" : "+commentMain);
			
			const xhr = new XMLHttpRequest();
			xhr.open("post","/insertBuddyComment",true);
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					// 제이슨 데이터 성공적으로 받아 왔을 시 수행할 동작
					const jsonList = JSON.parse(xhr.responseText);
					const commentPlace = document.getElementById('comment_place');
					commentPlace.innerHTML = ''; // 기존 댓글 리스트를 비움
					document.getElementById('comment_main').value = ''; // 댓글창 비움
					
					if(jsonList == null || jsonList.length === 0){
						// 댓글 없는 상태
						
						// 1. p태그 : 요소 노드 생성
			            const pTag = document.createElement('p');
			         	// 1. p태그 : 텍스트 노드 생성
			            const pText = document.createTextNode('작성된 댓글이 없습니다.');
			            // 1. p태그 : 요소 노드에 텍스 노드 자손으로 추가
			            pTag.appendChild(pText);
						
						// 2. div태그 card-body : 요소 노드 생성
			            const bodyDivTag = document.createElement('div');
						// 2. div태그 card-body : 요소에 클래스 부여
						bodyDivTag.setAttribute('class','card-body');
					
						// 2에 1추가
						bodyDivTag.appendChild(pTag);
			            
						// 3. div태그 card : 요소 노드 생성
			            const cardDivTag = document.createElement('div');
						// 3. div태그 card : 요소에 클래스 부여
						cardDivTag.setAttribute('class','card mb-4');
						
						// 3에 2추가
						cardDivTag.appendChild(bodyDivTag);
			            
			            // 4. 부모 객체에 완성된 요소 노드 추가
			            document.getElementById('comment_place').appendChild(cardDivTag);
			            
					} else{
						// 댓글 있는 상태
						jsonList.forEach(function(jl){
							// 1-1. p태그 : 요소 노드 생성 (댓글 내용)
				            const mainPTag = document.createElement('p');
				         	// 1-1. p태그 : 텍스트 노드 생성
				            const mainPText = document.createTextNode(jl.comment_main);
				            // 1-1. p태그 : 요소 노드에 텍스 노드 자손으로 추가
				            mainPTag.appendChild(mainPText);
						
							// 1-2작성자와 작성일 요소 노드
							// 1-2-(1) p태그 : 작성자
							const namePTag = document.createElement('p');
							namePTag.setAttribute('class','small mb-0 ms-2');
				            const namePText = document.createTextNode(jl.user_name);
				            namePTag.appendChild(namePText);
							// 1-2-(1). div : 작성자 부모 div 
							const nameDivTag = document.createElement('div');
							nameDivTag.setAttribute('class','d-flex flex-row align-items-center');
							nameDivTag.appendChild(namePTag);
							
							// 1-2-(2) : 작성일
							const datePTag = document.createElement('p');
							datePTag.setAttribute('class','small text-muted mb-0');
				            const datePText = document.createTextNode(jl.reg_date);
				            datePTag.appendChild(datePText);
							// 1-2-(2). div : 작성일의 부모 div 
							const dateDivTag = document.createElement('div');
							dateDivTag.setAttribute('class','d-flex flex-row align-items-center');
							dateDivTag.appendChild(datePTag);
							
							// 1-2-(3)에 (2),(3) 자손 추가 div 
							const cardPartDivTag = document.createElement('div');
							cardPartDivTag.setAttribute('class','d-flex justify-content-between');
							cardPartDivTag.appendChild(nameDivTag);
							cardPartDivTag.appendChild(dateDivTag);
							
							// 2. div태그 card-body : 요소 노드 생성
				            const bodyDivTag = document.createElement('div');
							// 2. div태그 card-body : 요소에 클래스 부여
							bodyDivTag.setAttribute('class','card-body');
						
							// 2에 1추가
							bodyDivTag.appendChild(mainPTag);
							bodyDivTag.appendChild(cardPartDivTag);
				            
							// 3. div태그 card : 요소 노드 생성
				            const cardDivTag = document.createElement('div');
							// 3. div태그 card : 요소에 클래스 부여
							cardDivTag.setAttribute('class','card mb-4');
							
							// 3에 2추가
							cardDivTag.appendChild(bodyDivTag);
				            
				            // 4. 부모 객체에 완성된 요소 노드 추가
				            document.getElementById('comment_place').appendChild(cardDivTag);
						});
					}
				}
			}
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
			xhr.send(
				"buddy_no="+buddyNo+
				"&user_no="+userNo+
				"&comment_main="+commentMain
			);
			
		}

		
    </script>
    
</body>

</html>