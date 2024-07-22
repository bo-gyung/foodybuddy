<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
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
    <link href="../resources/template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../resources/template/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"  />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../resources/template/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../resources/template/css/style.css" rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </head>

    <body>
       <%@ include file="../include/navbar.jsp" %>
            <section>
                <div id="section_wrap">
                    <div class="word">
                        <h3>회원가입</h3><br>
                        
                     </div><br>
                        <div class="create_account_form">
                            <form name="create_account_form" action="/user/createEnd" method="post">
                                <table>
                                    <tr>
                                        <th><label>아이디</label></th>
                                        <td><input type="text" name="user_id" placeholder="아이디" onkeyup="checkId(this.value)"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <span id="userId"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label>비밀번호</label></th>
                                        <td><input type="password" name="user_pw" placeholder="비밀번호"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <span id="userPw"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label>비밀번호확인</label></th>
                                        <td><input type="password" name="user_pw_check" placeholder="비밀번호 확인"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <span id="userPwCheck"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label>닉네임</label></th>
                                        <td><input type="text" name="user_name" placeholder="닉네임" onkeyup="checkName(this.value)"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <span id="userName"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label>전화번호</label></th>
                                        <td><input type="text" name="user_phone" placeholder="전화번호"  onkeyup="checkPhone(this.value)"></td>
                                    </tr>
                                     <tr>
                                        <td></td>
                                        <td>
                                            <span id="userPhone"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label>주소</label></th>
                                        <td><input type="text" id="postcode" name="user_postcode" placeholder="우편번호">
                                        </td>
                                        <td><input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><input type="text" id="address" name="user_addr" placeholder="주소">
                                        <td>
                                        <td></td>
                                    <tr>
                                        <td></td>
                                        <td><input type="text" id="detailAddress" name="user_detailAddr"
                                                placeholder="상세주소"></td>
                                        <td><input type="text" id="extraAddress" name="user_extraAddr"
                                                placeholder="참고항목"></td>
                                    </tr>
                                    <tr>
                                        <th><label>이메일</label></th>
                                        <td><input type="text" name="user_email" placeholder="이메일" onkeyup="checkEmail(this.value)"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <span id="userEmail"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label>질문</label></th>
                                        <td><select name="user_question">
                                                <option>질문선택하기</option>
                                                <option value=1>최초로 방문한 국가는 어디였나요?</option>
                                                <option value=2>가장 좋아하는 음식은 무엇인가요?</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <th><label>질문답변</label></th>
                                        <td><input type="text" name="user_answer" placeholder="질문답변"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><button onclick="createUserForm();">회원가입</button></td>
                                    </tr>
                                </table>


                        </div>
                        <div class="login">
                            <a href="/user/login">로그인</a>
                        </div>
                    </div>
                </section>

                <script>
                    function execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function (data) {
                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                var addr = ''; // 주소 변수
                                var extraAddr = ''; // 참고항목 변수

                                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                    addr = data.roadAddress;
                                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                    addr = data.jibunAddress;
                                }

                                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                if (data.userSelectedType === 'R') {
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                        extraAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if (data.buildingName !== '' && data.apartment === 'Y') {
                                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if (extraAddr !== '') {
                                        extraAddr = ' (' + extraAddr + ')';
                                    }
                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                    document.getElementById("extraAddress").value = extraAddr;

                                } else {
                                    document.getElementById("extraAddress").value = '';
                                }

                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('postcode').value = data.zonecode;
                                document.getElementById("address").value = addr;
                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById("detailAddress").focus();
                            }
                        }).open();
                    }
                    const form = document.create_account_form;
                    const inputId = form.user_id;
                    const idMsg = document.getElementById('userId');

                    function checkId(userId) {
                        if (userId === '') {
                            idMsg.textContent = '아이디를 입력해주세요.';
                            return;
                        }
						
                        var xhr = new XMLHttpRequest();
                        xhr.open("GET", "/checkId?userId=" + encodeURIComponent(userId), true);
                        xhr.onreadystatechange = function () {
                            const inputValue = inputId.value;
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                var result = xhr.responseText;
                                if (result === "available") {
                                	if(isValidId(inputValue)){
                                    idMsg.textContent = '사용 가능한 아이디입니다.';
                                	}else{
                                		idMsg.textContent = '영문/숫자(4자~ 20자)';
                                	}
                                		
                                } else if(result === "unavailable") {
                                   idMsg.textContent = '이미 사용 중인 아이디입니다.';
                                }else{
                                	idMsg.textContent = '오류가 발생하였습니다.'
                                }
                            }
                        };
                        		xhr.send();
                      }
                      
                    
                    function isValidId(id) {

                        const regex = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{4,20}$/;
                        return regex.test(id);
                    }

                    const inputPw = form.user_pw;
                    const pwMsg = document.getElementById('userPw');
                    inputPw.addEventListener('input', function () {
                        const pwVal = inputPw.value;
                        if (pwVal === '') {
                            pwMsg.textContent = '비밀번호를 입력해주세요.'
                        } else {
                            if (isValidPw(pwVal)) {
                                pwMsg.textContent = '사용가능한 비밀번호입니다.';
                            } else {
                                pwMsg.textContent = '영문/숫자(8자~ 20자)';
                            }
                        }
                    });
                    function isValidPw(pw) {
                        const regex2 = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,20}$/;
                        return regex2.test(pw);
                    }

                    const inputPwCheck = form.user_pw_check;
                    const pwCheckMsg = document.getElementById('userPwCheck');
                    inputPwCheck.addEventListener('input', function () {
                        const pwCheckVal = inputPwCheck.value;
                        const pwVal = inputPw.value;
                        if (pwCheckVal === '') {
                            pwCheckMsg.textContent = '확인을 위해 비밀번호를 다시 입력해주세요.'
                        } else {
                            if (pwCheckVal != pwVal) {
                                pwCheckMsg.textContent = '비밀번호가 일치하지 않습니다.'
                            } else {
                                pwCheckMsg.textContent = '비밀번호가 일치합니다.'
                            }
                        }
                    });

                    const inputName = form.user_name;
                    const nameMsg = document.getElementById('userName');
                  
                    function checkName(userName) {
                        if (userName === '') {
                            nameMsg.textContent = '닉네임을 입력해주세요.';
                            return;
                        }
						
                        var xhr = new XMLHttpRequest();
                        xhr.open("GET", "/checkName?userName=" + encodeURIComponent(userName), true);
                        xhr.onreadystatechange = function () {
                            const nameVal = inputName.value;
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                var result = xhr.responseText;
                                if (result === "available") {
                                	if(isValidName(nameVal)){
                                   		nameMsg.textContent = '사용 가능한 닉네임입니다.';
                                	}else{
                                		nameMsg.textContent = '한글(2자~10자)';
                                	}
                                		
                                } else if(result === "unavailable") {
                                   nameMsg.textContent = '이미 사용 중인 아이디입니다.';
                                }else{
                                	nameMsg.textContent = '오류가 발생하였습니다.'
                                }
                            }
                        };
                        		xhr.send();
                      }
                    
                        function isValidName(name) {

                            const regex3 = /^([ㄱ-ㅎ]){2,10}$/;
                            return regex3.test(name);
                        }
                        
                        const inputPhone = form.user_phone;
                        const phoneMsg = document.getElementById('userPhone');
                        
                        function checkPhone(userPhone) {
                            if (userPhone === '') {
                                phoneMsg.textContent = '전화번호를 입력해주세요.';
                                return;
                            }
    						
                            var xhr = new XMLHttpRequest();
                            xhr.open("GET", "/checkPhone?userPhone=" + encodeURIComponent(userPhone), true);
                            xhr.onreadystatechange = function () {
                            	const phoneVal = inputPhone.value;
                                if (xhr.readyState == 4 && xhr.status == 200) {
                                    var result = xhr.responseText;
                                    if (result === "available") {
                                    	if(isValidPhone(phoneVal)){
                                    		phoneMsg.textContent = '사용가능한 전화번호 입니다.'
                                    	}else{
                                    		phoneMsg.textContent = '올바른 전화번호를 입력하세요.'
                                    	}
                                    		
                                    } else if(result === "unavailable") {
                                       phoneMsg.textContent = '이미 사용 중인 전화번호입니다.';
                                    }else{
                                    	phoneMsg.textContent = '오류가 발생하였습니다.'
                                    }
                                }
                            };
                            		xhr.send();
                          }
                     
                        function isValidPhone(phone){
                            const regex4 = /^010\d{4}\d{4}$/;
                            return regex4.test(phone);
                        }

                        const inputEmail = form.user_email;
                        const emailMsg = document.getElementById('userEmail');
                        
                        function checkEmail(userEmail) {
                            if (userPhone === '') {
                                emailMsg.textContent = '이메일을 입력해주세요.';
                                return;
                            }
    						
                            var xhr = new XMLHttpRequest();
                            xhr.open("GET", "/checkEmail?userEmail=" + encodeURIComponent(userEmail), true);
                            xhr.onreadystatechange = function () {
                            	const emailVal = inputEmail.value;
                                if (xhr.readyState == 4 && xhr.status == 200) {
                                    var result = xhr.responseText;
                                    if (result === "available") {
                                    	if(isValidEmail(emailVal)){
                                    		emailMsg.textContent = '사용가능한 이메일입니다.'
                                    	}else{
                                    		emailMsg.textContent = '올바른 이메일을 입력해주세요'
                                    	}
                                    		
                                    } else if(result === "unavailable") {
                                       emailMsg.textContent = '이미 사용 중인 이메일입니다.';
                                    }else{
                                    	emailMsg.textContent = '오류가 발생하였습니다.'
                                    }
                                }
                            };
                            		xhr.send();
                          }

                        function isValidEmail(email){
                            const regex5 = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                            return regex5.test(email);
                        }
                    
                        

                        function createUserForm(){
                			const form = document.create_account_form;
                			if(!form.user_id.value){
                				//form.user_id.value - > 비어있는 문자열 -> false -> ! -> true
                				alert("아이디를 입력하세요.");
                				form.user_id.focus();
                			}else if(!form.user_pw.value){
                				alert("비밀번호를 입력하세요.");
                				form.user_pw.focus();
                			}else if(!form.user_pw_check.value){
                				alert("비밀번호 확인을 입력하세요.")
                				form.user_pw_check.focus();
                			}else if(form.user_pw.value != form.user_pw_check.value){
                				alert("비밀번호가 일치하는지 확인하세요.");
                				form.user_pw_focus();
                			}else if(!form.user_name.value){
                				alert("닉네임을 입력하세요.");
                				form.user_name.focus();
                			}else{
                				form.submit();
                			}
                			
                			
                		}
                </script>


    </body>

    </html>