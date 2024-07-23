<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page-내 정보 조회/변경</title>
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">MyPage</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item" ><a href="/user/update"style="color:white;">내 정보 조회/변경</a></li>
                    <li class="breadcrumb-item"><a href="/user/pageList?menu=user_create_views">내 작성글 조회</a></li>
                    <li class="breadcrumb-item"><a href="/user/pageList?menu=user_like_views">내 좋아요 조회</a></li>
                    <li class="breadcrumb-item"><a href="/user/pageList?menu=user_group_views">내 모임 조회</a></li>
                    <li class="breadcrumb-item"><a href="/qna/list">Q&A</a></li>
                </ol>
            </nav>
        </div>
    </div>
	<!-- Hero End -->
        <!-- Menu Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">FoodyBuddy</h5>
                    <h1 class="mb-5">내 정보 조회 / 변경</h1>
                </div>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                                <div class="ps-3">
                                    <h6 class="mt-n1 mb-0">내 정보 조회</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                                <div class="ps-3">
                                    <h6 class="mt-n1 mb-0">비밀번호 변경</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-4">
                                <div class="ps-3">
                                    <h6 class="mt-n1 mb-0">회원 탈퇴</h6>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                    	<!-- 내정보 조회 -->
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="container-xxl py-5 px-0 fade show p-1">
						            <div class="row g-0" >
						                <div class="col-md-6 d-flex align-items-center" style="margin: auto;">
						                    <div class="p-5 fade show p-1">
						                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">FOODYBUDDY</h5>
						                        <h3 class="mb-4">내 정보 조회</h3>
						                        <%@page import="java.util.*" %>
												<%
													Map<String,Object> info = (Map<String,Object>)request.getAttribute("userInfo");
													System.out.println("info값 넘어왔니"+info);
												%>
												
						                        <!-- 내 정보 폼 -->
						                        <form action='/user/info' name="info_form" method="post" id = "info_form">
						                            <div class="row g-3" style="margin-left:20%">
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_id" name="user_id" 
						                                        disabled="disabled" value="<%=info.get("아이디") %>">
						                                        <label for="user_id">아이디</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-4">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_grade" name="user_grade" 
						                                        disabled="disabled" value="<%=info.get("회원등급") %>">
						                                        <label for="user_grade">회원등급</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-4">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_warn" name="user_warn" 
						                                        disabled="disabled" value="<%=info.get("경고횟수") %>">
						                                        <label for="user_warn">경고횟수</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_name" name="user_name" 
						                                        disabled="disabled" value="<%=info.get("닉네임") %>">
						                                        <label for="user_name">닉네임</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_phone" name="user_phone" 
						                                        disabled="disabled" value="<%=info.get("전화번호") %>">
						                                        <label for="user_phone">전화번호</label>
						                                    </div>
						                                </div>
						                                
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_addr" name="user_addr" 
						                                        disabled="disabled" value="<%=info.get("기본주소") %>">
						                                        <label for="user_addr">주소</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_d_addr" name="user_d_addr" 
						                                        disabled="disabled"  value="<%=info.get("상세주소") %>">
						                                        <label for="user_d_addr">상세 주소</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-4">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_e_addr" name="user_e_addr" 
						                                        disabled="disabled" value="<%=info.get("참고항목") %>">
						                                        <label for="user_e_addr">참고항목</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-4">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_postcode" name="user_postcode" 
						                                        disabled="disabled" value="<%=info.get("우편번호") %>">
						                                        <label for="user_postcode">우편번호</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_email" name="user_email" 
						                                        disabled="disabled" value="<%=info.get("이메일") %>">
						                                        <label for="user_email">이메일</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_question" name="user_question" 
						                                        disabled="disabled" value="<%=info.get("질문") %>">
						                                        <label for="user_question">아이디 찾기 질문</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_answer" name="user_answer" 
						                                        disabled="disabled" value="<%=info.get("답변") %>">
						                                        <label for="user_answer">답변</label>
						                                    </div>
						                                </div>
						                                <div class="col-9">
						                                    <button class="btn btn-primary w-100 py-3" type="button" onclick="updateBtn();">내 정보 변경</button>
						                                </div>
						                            </div>
						                        </form>
						                        <!-- 내 정보 폼 종료 -->
						                    </div>
						                </div>
						            </div>
						        </div>
                            </div>
                        </div>
                        <!-- 내정보 변경 -->
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="container-xxl py-5 px-0 fade show p-1">
						            <div class="row g-0" >
						                <div class="col-md-6 bg-dark d-flex align-items-center" style="margin: auto;">
						                    <div class="p-5 fade show p-1">
						                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">FOODYBUDDY</h5>
						                        <h3 class="text-white mb-4">내 정보 변경</h3>
						                        <!-- 비밀번호 입력 폼 -->
						                        <form action='/user/edit' name="edit_form" method="post">
						                            <div class="row g-3" style="margin-left:20%">
						                                <div class="col-md-9">
						                                    <h4 class="text-white mb-4">회원 정보 보호를 위해 비밀번호를 한번 더 입력해주세요.</h4>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="Your Password" onkeyup="enterkey()">
						                                        <label for="user_pw">비밀번호</label>
						                                    </div>
						                                </div>
						                                <div class="col-9">
						                                    <button class="btn btn-primary w-100 py-3" type="button" onclick="">확인</button>
						                                </div>
						                            </div>
						                        </form>
						                        <!-- 비밀번호 입력 폼 종료 -->
						                    </div>
						                </div>
						            </div>
						        </div>
                            </div>
                        </div>
                        <!-- 비밀번호 변경 -->
                        <div id="tab-3" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="container-xxl py-5 px-0 fade show p-1">
						            <div class="row g-0" >
						                <div class="col-md-6 bg-dark d-flex align-items-center" style="margin: auto;">
						                    <div class="p-5 fade show p-1">
						                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">FOODYBUDDY</h5>
						                        <h3 class="text-white mb-4">비밀변호 변경</h3>
						                        <!-- 비밀번호 변경 폼 -->
						                        <form action='/user/loginEnd' name="login_form" method="post">
						                            <div class="row g-3" style="margin-left:20%">
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="password" class="form-control" id="prev_user_pw" name ="prev_user_pw" placeholder="Your Pw">
						                                        <label for="prev_user_pw">기존 비밀번호</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="password" class="form-control" id="new_user_pw" name ="new_user_pw" placeholder="Your New Pw">
						                                        <label for="new_user_pw">새 비밀번호</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="password" class="form-control" id="new_user_pw_ck" name="new_user_pw_ck" placeholder="Your New Pw Check" onkeyup="">
						                                        <label for="new_user_pw_ck">새 비밀번호 확인</label>
						                                    </div>
						                                </div>
						                                <div class="col-9">
						                                    <button class="btn btn-primary w-100 py-3" type="submit" onclick="">변경</button>
						                                </div>
						                            </div>
						                        </form>
						                        <!-- 비밀번호 변경 폼 종료 -->
						                    </div>
						                </div>
						            </div>
						        </div>
                            </div>
                        </div>
                        <!-- 회원 탈퇴 -->
                  	<!-- 회원 탈퇴 -->
					<div id="tab-4" class="tab-pane fade show p-0">
						<div class="row g-4">
							<div class="container-xxl py-5 px-0 fade show p-1">
								<div class="row g-0">
									<div class="col-md-6 bg-dark d-flex align-items-center" style="margin: auto;">
										<div class="p-5 fade show p-1">
	<h5
	class="section-title ff-secondary text-start text-primary fw-normal">FOODYBUDDY</h5>
	<h3 class="text-white mb-4">회원 탈퇴</h3>
	<!-- 탈퇴 확인 폼 -->
	<form action='/user/delete' name="delete_form"
	method="post">
	<div class="row g-3" style="margin-left: 20%">
	<div class="col-md-9">
	<h4 class="text-white mb-4">정말 탈퇴하시겠습니까?</h4>
	<h5 class="text-white">비밀번호를 한번 더 입력해주세요.</h5>
	</div>
	<div class="col-md-9">
	<div class="form-floating">
	<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="Your Password" onkeyup="">
	<label for="user_pw">비밀번호</label>
	</div>
	</div>
	<div class="col-9">
	<button type="button" class="btn btn-primary w-100 py-3" onclick="checkPw();">확인</button>
	</div>
	</div>
	</form>
<!-- 탈퇴 확인 폼 종료 -->
						                    </div>
						                </div>
						            </div>
						        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<script>
		/* 내정보 변경 버튼 스크립트 */
		function updateBtn(){
			let form = document.getElementById('info_form');
			form.action = '/user/update';
			form.method = 'post';
			form.submit();
		}
        <!-- 회원탈퇴 자바 스크립트 -->  
		function checkPw(){
			let pwd = document.getElementById('user_pw').value;
			   // 비밀번호 입력이 비어있는지 확인
	        if (pwd === '') {
	            alert('비밀번호를 입력해 주세요.');      
	        }else{
	        	
	    	 // 폼 제출
	        document.forms['delete_form'].submit();
	        }
		}

		</script>
        
        <!-- Menu End -->
        

 	<!-- 푸터 외부링크 -->
	<%@ include file="../include/footer.jsp" %>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
	
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
</body>

</html>