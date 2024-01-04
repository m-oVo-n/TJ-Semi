<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="./css/updateMember.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
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
    <section class="section pt-5">
        <div class="bg-white p-3 container">
            <div class="py-4 text-center" style="border-bottom: 1px solid gray;">
                <span class="h1 text-center text-black">회원정보</span>
            </div>
            <form action="update.m" onsubmit="return submit()"><!--시작해보자-->
                <div class="row py-3 m-0" style="border-bottom:1px solid #e4e5ea;"><!-- 아이디-->
                    <div class="col-sm-1 "></div>
                    <div class="col-sm-2 py-2 fw-bold text-center"><label class="form-label" for="id"></label>아이디</div>
                    <div class="col-sm-6"><input type="text" class="form-control" name="id" id="id" placeholder="아이디 입력" value="${MEMBER.member_id }" readonly></div>
                    <div class="col-sm-3"></div>
                </div>
              
                <div class="row py-3 m-0" style="border-bottom:1px solid #e4e5ea;"><!--이름-->
                    <div class="col-sm-1 "></div>
                    <div class="col-sm-2 py-2 fw-bold text-center"><label class="form-label" for="name`">이름</div>
                    <div class="col-sm-6"><input type="text" class="form-control" name="name" id="name" value="${MEMBER.name }" readonly></div>
                    <div class="col-sm-3"></div>
                </div>
                <div class="row py-3 m-0" style="border-bottom:1px solid #e4e5ea;"><!--생년월일-->
                    <div class="col-sm-1 "></div>
                    <div class="col-sm-2 py-2 fw-bold text-center"><label class="form-label" for="birth"></label>생년월일</div>
                    <div class="col-sm-6"><input type="text" class="form-control" name="birth" id="birth" placeholder="생년월일 입력" value="${MEMBER.birth }" readonly></div>
                    <div class="col-sm-3"></div>
                </div>
                <div class="row py-3 m-0" style="border-bottom:1px solid #e4e5ea;"> <!-- 전화번호-->
                    <div class="col-sm-1"></div>
                    <div class="col-sm-2 py-2 fw-bold text-center"><label class="form-label">전화번호</div>
                    <div class="col-sm-2"><select class="form-select" name="selectNum" id="selectNum">
                    	<option value="${NUM1 }" selected hidden>${NUM1 }</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="02">02</option>
                        <option value="070">070</option>
                    </select></div>
                    <div class="col-sm-4"><input type="text" class="form-control" name="updateNum2" id="updateNum2" required="required" maxlength="9" value="${NUM2 }" 
                                            placeholder="번호 8자리만">
                    </div>
                </div>
                <div class="row py-3 m-0 mb-2"><!--이메일-->
                    <div class="col-sm-1 "></div>
                    <div class="col-sm-2 fw-bold text-center"><label class="form-label"  for="updateEmail" >이메일</label></div>
                    <div class="col-sm-3"><input type="text" class="form-control" name="updateEmail" id="updateEmailId" placeholder="Email 입력" value="${EMAILID }" required="required"></div>
                    <div class="col-sm-3">
                        <select id="updateSelectEmail" name="updateSelectEmail" class="form-select">
                        <option value="${EMAILE }" selected hidden>@${EMAILE }</option>
                        <option value="naver.com">@naver.com</option>
                        <option value="hanmail.net">@hanmail.net</option>
                        <option value="nate.com">@nate.com</option>
                        <option value="gmail.com">@gmail.com</option>
                        <option value="daum.net">@daum.net</option>
                        <option value="korea.com">@korea.com</option>
                    </select>
                </div>
                </div>
                <div class="button text-center"> <!— 제출버튼—>
                    <button class="btn btn-primary me-3" type="submit">회원정보 수정</button>
                    <button class="btn btn-primary " type="reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
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
    </div>
</body>
<script src="./js/updateMember.js"></script>
</html>