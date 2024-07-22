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
	            <%
	            List<BuddyComment> c_list = (List<BuddyComment>)session.getAttribute("c_list");
	           
	            %>
	            
	            
				<div class=" mt-5 row d-flex justify-content-center">
					<div class="col-md-8 col-lg-9">
						<p>
							<h3 class="text-center text-primary">모임 결성하기</h3>
							<h6 id="printPlace" class="text-center text-secondary"></h6>
							<h6 class="text-center text-secondary">(모임장 포함)</h6>
							<input type="hidden" id="party_number" name="party_number" value="">
						</p>
						<div class="card shadow-0 border" style="background-color: #f8f9fa;">
							<div id="result_div" class="card-body p-4">
							<form name="group_create_form" action="/group/create" method="post" target="hiddenIframe">

								<!-- 댓글 리스트 시작 -->
					            <div class="comment_list" id="comment_place">
					                		<%if (c_list.size() >0 ) {
             			                        for (BuddyComment c : c_list) {%>
					                            <div class="card mb-4">
													<div class="card-body">
														<input type="hidden" id="buddy_no" name="buddy_no" value="<%=c.getBuddy_no()%>">						
														<input type="checkbox" name="member_no" value="<%=c.getUser_no()%>" onclick="partyCnt()">
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
				               			 <%  }
					                    } else{ %>
					                    	<div class="card mb-4">
													<div class="card-body">
														<input type="hidden" id="buddy_no" name="buddy_no" value="">
														<p>선택할 인원이 없습니다</p>
												
														<div class="d-flex justify-content-between">
															
															<div class="d-flex flex-row align-items-center">
																<p class="small mb-0 ms-2"></p>
															</div>
															<div class="d-flex flex-row align-items-center">
																<p class="small text-muted mb-0"></p>
															</div>
														</div>
													</div>
												</div>
					                    <%  } %>
					            </div>
					            <!-- 댓글 리스트 종료 -->
					            <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="button" onclick="createGroupEnd();">그룹 결성</button>
                                </div>
				            </form>
					      </div>
					    </div>
					  </div>
					</div>
	            	<!-- 댓글영역 종료 -->
	            	<iframe name="hiddenIframe" style="display:none;"></iframe>
	            	
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
    
    <script type="text/javascript">
    	// 현재 페이지 url
    	const url = new URL(window.location.href);
    	// console.log(url);
    	
		// URL의 파라미터를 다룰 수 있는 객체인 URLSearchParams 객체
    	const urlParams = url.searchParams;
    	// console.log(urlParams);
    	
    	// url에 담긴 파라미터 값 찾기
    	const partyNumber = urlParams.get('party_number');
    	// console.log(partyNumber);
		
    // onload 시 모집인원 표시
    window.onload = function() {
        // 폼에서 체크된 체크박스의 개수(1은 작성자를 포함하기 위한 값)
        const selectNumber = (document.querySelectorAll('input[name="member_no"]:checked').length) + 1;
        
        // 모일 인원을 선택하세요 (선택인원/모임인원) 출력
        const printPlace = document.getElementById('printPlace'); // 출력장소 <h6>
        if (partyNumber) {
            printPlace.innerText = "모일 인원을 선택하세요 ( " + selectNumber + " / " + partyNumber + " )";
        }
    }
    
    // 체크할 때마다 모집인원 cnt
    function partyCnt(){
    	// 폼에서 체크된 체크박스의 개수(1은 작성자를 포함하기 위한 값)
        const selectNumber = (document.querySelectorAll('input[name="member_no"]:checked').length) + 1;
        
        // 모일 인원을 선택하세요 (선택인원/모임인원) 출력
        const printPlace = document.getElementById('printPlace'); // 출력장소 <h6>
        if (partyNumber) {
            printPlace.innerText = "모일 인원을 선택하세요 ( " + selectNumber + " / " + partyNumber + " )";
        }
    }
    	
    // 그룹 결성 폼 제출
	function createGroupEnd() {
		// 체크박스 중복검사 및 개수 확인 후 폼 제출
		
		// 폼에서 체크된 체크박스를 모두 선택
	    const checkedBoxes = document.querySelectorAll('input[name="member_no"]:checked');
		console.log("체크된 체크박스 : "+checkedBoxes);
		console.log("체크박스 의 개수 : "+checkedBoxes.length);
		
		// 중복되지 않은 체크값을 담을 set(중복 허용 x)
		const valueSet = new Set();
		// 중복된 값들을 저장할 배열
		const duplicates = [];
		
		for(let i = 0 ; i < checkedBoxes.length ; i++){
			const  value = checkedBoxes[i].value
			// 중복값 확인
			if(valueSet.has(value)){
				// 중복된 값이 발견되면 duplicates 배열에 추가
		        duplicates.push(value);
			} else{
				// 중복 x 셋에 추가
				valueSet.add(value);
			}
		}
		
		if((checkedBoxes.length)+1 == partyNumber){
			// 체크인원+1(작성자) 가 설정한 모임인원과 일치
			if (duplicates.length > partyNumber) {
				// 중복값 존재 o
				alert("동일한 회원을 중복 선택 하였습니다.");
			} else {
				// 중복값 존재 x
			    // 제출
				const form = document.getElementById('group_create_form');
	        	 alert("모임이 결성되었습니다.");
	        	 form.submit();
	        	 setTimeout(function() {
	                 window.close();
	             }, 500); // 0.5초 후 창 닫기
			}
		} else if((checkedBoxes.length)+1 > partyNumber) {
			// 체크인원+1(작성자) 가 설정한 모임인원보다 클 경우
			alert("모임인원의 정원을 초과하였습니다.");
		} else{
			// 체크인원+1(작성자) 가 설정한 모임인원보다 작을 경우
			alert("모임인원의 정원을 확인해주세요.");
		}

	}
	
	// 
	    	
    </script>
    
</body>
</html>