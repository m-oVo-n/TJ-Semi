<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/findIdResult.css" type="text/css">
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
						<li class="myres"><a href="myPage.m">마이페이지</a></li>
						<li class="login"><a href="login.jsp">로그인</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</header>
	<div id="showFoundId">
		<div class="textDiv">
			<p class="title">회원 아이디</p>
			<hr>
			<br>
			<p>회원님의 비밀번호는 <span>${FOUNDPW }</span> 입니다</p>
			<a href="login.jsp">로그인하러 가기</a>
		</div>
	</div>
	<footer>
		<div class="f">	
			<a class="yata" href="main.jsp">YATA</a>
			 <a href="./footer/footer1.html">저작권 설명</a>
			  <a href="./footer/footer2.html">이용약관</a> 
			  <a href="./footer/footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
</body>
</html>