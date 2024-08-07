<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>BUDDY(같이가기)</title>
    <!-- BUDDY(같이가기) 글목록 -->
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
    <link href="../../resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"  />

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
                    <h1 class="display-3 text-white mb-5 pb-5 animated slideInDown">Buddy</h1>
                    <!-- 검색창 -->
                    <div class="input-group mt-5">
						<button class="btn btn-outline-secondary dropdown-toggle py-2 position-absolute mt-2 me-2"style="min-width : 10%; background-color : Lightgray;" type="button" data-bs-toggle="dropdown" aria-expanded="false">ㅇㅇ</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">검색조건</a></li>
								<li><a class="dropdown-item" href="#">작성자</a></li>
								<li><a class="dropdown-item" href="#">제목</a></li>
								<li><a class="dropdown-item" href="#">위치</a></li>
							</ul>
						<input type="text" class="form-control border-primary w-100 py-3 ps-4 pe-5" style="max-width: 80%; margin-left : 12%">
						<button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2 btn-lg">검색</button>
					</div>
                </div>
            </div>
        <!-- Hero End -->


        <!-- Menu Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">함께 갈 일행 구하기</h5>
                    <h1 class="mb-5">BUDDY BOARD</h1>
                </div>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                                <i class="fa fa-coffee fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">등록일자</small>
                                    <h6 class="mt-n1 mb-0">최신순</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                                <i class="fa fa-hamburger fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">많이본</small>
                                    <h6 class="mt-n1 mb-0">조회수순</h6>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                                <i class="fa fa-utensils fa-2x text-primary"></i>
                                <div class="ps-3">
                                    <small class="text-body">마감일</small>
                                    <h6 class="mt-n1 mb-0">임박순</h6>
                                </div>
                            </a>
                        </li>
                        
                    </ul>
                    <div class="tab-content">
                    	<!-- 기본, 최신순 -->
                    	<div id="tab-1" class="tab-pane fade show p-0 active">
                    	
                            <div class="row g-4">
                            <%@page import="com.foodybuddy.buddy.vo.Buddy, java.util.*" %>
                            <% List<Buddy> list = (List<Buddy>)request.getAttribute("resultList");
                            	for(int i = 0 ; i < list.size() ; i++){%>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span><a href="/board/buddy/post?buddy_no=<%=list.get(i).getBuddy_no()%>"><%=list.get(i).getBuddy_title() %></a></span>
                                                <span class="text-primary"><%=list.get(i).getParty_status() %></span>
                                            </h5>
                                            <small class="fst-italic">
                                            <a style="color:black;" href="">작성자 : <%=list.get(i).getUser_name() %></a> / 
                                            모임일 : <%=list.get(i).getMeet_date() %> / 
                                            댓글 : <%=list.get(i).getComment_cnt() %> / 
                                            조회수 : <%=list.get(i).getBuddy_view() %>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            	<%} %>
                            	
	                        <!-- 페이징바 구성 -->
							<% Buddy paging = (Buddy)request.getAttribute("paging"); %>
							<% if(paging != null){ %>
								<div class="center col-9 pt-5" style="margin:auto;">
									<div class="pagination" style="display: flex; justify-content: center">
										<%if(paging.isPrev()){%>
											<a href="/board/buddy?nowPage=<%=(paging.getPageBarStart()-1)%>">&laquo;</a>
										<%}%>
										<%for(int i = paging.getPageBarStart() ; i <= paging.getPageBarEnd() ; i++){%>
											<a href="/board/buddy?nowPage=<%=i%>" 
											<%=paging.getNowPage() == i ? "class='active'" : ""%>>
												<%=i%>
											</a>
										<%}%> 
										<% if(paging.isNext()){%>
											<a href="/board/buddy?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
										<%}%>
									</div>	
								</div>
							<%} %>
                            	
                            </div>
                        </div>
                        
						<!-- 조회수순 -->
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="../../resources/template/img/menu-1.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>글제목</span>
                                                <span class="text-primary">모임일 : 24-07-24</span>
                                            </h5>
                                            <small class="fst-italic">글쓴이 : 고보경 / 등록일 : 24-07-14 / 댓글 : 1 / 조회수 : 3</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="../../resources/template/img/menu-2.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>글제목2</span>
                                                <span class="text-primary">모집중</span>
                                            </h5>
                                            <small class="fst-italic">글쓴이 : 류지현 / 모임일 : 24-07-24 / 댓글 : 0 / 조회수 : 8</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="../../resources/template/img/menu-3.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>글제목3</span>
                                                <span class="text-primary">[모집중] 24-07-24</span>
                                            </h5>
                                            <small class="fst-italic">글쓴이 : 임민지 / 등록일 : 24-07-14 / 조회수 : 24</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="../../resources/template/img/menu-4.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>글제목이 얼마나 길어질 수 있을까요? 가나다라마바사아자차카타파하</span>
                                                <span class="text-primary">좋아요 수</span>
                                            </h5>
                                            <small class="fst-italic">글쓴이 : 박병준 / 등록일 : 24-07-14 / 조회수 : 50</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="../../resources/template/img/menu-5.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>글제목4</span>
                                                <span class="text-primary">24-07-24 [모집중]</span>
                                            </h5>
                                            <small class="fst-italic">글쓴이 : 최종우 / 등록일 : 24-07-14 / 조회수 : 198</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="../../resources/template/img/menu-6.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>제목 글자수 제한을 걸 필요가 있음.</span>
                                                <span class="text-primary">모집종료</span>
                                            </h5>
                                            <small class="fst-italic">글쓴이 : 푸디버디 / 페이지 양식 테스트</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="../../resources/template/img/menu-7.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>Chicken Burger</span>
                                                <span class="text-primary">$115</span>
                                            </h5>
                                            <small class="fst-italic">Ipsum ipsum clita erat amet dolor justo diam</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="../../resources/template/img/menu-8.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>Chicken Burger</span>
                                                <span class="text-primary">$115</span>
                                            </h5>
                                            <small class="fst-italic">Ipsum ipsum clita erat amet dolor justo diam</small>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <!-- 마감일 임박순 -->
                        <div id="tab-3" class="tab-pane fade show p-0">
                            <div class="row g-4">
                            
                          		<div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="img/menu-1.jpg" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>Chicken Burger</span>
                                                <span class="text-primary">$115</span>
                                            </h5>
                                            <small class="fst-italic">Ipsum ipsum clita erat amet dolor justo diam</small>
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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