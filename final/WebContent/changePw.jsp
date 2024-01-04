<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="./css/changePw.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        <section class="section  bg-light w-100 pt-5">
            <div class="section1 bg-white p-3 mx-auto"><!-- section안 배경이 하얀 구역)-->
                <div class="py-4 text-center" style="border-bottom: 2px solid gray;">
                    <span class="h3 text-center text-black fw-bold">비밀번호 확인</span>
                </div>
        <form action="changePw.m"  onsubmit="return changePw()" id="formTag"><!--시작해보자-->
        <div class="row py-4 m-0" style="border-bottom:1px solid #e4e5ea;"><!--비밀번호-->
            <div class="col-sm-1 "></div>
            <div class="col-sm-3 py-2 fw-bold">현재 비밀번호</div>
            <div class="col-sm-6"><input type="password" class="form-control" id="Pw" name="Pw" placeholder="현재비밀번호 입력" required="required"></div>
            <div class="col-sm-3"></div>
        </div>
    
        <div class="row py-4 m-0" style="border-bottom:1px solid #e4e5ea;"> <!--비밀번호-->
            <div class="col-sm-1 "></div>
            <div class="col-sm-3 py-2 fw-bold"><label class="form-label" for="updatePw"
                    placeholder="비밀번호 입력">새 비밀번호</label></div>
            <div class="col-sm-6"><!-- 열 크기 조정 -->
                <div class="input-group"><!-- input과 button을 감싸는 div 추가 -->
                    <input type="password" class="form-control" name="updatePw" id="updatePw" required="required"
                        autocomplete="new-password" oninput="enablePasswordFields() " onblur="comparePassword1()">
                    <button class="btn btn-secondary" type="button" id="p_button1" onclick="togglePassword('p_button1')">
                        <i class="fa-solid fa-eye"></i></button>
                </div>
            </div>
        </div>

        <div class="row py-4 m-0" style="border-bottom:1px solid #e4e5ea;"> <!--비밀번호-->
            <div class="col-sm-1 "></div>
            <div class="col-sm-3 py-2 fw-bold"><label class="form-label" for="updatePwConfirm"
                    placeholder="비밀번호 입력">비밀번호 확인</label></div>
            <div class="col-sm-6"><!-- 열 크기 조정 -->
                <div class="input-group"><!-- input과 button을 감싸는 div 추가 -->
                    <input type="password" class="form-control" name="updatePwConfirm" id="updatePwConfirm" required="required"
                        autocomplete="new-password"  >
                    <button class="btn btn-secondary" type="button" id="p_button2" onclick="togglePassword('p_button2')">
                        <i class="fa-solid fa-eye"></i></button>
                </div>
            </div>
        </div>
        
        
        <div class="button text-end py-4 m-0"> <!-- 제출버튼-->
            <button class="btn btn-light" type="submit"  >비밀번호 변경</button>
            <button class="btn btn-light" type="reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
        </div>
    </form>
    </div>
    </section>
<footer>
		<div class="f">
			<a class="yata">YATA</a>
			<a href="./footer/footer1.html">저작권 설명</a> 
			<a href="./footer/footer2.html">이용약관</a>
			<a href="./footer/footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
   
</body>
<script src="./js/changePw.js"></script>
</html>