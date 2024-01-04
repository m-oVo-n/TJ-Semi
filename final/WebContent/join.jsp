<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="css/join.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
	<header>
		<div class="headDiv">
			<ul class="head">
				<li class="bigTitle"><a href="main.jsp">YATA</a></li>
				
				<li>
					<ul class="right">
						<li class="language">
							<select name="language" id="language">
								<option value="한국어">한국어</option>
								<option value="영어">English</option>
								<option value="중국어">中文</option>
								<option value="일본어">日本語</option>
							</select>
						</li>
						<li class="myres"><a href="myPage.m" >마이페이지</a></li>
	<%
		String session_id = (String)session.getAttribute("ID");
		if(session_id==null){
	%>
						<li class="login"><a href="login.jsp" >로그인</a></li>
	<%
		}else{
	%>
						<li class="login"><a href="logout.m">로그아웃</a></li>
	<%
		}
	%>
					</ul>
				</li>
			</ul>
		</div>
	</header>
    <section class="bg-light"><!-- 회원가입 전체 부분-->
        <div class="container py-5 container1">
            <div class="py-4 text-center">
                <span class="h1 text-center">회원가입</span>
            </div>
            <form action="add.m" onsubmit="checkAndSubmit(event)" id="addForm"><!--시작해보자-->
                <div class="row py-2"><!-- 아이디-->
                    <div class="col-sm-3 px-4"><label for="inputId" class="form-label mt-1">아이디</label></div>
                    <div class="col-sm-6"><input type="text" class="form-control" name="inputId" id="inputId" placeholder="아이디 입력"
                            required="required" autocomplete="username"></div>
                    <div class="col-sm-3"><button class="btn btn-secondary" type="button">중복확인</button></div>
                </div>
                <div class="row row-cols-2 py-2"> <!--비밀번호-->
                    <div class="col-sm-3 px-4"><label class="form-label mt-1" for="inputPw"
                            placeholder="비밀번호 입력">비밀번호</label></div>
                    <div class="col-sm-6"><!-- 열 크기 조정 -->
                        <div class="input-group"><!-- input과 button을 감싸는 div 추가 -->
                            <input type="password" class="form-control" name="inputPw" id="inputPw" required="required"
                                autocomplete="new-password">
                            <button class="btn btn-outline-light" type="button" id="p_button1" onclick="togglePassword()">
                                <i class="fa-solid fa-eye"></i></i></button>
                        </div>
                        <small>
                            <p id="passwordMessage" style="display:none;" class="m-auto my-1"></p>
                        </small>
                    </div>
                </div>
                <div class="row row-cols-2 py-2"><!--비밀번호 재확인-->
                    <div class="col-sm-3 text-center"><label class="form-label" for="checkPw"
                            placeholder="비밀번호 확인">&nbsp;비밀번호 확인</label></div>
                    <div class="col-sm-6">
                        <div class="input-group"><!-- input과 button을 감싸는 div 추가 -->
                            <input type="password" class="form-control" name="checkPw" id="checkPw" required="required"
                            autocomplete="new-password">
                            <button class="btn btn-outline-light" type="button" id="p_button2" onclick="togglePassword()">
                                <i class="fa-solid fa-eye"></i></i></button>
                        </div>
                        <small>
                            <p id="checkMsg" style="display:none;" class="m-auto my-1"></p>
                        </small>
                    </div>
                </div>


                <div class="row row-cols-2 py-2"><!--이름 -->
                    <div class="col-sm-3 px-4"><label for="inputName" class="form-label mt-1" placeholder="이름 입력"
                            >이름</label></div>
                    <div class="col"><input type="text" class="form-control" name="inputName" id="inputName" required="required"></div>
                </div>

                <div class="row row-cols-3 py-2"> <!-- 생년월일-->
                    <div class="col-sm-3 px-4"><label for="inputBirth" class="form-label mt-1">생년월일</div>
                    <div class="col-sm-6"><input type="text" class="form-control" name="inputBirth" id="inputBirth" maxlength="10"
                            placeholder="생년월일만 입력" required="required">
                            <small>
                                <p id="birthMsg" style="display:none;" class="m-auto my-1"></p>
                            </small>
                    </div>
                </div>

                <div class="row row-cols-2 py-2"><!--성별-->
                    <div class="col-sm-3 px-4"><label for="gender" class="form-lable mt-1">성별</label>
                    </div>
                    <div class="col"><select class="form-select" name="gender" id="gender">
                            <option value="남자">남자</option>
                            <option value="여자">여자</option>
                        </select></div>
                </div>
            
                <div class="row row-cols-3 py-2"> <!-- 전화번호-->
                    <div class="col-sm-3 px-4"><label class="form-label mt-1">전화번호</div>
                    <div class="col-sm-3"><select class="form-select" name="selectNum" id="selectNum">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="02">02</option>
                        <option value="070">070</option>
                    </select></div>
                    <div class="col-sm-4"><input type="text" class="form-control" name="inputNum" id="inputNum" required="required" maxlength="9" 
                                            placeholder="번호 8자리만">
                        <small>
                            <p id="telMsg" style="display:none;" class="m-auto my-1"></p>
                        </small>                    
                    </div>
                </div>

                <div class="row row-cols-2 py-2"><!--이메일-->
                    <div class="col-sm-3 px-4"><label for="inputEmail" class="form-label mt-1">이메일</label></div>
                    <div class="col-sm-3"><input type="text" class="form-control" name="emailId" id="inputEmailId" required="required" placeholder="id만 입력">
                    </div>
                    <div class="col-sm-4">
                        <select id="selectEmail" name="selectEmail" class="form-select">
                            <option value="naver.com">@naver.com</option>
                            <option value="hanmail.net">@hanmail.net</option>
                            <option value="nate.com">@nate.com</option>
                            <option value="gmail.com">@gmail.com</option>
                            <option value="daum.net">@daum.net</option>
                            <option value="korea.com">@korea.com</option>
                        </select>
                    </div>
                </div>
        </div>

        <div class="container py-5 container2"><!--약관동의-->
            <p class="container2_font">약관동의</p>
            <hr style="border-color:#00CED1">
            <div class="form-check pb-2">
                <input class="form-check-input" type="checkbox" value="agree1" name="check1" id="check1" required="required">
                <label class="form-check-label" for="defaultCheck1">
                    회원가입 약관에 동의합니다.(필수)
                </label>
            </div>
            <div class="form-check pb-2">
                <input class="form-check-input" type="checkbox" value="agree2" name="check2" id="check2" required="required">
                <label class="form-check-label" for="defaultCheck2">
                    개인정보 수집 및 이용에 동의합니다.(필수)
                </label>
            </div>
            <div class="form-check pb-2">
                <input class="form-check-input" type="checkbox" value="agree3" name="check3" id="check3">
                <label class="form-check-label" for="check3">
                    마케팅 정보 공유에 동의합니다.(선택)<br>
                    <div class="form-check form-check-inline pt-2">
                        <input class="form-check-input" type="checkbox" name="check3_sub" id="checkbox1" value="email" disabled>
                        <label class="form-check-label" for="check3">이메일</label>
                    </div>
                    <div class="form-check form-check-inline pt-2">
                        <input class="form-check-input" type="checkbox" name="check3_sub" id="checkbox2" value="mms" disabled>
                        <label class="form-check-label" for="check3">MMS</label>
                    </div>
                </label>
            </div>
            
            <hr>
            <div class="button"> <!-- 제출버튼-->
                <button class="btn btn-primary"
                    type="reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                <button class="btn btn-primary" type="submit">회원가입 완료</button>
            </div>
            </form>
        </div>
    </section>
<footer>
		<div class="f">
			<a class="yata" href="main.jsp">YATA</a>
			<a href="./footer/footer1.html">저작권 설명</a> 
			<a href="./footer/footer2.html">이용약관</a>
			<a href="./footer/footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
    <script src="./js/join.js"></script>
</body>

</html>