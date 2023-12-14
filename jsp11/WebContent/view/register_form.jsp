<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	div{
		padding : 50px;
		width:500px; height:400px;
		background-color: #f0fff0;
		text-align: center;
		box-shadow: 0px 1px 1px lightgray;
		position : absolute;
		top:30%; left:40%;
	}
	
	h3{margin-bottom: 100px;}
	
	table{
		text-align: center;
		margin-top: 50px; margin-bottom: 30px;
		border: 1px solid gray;
		border-collapse: collapse;
		background-color: #f8f8ff;
		width:500px; height:150px;
	}
	
	input{
		text-align: left;
		border:0px;
		width:99%; height:99%;
		margin:0px;
	}
	
	#btn{
		text-align: center;
		width:80px; height:30px;
		box-shadow: 1px 1px darkgray;
	}
	
	a{text-decoration: none;}
	a:hover{text-decoration: underline;}
	
	font{
		font-size: 20px;
		font-weight: border;
	}
	/*
	.h{}
	*/
	
</style>
</head>
<body>
	<div>
		<h2>신규 회원가입 페이지</h2>
		<form action="../MemberController" method="get">
			<input type="hidden" name="cmd" value="member_register">
			<table border="1">
				<tr><td>아 이 디</td><td><input type="text" name="id"></td></tr>
				<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
				<tr><td>이      름</td><td><input type="text" name="name"></td></tr>
				<tr><td>전화번호</td><td><input type="text" name="phone"></td></tr>
				<tr><td>이 메 일</td><td><input type="text" name="email"></td></tr>
				<tr><td colspan="2"><input id="btn" type="submit" value="회원가입"></td></tr>
			</table>
		</form>
	</div>
</body>
</html>