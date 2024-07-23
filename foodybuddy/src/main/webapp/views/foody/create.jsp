<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOODY</title>

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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">FOODY</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
			                <li class="breadcrumb-item"><a href="/">Home</a></li>
			                <li class="breadcrumb-item"><a href="/board/foody" style="color:white;">FOODY</a></li>
			                <li class="breadcrumb-item"><a href="/board/buddy">BUDDY</a></li>
			            </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">FOODY</h5>
                    <h1 class="mb-5">맛집 글 작성</h1>
                </div>
                <div class="row g-4">
					<div style="display:flex; justify-content:center;">
	                    <div class="col-md-9">
	                     
	                        <div class="wow fadeInUp" data-wow-delay="0.2s">
	                        	<!-- 입력폼 시작 -->
	                            
	                            <form action='/board/createEnd' name="create_foody_form" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return createFoodyForm();">
	                                <div class="row g-3">
	                                	
	                                	<div class="col-12">
	                                        <div class="form-floating">
	                                            <input type="text" class="form-control" name="foody_title">
	                                            <label for="subject">제목(최대 20글자)</label>
	                                        </div>
	                                    </div>
						   				
	                            	
	                            	<div class="container">
									    <div class="row">
									        <div class="col-6">
									            <div class="form-floating pt-5">
									                <label>가게이름</label><br>
									                <input type="text" class="form-control" name="foody_name">
									            </div>
									        </div>
									        
									        <div class="col-6">
									            <div class="form-floating pt-5">
									                <div class="row">
									                    <div class="col-6">
									                        <label>맛</label>
									                        <input type="number" class="form-control" name="foody_taste" min="1" max="5">
									                    </div>
									                    <div class="col-6">
									                        <label>청결</label>
									                        <input type="number" class="form-control" name="foody_clean" min="1" max="5">
									                    </div>
									                </div>
									                <div class="row pt-5">
									                    <div class="col-6">
									                        <label>주차</label><br>
									                        <label>가능</label>
									                        <input type="radio" name="foody_pariking" value="가능">
									                        <label>불가능</label>
									                        <input type="radio" name="foody_pariking" value="불가능">
									                    </div>
									                    <div class="col-6">
									                        <label>배달</label><br>
									                        <label>가능</label>
									                        <input type="radio" name="foody_delivery" value="가능">
									                        <label>불가능</label>
									                        <input type="radio" name="foody_delivery" value="불가능">
									                    </div>
									                </div>
									            </div>
									        </div>
									    </div>
									</div>
	                            	
	                            	
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" name="foody_main" placeholder="내용을 입력해주세요" style="height: 500px; resize: none;"></textarea>
                                            <label for="message">상세설명</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
											<div>
                                    		<label>대표이미지</label><br>
                                            <input type="file" name="foody_picture1" accept=".png,.jpg,.jpeg"><br>
											<label>추가 사진</label><br>
											<input type="file" name="foody_picture2" accept=".png,.jpg,.jpeg"><br>
											<input type="file" name="foody_picture3" accept=".png,.jpg,.jpeg"><br>
											<input type="file" name="foody_picture4" accept=".png,.jpg,.jpeg"><br>
											<input type="file" name="foody_picture5" accept=".png,.jpg,.jpeg">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" name="foody_address"></input>
                                            <label>주소 입력 (아래 지도에서 검색 후 주소를 복사해서 입력해주세요)</label>
                                        </div>
                                    </div>
	                                    
	                                    <div class="col-12">
	                                        <button class="btn btn-primary w-100 py-3" type="submit" onclick="createFoodyForm();">게시</button>
	                                    </div>
	                                </div>
	                            </form>
	                        </div>
	                        <div class="col-12" style="display: flex; justify-content: space-evenly;">
					        			<div id="map" class="form-control" style="height:500px;"></div>
										    <div class="form-control" id="menu_wrap" class="bg_white">
										        <div class="option">
										            <div>
										                <form onsubmit="searchPlaces(); return false;">
										                    키워드 : <input type="text" value="맥도날드 가산" id="keyword" size="15"> 
										                    <button type="submit">검색하기</button> 
										              	 </form>
												    </div>
												</div>
											    <hr>
										    	<ul id="placesList"></ul>
								       		<div id="pagination" style="align-text : center;"></div>
										  </div>
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
    
	<script type="text/javascript">
		function createFoodyForm() {
			let form = document.create_foody_form;	
			
			if(!form.foody_title.value){
				alert("제목을 입력하세요.");
				form.foody_title.focus();
				
			} else if(!form.foody_name.value){
				alert("가게이름을 입력하세요.");
				form.foody_name.focus();
				return false;
			}else if(!form.foody_taste.value){
				alert("맛 평점을 입력해주세요.")
				form.foody_taste.focus();
				return false;
			}else if(form.foody_taste.value > 5 && form.foody_taste.value < 0){
				alert("맛 평점은 0 에서 5 사이 입력만 가능합니다.")
				form.foody_taste.focus();
				return false;
			}else if(!form.foody_clean.value){
				alert("청결 평점을 입력해주세요.")
				form.foody_clean.focus();
				return false;
			}else if(form.foody_clean.value > 5 && form.foody_clean.value < 0){
				alert("청결 평점은 0 에서 5 사이 입력만 가능합니다.")
				form.foody_clean.focus();
				return false;
			}else if(!form.foody_main.value){
				alert("상세 내용을 입력해주세요");
				form.foody_main.focus();
				return false;
			}else if(!form.foody_address.value){
				alert("주소를 입력해주세요");
				form.foody_address.focus();
				return false;
			}else if(!form.foody_picture1.value){
				alert("대표 사진을 입력해주세요");
				form.foody_address.focus();
				return false;
			}else {
				const validExtensions = ['jpg', 'jpeg', 'png'];
				for (let i = 1; i <= 5; i++) {
					const fileInput = form['foody_picture' + i];
					const file = fileInput.files[0];
					if (file) {
						const fileExtension = file.name.split('.').pop().toLowerCase();
						if (!validExtensions.includes(fileExtension)) {
							alert("이미지파일만 선택할 수 있습니다.");
							fileInput.value = '';
							return false;
						}
					}
				}
			}
			form.submit();
		}
	</script>
	
	
	
	
	
	
	<script>
	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var keyword = document.getElementById('keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB, {size:5}); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);

	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

	        alert('검색 결과가 존재하지 않습니다.');
	        return;

	    } else if (status === kakao.maps.services.Status.ERROR) {

	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;

	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {

	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });

	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);

	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';

	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>'; 
	        
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <br><span class="tel">' + places.phone  + '</span>' +
	                '</div>';           

	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 

	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }

	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;

	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }

	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	
	
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
</body>

</html>