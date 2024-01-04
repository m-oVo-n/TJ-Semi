<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko" data-bs-theme="auto">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>로그인</title>
  <script src="./js/color-modes.js"></script>
  <script src="./js/bootstrap.bundle.min.js"></script>
  <script src="./js/login.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
  <link href="./css/bootstrap.min.css" rel="stylesheet">
  <link href="./css/login.css" rel="stylesheet">
</head>
<body>
<header>
		<div class="headDiv">
			<ul class="head">
				<li class="bigTitle"><a href="main.jsp" >YATA</a></li>
				
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

  <section class="bg-light">
    <form action="login.m"> <!-- 헤더 밑 푸터 위 전체 구역-->
      <div class="container py-5 "><!--헤더 밑 푸터위 전체 구역 컨테이너-->
        <div class="form-signin py-4 m-auto border-r 	login_bg"> <!-- 로그인화면 뒷 배경(박스)-->
          <h1 class="h1 text-white" >YATA</h1> <!--로그인 창 로고-->

          <div class="form-floating"> <!-- Username-->
            <input type="text" class="form-control" name="userId" id="userName" placeholder="name@example.com" autocomplete="username">
            <label for="userName">Username</label>
          </div>
          <div class="form-floating"><!-- 비밀번호-->
            <input type="password" class="form-control" name="userPw" id="userPw" placeholder="Password" autocomplete="current-password">
            <label for="userPw" >Password</label>
          </div>

          <div class="form-check text-start mt-3"> <!-- 아이디 저장할거니??-->
            <input class="form-check-input" type="checkbox" name="remebberMe" id="rememberMe" onclick="saveUsername()">
            <label class="form-check-label text-white" for="rememberMe">
              아이디 저장
            </label>
            <br>
            <div class="find p-3 pb-5 d-flex "> <!--아이디찾기, 비밀번호 찾기-->
              <div class="mx-3"><a href="findId.jsp" class="text-white" >아이디 찾기</a></div>
              <div class="mx-2 text-center"><a href="findPw.jsp" class="text-white" >비밀번호 찾기</a></div>
            </div>
          </div>

          <div class="button pb-2"><!--로그인 , 회원가입 버튼-->
            <button class="btn btn-light" type="submit">&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;</button>
            <button class="btn btn-light" type="button"onclick="location.href='join.jsp'">&nbsp;회원가입&nbsp;</button>
          </div>

        </div>
      </div><!--로그인 폼-->
    </form>
    </main>
  </section>
<footer>
		<div class="f">
			<a class="yata" href="main.jsp">YATA</a>
			<a href="./footer/footer1.html">저작권 설명</a> 
			<a href="./footer/footer2.html">이용약관</a>
			<a href="./footer/footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
  <script>

  </script>
</body>

</html>