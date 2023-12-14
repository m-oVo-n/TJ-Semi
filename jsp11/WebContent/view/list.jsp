<%@page import="dao.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk(ab_id) {
		pwd = prompt("수정/삭제 하려면 비밀번호를 입력해주세요");
		document.location.href="MemberFrontController?cmd=member_info&id="+ab_id+"&pass="+pwd;
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
	<jsp:useBean id="datas" class="dao.MemberDAO" scope="page"/>
	<%
		Vector<MemberDTO> members = (Vector<MemberDTO>) request.getAttribute("list");
	%>
	<div align="center">
		<h2>전체회원 목록</h2>
		<hr>
		<form>
			[<a href="./view/register_form.jsp">신규회원 등록하기</a>]<p>
			
			<table border="1" align="cener">
				<tr bgcolor="#99ccff">
					<th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th><th>이메일</th><th>가입일</th>
				</tr>
				<%
					for(MemberDTO member : members) {
				%>
						<tr>
							<td><a href="javascript:onclick=chk('<%=member.getId()%>')"><%=member.getId() %></a></td>
							<td><%=member.getPass() %></td>
							<td><%=member.getName() %></td>
							<td><%=member.getPhone() %></td>
							<td><%=member.getEmail() %></td>
							<td><%=member.getReg_date() %></td>
						</tr>
				<%
					}
				%>
			</table>
		</form>
	</div>
</body>
</html>