<%@page import="dto.Seat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="css/seat.css?after" type="text/css">
</head>
<body>
	<header>
		<div class="headDiv">
			<ul class="head">
				<li class="title"><a href="main.jsp">YATA</a></li>
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
						<li class="login"><a href="login.html" >로그인</a></li>	<%
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
	%>					</ul>
				</li>
			</ul>
		</div>
        <div class="info">
            <div class="infoBox">
                <span>${trans.departure_station }</span>&nbsp;&nbsp;&nbsp;&#9658;&nbsp;&nbsp;&nbsp;<span>${trans.arrival_station }</span><br><br>
                <span class="count">전체 30 석</span>&nbsp;&nbsp;&nbsp;<span class="count">|</span>&nbsp;&nbsp;&nbsp;<span class="count">잔여 ${restSeat } 석</span>
            </div>
        </div>
	</header>
    
    <form action="seat.p" method="post">
    	<input type="hidden" value="${quantity }" id="q">
    	<input type="hidden" value="${param.classType }" id="t">
        <div class="seatBox">
            <ul class="special">
            	<c:forEach var="seat" items="${seatList }" begin="2" end="29" step="3">
            		<li id="${seat.seat_number }" class="s${seat.is_available }"><label><input type="checkbox" name="seatId" value="${seat.seat_id}.${seat.seat_number}" onclick="chk(this)">${seat.seat_number }</label></li>
            	</c:forEach>
            </ul>
            <ul class="aisle">
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;&nbsp;&nbsp;&nbsp;&nbsp;
                &#9658;
            </ul>
            <ul class="normal">
            	<c:forEach var="seat" items="${seatList }" begin="1" end="28" step="3">
            		<li id="${seat.seat_number }" class="s${seat.is_available }"><label><input type="checkbox" name="seatId" value="${seat.seat_id}.${seat.seat_number}" onclick="chk(this)">${seat.seat_number }</label></li>
            	</c:forEach>
            </ul>
            <ul class="normal">
            	<c:forEach var="seat" items="${seatList }" begin="0" end="27" step="3">
            		<li id="${seat.seat_number }" class="s${seat.is_available }"><label><input type="checkbox" name="seatId" value="${seat.seat_id}.${seat.seat_number}" onclick="chk(this)">${seat.seat_number }</label></li>
            	</c:forEach>
            </ul>
        </div>
        <div class="totalP">
            <ul>
                <li>총 금액</li>
                <li>${addPrice } 원</li>
            </ul>
        </div>
        <input type="submit" value="결제하기">
    </form>
    
	<footer>
		<div class="f">
			<a class="yata" href="main.jsp">YATA</a>
			<a href="./footer/footer1.html">저작권 설명</a> 
			<a href="./footer/footer2.html">이용약관</a>
			<a href="./footer/footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
	<script type="text/javascript">
	function chk(obj) {
		const checkedT = document.querySelectorAll('input[type="checkbox"]:checked');
		console.log(checkedT.length);
		const quantity = parseInt(document.getElementById("q").value);
		if(checkedT.length > quantity) {
			alert(quantity + "자리가 이미 선택되었습니다.");
			obj.checked = false;
		}
	}
	console.log(document.getElementById("t").value);
	if (document.getElementById("t").value == "special") {
		let normals = document.querySelectorAll(".normal li");
		for(normal of normals) {
			normal.setAttribute("class", "sfalse");
		}
	} else {
		let specials = document.querySelectorAll(".special li");
		for(special of specials) {
			special.setAttribute("class", "sfalse");
		}
	}
	</script>
</body>
</html>