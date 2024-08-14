<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1 class="display-3 text-white mb-5 pb-5 animated slideInDown">BUDDY</h1>
			<!-- 검색창 -->
			<div class="input-group mt-5">
				<form action="<c:url value='/board/buddy' />" id="searchFrm" method="get" class="d-flex w-100 align-items-center">
					<select name="searchOption" id="searchOption" class="form-control border-primary py-3 ps-4 pe-5" style="flex: 0 0 10%; margin-right: 5%;">
						<option value="1" <c:if test="${paging.search_option == '1' or empty paging.search_option }">selected </c:if> >제목</option>
						<option value="2" <c:if test="${paging.search_option == '2' }">selected </c:if> >작성자</option>
					</select>
					<input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색어를 입력하세요." 
					value="<c:out value='${paging.search_keyword }'/>" 
					class="form-control border-primary py-3 ps-4 pe-5" style="flex: 0 0 70%; margin-right: 5%;">
					<button type="submit" class="btn btn-primary py-2 btn-lg" style="flex: 0 0 10%;">검색</button>
				</form>
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
                        <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3" href="/board/buddy?sort=1">
                            <i class="fa fa-coffee fa-2x text-primary"></i>
                            <div class="ps-3">
                                <small class="text-body">등록일자</small>
                                <h6 class="mt-n1 mb-0">최신순</h6>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 pb-3" href="/board/buddy?sort=2">
                            <i class="fa fa-hamburger fa-2x text-primary"></i>
                            <div class="ps-3">
                                <small class="text-body">많이본</small>
                                <h6 class="mt-n1 mb-0">조회수순</h6>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" href="/board/buddy?sort=3">
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
                	
	                 	<!-- 리스트 시작 -->
	                 	<div class="row g-4">
		                  	<c:choose>
								<c:when test="${empty resultList }">
									<div class="col-lg-6">
		                                 <div class="d-flex align-items-center">
		                                     <img class="flex-shrink-0 img-fluid rounded" src="" alt="" style="width: 80px;">
		                                     <div class="w-100 d-flex flex-column text-start ps-4">
		                                         <h5 class="d-flex justify-content-between border-bottom pb-2">
		                                             조회된 게시글이 없습니다.
		                                         </h5>
		                                     </div>
		                                 </div>
		                             </div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${resultList }" var="b" varStatus="status">
										<div class="col-lg-6">
		                                   <div class="d-flex align-items-center">
		                                       <img class="flex-shrink-0 img-fluid rounded" src="" alt="" style="width: 80px;">
		                                       <div class="w-100 d-flex flex-column text-start ps-4">
		                                           <h5 class="d-flex justify-content-between border-bottom pb-2">
		                                               <span><a href="/board/buddy/post?buddy_no=${b.buddy_no }"><c:out value="${b.buddy_title }"/></a></span>
		                                               <span class="text-primary"><c:out value="${b.party_status }"/></span>
		                                           </h5>
		                                           <small class="fst-italic">
			                                            <a style="color:black;" href="">작성자 : <c:out value="${b.user_name }"/></a> /
			                                            모임일 : <c:out value="${b.meet_date}" /> /
			                                            댓글 : <c:out value="${b.comment_cnt }"/> / 
			                                            조회수 : <c:out value="${b.buddy_view }"/>
		                                           </small>
		                                       </div>
		                                   </div>
		                               </div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
	                 	<!-- 리스트 끝 -->
	                 	
	                 	<!-- 페이징바 시작 -->
						<c:if test="${not empty paging }">
							<div>
								<div>
									<c:if test="${paging.prev }">
										<a href="<c:url value='/board/buddy?nowPage=${paging.pageBarStart-1 }&sort=${paging.sort }'/>">&laquo;</a>
									</c:if>
									<c:forEach begin="${paging.pageBarStart }" end="${paging.pageBarEnd }" var="idx">
										<a href="<c:url value='/board/buddy?nowPage=${idx }&sort=${paging.sort }'/>">${idx }</a>
									</c:forEach>
									<c:if test="${paging.next }">
										<a href="<c:url value='/board/buddy?nowPage=${paging.pageBarEnd+1 }&sort=${paging.sort }'/>">&raquo;</a>
									</c:if>
								</div>
							</div>
						</c:if>
	                 	<!-- 페이징바 끝 -->
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