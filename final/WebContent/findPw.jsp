<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link href="./css/findId.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
	<header>
		<div class="headDiv">
			<ul class="head">
				<li class="bigTitle"><a href="main.jsp">YATA</a></li>

				<li>
					<ul class="right">
						<li class="language"><select name="language" id="language">
								<option value="한국어">한국어</option>
								<option value="영어">English</option>
								<option value="중국어">中文</option>
								<option value="일본어">日本語</option>
						</select></li>
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
	<section class="section bg-light">
		<!-- 아이디 찾기 전체 부분(뒷 배경)-->
		<div class="py-4 text-left container1">
			<span class="fs-2">비밀번호 찾기</span>
		</div>
		<!-- 아이디 찾기 대문짝 글씨 끄읕-->
		<div class="p-5  mb-5 bg-white container1">
			<!-- 첫번째 박스 구역 (휴대전화 인증, 이메일 인증)-->
			<form action="findPwP.m" >
				<!--시작해보자-->
				<div class="form-check ">
					<!-- 휴대전화로 인증 구역-->
					<label class="form-check-label" for="certification"> <input
						class="form-check-input" type="radio" name="certification"
						id="certification1" value="display1" checked> 회원정보에 등록한
						휴대전화로 인증
					</label>
					<p>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 인증번호를 받을수 있습니다.</p>

					<div class="certification" id="display1">
						<!--display: none으로 숨겨질 구역-->
					
						<div class="row px-1 py-4 ">
							<!--아이디-->
							<div class="col-sm-2 ">
								<label for="inputId" class="form-label mt-1">아이디</label>
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="inputId"
									id="c1_inputId" placeholder="아이디를 입력해주세요" required>
							</div>
						</div>
						<div class="row px-1 py-2">
							<!--휴대전화-->
							<div class="col-sm-2">
								<label class="form-label mt-1">휴대전화</label>
							</div>
							<div class="col-sm-2">
								<select class="form-select" name="selectNum" id="c1_selectNum">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="02">02</option>
									<option value="070">070</option>
								</select>
							</div>
							_
							<div class="col-sm-2 ">
								<input type="text" class="form-control" name="inputNum1"
									id="c1_inputNum1" placeholder="전화번호 4자리" minlength="4"
									maxlength="4" required="required">
							</div>
							_
							<div class="col-sm-2">
								<input type="text" class="form-control" name="inputNum2"
									id="c1_inputNum2" placeholder="전화번호 4자리" minlength="4 "
									maxlength="4" required="required">
							</div>
							<div class="col-sm-3">
								<button class="btn btn-secondary text-white" type="button"
									id="c1_verifyButton" disabled>인증번호받기</button>
								<p id="c1_verifyCode"></p>
							</div>
						</div>
						<!--휴대전화 한줄 완성-->

						<div class="row px-1 py-2">
							<!--휴대전화 인증번호-->
							<div class="col-sm-2"></div>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="confirmVerify"
									id="c1_confirmVerify" placeholder="인증번호 6자리 입력하세요">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-secondary text-white" type="submit"
									data-toggle="modal" id="c1_confirmButton" data-target="#Modal1"
									disabled>&nbsp;&nbsp;&nbsp;&nbsp;확인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</button>
							</div>
						</div>
						<!-- Modal -->
						<%-- <div class="modal fade" id="Modal1" tabindex="-1">
							<div
								class="modal-dialog modal-dialog-centered d-flex align-items-center ">
								<div class="modal-content text-center p-2">
									<div class="modal-header">
										<h5 class="modal-title fw-bold">비밀번호 재설정</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body p-5">
										<div class="row">
											<div class="mb-3 col-sm- pb-4 text-center">
												<span class="form-label">
												당신의 현재 비밀번호는 ${FOUNDPW }입니다!<br>
												비밀번호 변경페이지로 이동해<br> 비밀번호를 변경해보세요!
												</span>
											</div>
											<div class="mb-3 col-sm-12">
												<button type="button" class="btn btn-secondary"
													type="submit" style="width: 90%;">
													<a href="changePw.html"
														class="text-decoration-none text-white">비밀번호 변경하기</a>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> --%>
						<!-- Modal 끝 -->
					</div>
					<!--휴대전화 인증번호 끝-->
				</div>
				<!--display:none구역 끝-->
				<!--휴대폰 번호로 인증 div박스 끄읕-->
				<hr>
				</form>
				<!-- -------------------------------------------------------------------------------------------------------------------->
				<form action="findPwE.m">
				<div class="form-check">
					<!--본인확인 이메일 인증구역-->
					<label class="form-check-label" for="certification"> <input
						class="form-check-input" type="radio" name="certification"
						id="certification2" value="option2"> 본인확인 이메일로 인증
					</label>
					<div class="certification" id="display2">
						<!--display:none구역-->
						<div class="row px-1 py-2">
							<!--이름-->
							<div class="col-sm-2">
								<label for="inputId" class="form-label mt-1" required>아이디</label>
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="inputId"
									id="c2_inputId" placeholder="아이디를 입력해주세요 " required>
							</div>
						</div>
						<!--이름 끝-->
						<div class="row px-1 py-2">
							<!--이메일-인증번호 받기-->
							<div class="col-sm-2">
								<label for="inputEmailId" class="form-label mt-1">이메일</label>
							</div>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="inputEmailId"
									id="c2_inputEmailId" required="required">
							</div>
							@
							<div class="col-sm-3">
								<select id="c2_selectEmail" name="selectEmail"
									class="form-select">
									<option value="naver.com">@naver.com</option>
									<option value="hanmail.net">@hanmail.net</option>
									<option value="nate.com">@nate.com</option>
									<option value="gmail.com">@gmail.com</option>
									<option value="daum.net">@daum.net</option>
									<option value="korea.com">@korea.com</option>
								</select>
							</div>
							<div class="col-sm-3">
								<button class="btn btn-secondary text-white" type="button"
									id="c2_verifyButton" disabled>인증번호받기</button>
								<p id="c2_verifyCode"></p>
							</div>

						</div>
						<!--이메일-인증번호받기 -->

						<div class="row px-1">
							<!--이메일 - 인증번호 확인-->
							<div class="col-sm-2"></div>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="confirmVerify"
									id="c2_confirmVerify" placeholder="인증번호 6자리 입력하세요">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-secondary text-white" type="submit"
									data-toggle="modal" id="c2_confirmButton" data-target="#Modal2"
									disabled>&nbsp;&nbsp;&nbsp;&nbsp;확인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</button>
							</div>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="Modal2" tabindex="-1">
							<div
								class="modal-dialog modal-dialog-centered d-flex align-items-center ">
								<div class="modal-content text-center p-2">
									<div class="modal-header">
										<h5 class="modal-title fw-bold">비밀번호 재설정</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body p-5">
										<div class="row">
											<div class="mb-3 col-sm- pb-4 text-center">
												<span class="form-label">
												당신의 현재 비밀번호는 Semi1234입니다!<br>
												비밀번호 변경페이지로 이동해<br> 비밀번호를 변경해보세요!
												</span>
											</div>
											<div class="mb-3 col-sm-12">
												<button type="button" class="btn btn-secondary"
													type="submit" style="width: 90%;">
													<a href="changePw.html"
														class="text-decoration-none text-white">비밀번호 변경하기</a>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal 끝 -->

					</div>

				</div>
				<!--휴대전화 인증번호 끝-->
				<!--display:none구역 끝-->
				<!--이메일 - 인증번호 확인 끝-->
				<!--display:none-->
				<!--form-check태그 끝 -->
				<!--container1 끝(첫번째 박스 구역) -->
			</form>
		</div>
	</section>
	<!-- -------------------------------------------------------------------------------------------------------------------->
	<footer>
		<div class="f">
			<a class="yata" href="main.jsp">YATA</a> <a
				href="./footer/footer1.html">저작권 설명</a> <a
				href="./footer/footer2.html">이용약관</a> <a
				href="./footer/footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
	<script src="./js/findPw.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	
</body>