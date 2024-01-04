<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/completedPay.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
    <div class="container-expand">
        <section> <!--헤더 밑 첫번째 구역 전체-->
            <div class="text-center w-100 mb-3 div1">${date }</div>
				<div class="section1-1">
					<!-- 서울 -> 부산 -->
					<div class="result">
						<div class="py-4 text-center">
							<img src="./img/sky1.jpg" alt="airplane"><br> <br>
							<h3 class="tw-bold">${deTime }</h3>
							<br>
							<h4 class="tw-bold">${trans.departure_station }</h4>
						</div>
						<div class="py-4 m-auto">
							<h3 class="fw-bold fs-3 1mb-3">${trans.transportation_type }
								${trans.transportation_number }</h3>
							<br>
							<h4 class="tw-bold text-secondary">---${schedule.total_time }---</h4>
							<br><br><br>
						</div>
						<div class="py-4 text-center">
							<img src="./img/sky1.jpg" alt="airplane"><br> <br>
							<h3 class="tw-bold">${arrTime }</h3>
							<br>
							<h4 class="tw-bold">${trans.arrival_station }</h4>
						</div>
					</div>
				</div>
				<div class="text-center m-auto pt-3 pb-1">
					<!--항공사버튼,좌석, 운임,결제금액 구역-->
					<div class="row mb-3">
						<!--버튼 : 항공사  한 줄-->
						<div class="col-sm-5"></div>
						<div
							class="col-sm-1 p-2 bg-secondary rounded-2 text-white fw-bold">교통</div>
						<div class="col-sm-2 p-2">${trans.transportation_type }</div>
						<div class="col-sm-4"></div>
					</div>
					<div class="row mb-5">
						<!--좌석  한 줄-->
						<div class="col-sm-5"></div>
						<div
							class="col-sm-1 p-2 bg-secondary rounded-2 text-white fw-bold">좌석</div>
						<div class="col-sm-2 p-2">
							<c:forEach var="seat" items="${seat }" step="1">
								${seat.seat_number }f&nbsp;   
							</c:forEach>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<div class="row mb-3">
						<!--버튼 : 항공사  한 줄-->
						<div class="col-sm-5"></div>
						<div
							class="col-sm-1 p-2 bg-secondary rounded-2 text-white fw-bold">운임</div>
						<div class="col-sm-2 p-2">${quantity }매</div>
						<div class="col-sm-4"></div>
					</div>
                <div class="row"><!--좌석  한 줄-->
                    <div class="col-sm-5"></div>
                    <div class="col-sm-1 p-2 bg-secondary rounded-2 text-white fw-bold">결제금액</div>
                    <div class="col-sm-2 p-2">${payment.total_price }원</div>
                    <div class="col-sm-4"></div>
                </div>
            <div class="m-auto py-5 text-center">
                <h1 class="fw-bold mb-5">결제가 완료되었습니다.</h1>
                <a href="myReservation.p">나의 예약내역 확인</a>
            </div>

            </div><!--전체 -->

        </section>
    </div>
    <footer>
        <div class="f">
            <a class="yata">YATA</a>
            <a href="./footer/footer1.html">저작권 설명</a> 
            <a href="./footer/footer2.html">이용약관</a>
            <a href="./footer/footer3.html">개인정보 처리방침</a>
        </div>
    </footer>
</body>
</html>