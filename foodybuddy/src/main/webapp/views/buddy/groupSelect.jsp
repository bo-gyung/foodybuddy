<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 결성하기</title>
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
	           	<%@page import="com.foodybuddy.buddy_comment.vo.BuddyComment, java.util.*" %>
	            <%List<BuddyComment> c_list = (List<BuddyComment>)session.getAttribute("c_list");%>
	            
				<div class=" mt-5 row d-flex justify-content-center">
					<div class="col-md-8 col-lg-9">
						<p>
							<h3 class="text-center text-primary">모임 결성하기</h3>
							<h6 class="text-center text-secondary">모임 인원을 선택하세요 ( 1 / n )</h6>
						</p>
						<div class="card shadow-0 border" style="background-color: #f8f9fa;">
							<div id="result_div" class="card-body p-4">
							<form name="group_create_form" action="/group/greate" method="post">

								
								<!-- 댓글 리스트 시작 -->
					            <div class="comment_list" id="comment_place">
								<input type="hidden" id="buddy_no" name="buddy_no" value="<%=c_list.get(0).getBuddy_no()%>">						
					                		<%if (c_list != null) {
             			                        for (BuddyComment c : c_list) {
					                %>
					                            <div class="card mb-4">
													<div class="card-body">
														<input type="checkbox" name="member_no" value="<%=c.getUser_no()%>">
														<p><%= c.getComment_main() %></p>
												
														<div class="d-flex justify-content-between">
															
															<div class="d-flex flex-row align-items-center">
																<p class="small mb-0 ms-2"><%= c.getUser_name() %></p>
															</div>
															<div class="d-flex flex-row align-items-center">
																<p class="small text-muted mb-0"><%= c.getReg_date() %></p>
															</div>
														</div>
													</div>
												</div>
					                <%
					                        }
					                    }
					                %>
					            </div>
					            <!-- 댓글 리스트 종료 -->
					            <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="button" onclick="createBuddyForm();">검토 신청</button>
                                </div>
				            </form>
					      </div>
					    </div>
					  </div>
					</div>
	            	<!-- 댓글영역 종료 -->
	            	
	            	
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