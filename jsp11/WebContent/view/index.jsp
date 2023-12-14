<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	div {
		padding: 50px;
		width: 500px;
		height: 400px;
		background: #f0fff0;
		text-align: center;
		box-shadow: 0px 1px 1px lightgray;
		position: absolute;
		top: 10%;
		left: 30%;
	}
	h3{
		margin-bottom: 100px;
	}
	table {
		text-align: center;
		margin-top: 50px;
		margin-bottom: 30px;
		border: 1px solid gray;
		border-collapse: collapse;
		background: #f8f8ff;
		width: 500px;
		height: 150px; 
	}
	input {
		text-align: left;
		border: 0px;
		width: 99%; height: 99%;
		margin: 0px;
	}
	#btn {
		text-align: center;
		width: 80px;
		height: 30px;
		box-shadow: 1px 1px darkgray;
	}
	a {
		text-decoration: none;
	}
	a:hover {
		text-decoration: underline;
	}
	font {
		font-size: 20px;
		font-weight: bolder;
	}
	.h {
		background: lightgray;
	}
</style>
<title>index</title>
</head>
<body>
	<div>
		<h2>환영합니다!<br>로그인이나 신규회원가입을 진행해 주십시오</h2>
		<form action="../MemberFrontController" method="get">
			<input type="hidden" name="cmd" value="member_login">
			<table border="1" align="center">
				<tr><td>아이디</td><td><input type="text" name="id"></td></tr>
				<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
				<tr><td colspan="2"><input id="btn" type="submit" value="로그인"></td></tr>
			</table><br>
			<a href="register_form.jsp">♥신규회원가입</a>
		</form>
	</div>
</body>
</html>