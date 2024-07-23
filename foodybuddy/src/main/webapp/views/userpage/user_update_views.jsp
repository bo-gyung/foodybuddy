<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 변경</title>
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
												System.out.println("update : "+ info);
												%>
												
						                        <!-- 내 정보 폼 -->
						                        <form action= "<%=request.getContextPath()%> /user/update" name="info_form" method="post" id = "info_form">
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
						                                         value="<%=info.get("닉네임") %>">
						                                        <label for="user_name">닉네임</label>
						                                        <button id = check-nickname-btn>중복확인</button>
						                                        <span id="nickname-status" style="color: red;"></span>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_phone" name="user_phone" 
						                                         value="<%=info.get("전화번호") %>">
						                                        <label for="user_phone">전화번호</label>
						                                    </div>
						                                </div>
						                                
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_addr" name="user_addr" 
						                                         value="<%=info.get("기본주소") %>">
						                                        <label for="user_addr">주소</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_d_addr" name="user_d_addr" 
						                                          value="<%=info.get("상세주소") %>">
						                                        <label for="user_d_addr">상세 주소</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-4">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_e_addr" name="user_e_addr" 
						                                         value="<%=info.get("참고항목") %>">
						                                        <label for="user_e_addr">참고항목</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-4">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_postcode" name="user_postcode" 
						                                         value="<%=info.get("우편번호") %>">
						                                        <label for="user_postcode">우편번호</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_email" name="user_email" 
						                                         value="<%=info.get("이메일") %>">
						                                        <label for="user_email">이메일</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_question" name="user_question" 
						                                         value="<%=info.get("질문") %>">
						                                        <label for="user_question">아이디 찾기 질문</label>
						                                    </div>
						                                </div>
						                                <div class="col-md-9">
						                                    <div class="form-floating">
						                                        <input type="text" class="form-control" id="user_answer" name="user_answer" 
						                                         value="<%=info.get("답변") %>">
						                                        <label for="user_answer">답변</label>
						                                    </div>
						                                </div>
						                                <div class="col-9">
						                                    <button class="btn btn-primary w-100 py-3" type="submit" onclick="updateView();">변경</button>
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
 	<!-- 푸터 외부링크 -->
	<%@ include file="../include/footer.jsp" %>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

     
</script>
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
    <script>
    //닉네임 중복확인 ajax
$(function() {
    $('#check-nickname-btn').on('click', function() {
        let nickname = $('#user_name').val();
        
        if (nickname === '') {
            $('#nickname-status').text('닉네임을 입력하세요');
            return;
        }
        
        $.ajax({
            url: '<%=request.getContextPath()%>/user/checkNickname',
            type: 'post',
            data: { user_name: nickname },
            success: function(response) {
                if (response.exists) {
                    $('#nickname-status').text('이미 사용중입니다');
                } else {
                    $('#nickname-status').text('사용 가능한 닉네임입니다.');
                }
            },
            error: function() {
                $('#nickname-status').text('서버 오류가 발생했습니다.');
            }
        });
    });
});
</body>
</html>