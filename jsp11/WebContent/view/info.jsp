<%@page import="dao.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<script type="text/javascript">
	function chk(m_id) {
		pwd = prompt("비밀번호를 입력해주세요");
		if(pwd == frm.pass.value) {
			document.location.href="MemberFrontController?cmd=member_delete&ID="+m_id+"&pass="+pwd;
		} else {
			alert("비밀번호가 틀립니다.");
			history.go(0);
		}
	}
</script>
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
</head>
<body>
	<div>
	<%
	request.setCharacterEncoding("utf-8");

	String session_id = (String)session.getAttribute("ID");
	MemberDTO member = (MemberDTO) request.getAttribute("member");
	String id = member.getId();
	if(session_id != null) {
		out.print("<form action='MemberFrontController' name='frm' method='get' >");   /*주소주의: 아직 request안이다 그래서 ../안해야한다. */
        out.print("<input type='hidden' name='cmd'  value='member_update'>");   /* hidden으로 보낸다 */
        out.print("<table border=1>");
        out.print("<tr><th colspan=2><font>회원 정보</font></th></tr>");
        out.print("<tr class='h'><td>아이디</td><td><input  class='h' readeonly type='text' name='id' value='"+member.getId()+"'></td></tr>");
        out.print("<tr><td>비밀번호</td><td><input type='password' name='pass' value='"+member.getPass()+"'></td></tr>");
        out.print("<tr><td>이름</td><td><input type='text' name='name' value='"+member.getName()+"'></td></tr>");
        out.print("<tr><td>전화번호</td><td><input type='text' name='phone' value='"+member.getPhone()+"'></td></tr>");
        out.print("<tr><td>이메일</td><td><input type='text' name='email' value='"+member.getEmail()+"'></td></tr>");
        out.print("<tr><td>가입날짜</td><td>"+member.getReg_date()+"</td></tr>");
        out.print("<tr><td colspan=2><input id='btn' type='submit' value='수정'></td></tr>");
        out.print("</table>");
        out.print("</form>");
	} else {
		
	}
	%>
	<a href="MemberFrontController?cmd=member_list">전체회원</a>&nbsp;&nbsp;
	<a href="MemberFrontController?cmd=member_logout">로그아웃</a>&nbsp;&nbsp;
	<a href="javascript:chk('<%=member.getId() %>')"><%=member.getName() %>님 회원탈퇴</a>&nbsp;&nbsp;
	</div>
</body>
</html>