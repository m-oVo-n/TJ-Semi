<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="css/myReservation.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
    <div class="container"><!--보이는 화면 전체 컨테이너-->
        <section class="section">
            <div class="section1">
                <div class="div1">${date }</div>
                <div class="div2">티켓 ${quantity }매</div>
            </div>

            <div class="container py-4"> <!--section2 서울 > 부산 묶음 박스-->
                <div class="row justify-content-center section2">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-3 py-1 text-center">
                        <p class="d-area">${trans.departure_station }</p><p class="">${schedule.departure_time }</p>
                    </div>
                    <div class="col-sm-4 py-1 text-center m-auto"> > </div>
                    <div class="col-sm-3 py-1 text-center">
                        <p>${trans.arrival_station }</p><p>${schedule.arrival_time }</p>
                    </div>
                    <div class="col-sm-1 py-1"></div>
                </div>
            </div>

            <div class="container w-75 px-5 py-3 section3"> <!--ktx ,차내시설, 열차시각 묶음-->
                <div class="row">
                    <div class="col-sm-4 fs-4 fw-bold">${trans.transportation_type } ${trans.transportation_number }</div>
                    <div class="col-sm-3"></div>
                    <div class="col-sm-5 text-center">
                        <button class="btn btn-light"><a href="seat.jsp" class="text-black">좌석위치</a></button>
                        <button class="btn btn-light"><a href="seat.html" class="text-black">열차시각</a></button>
                    </div>
                </div>
            </div>
            <div class="container w-75 p-3 mt-5 section4"><!-- 타는곳번호 한 줄 + 내용  + 승차권번호 까쥐-->
                <div class="row  p-4 justify-content-around">
                    <div class="col-sm-4  fs-5 fw-bold">타는 곳 번호</div>
                    <div class="col-sm-4 text-center fs-5 fw-bold">호차번호</div>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-2 text-start fs-5 fw-bold">좌석번호</div>
                </div>
                <div class="row p-4 section4-1">
                    <div class="col-sm-4  fs-1 fw-bold">15번</div>
                    <div class="col-sm-4 text-center fs-1 fw-bold">${trans.transportation_number }호차</div>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-2 fs-1 fw-bold">
                    		<c:forEach var="seat" items="${seat }" step="1">
								${seat.seat_number }f&nbsp;   
							</c:forEach>
					</div>
                </div>
                <form action="deletePay.p" action="post" id="formTag">
                <div class="row p-4">
                    <div class="col-sm-2">결제번호</div>
                    <div class="col-sm-8"></div>
                    <div class="col-sm-2">
							<input type="hidden" name="paymentId" value="${payment.payment_id}">${payment.payment_id }   
                    </div>
                </div>
                <div class="row py-4 text-center"><!-- 버튼 (여정변경, 예매취소)-->
                    <div class="col-sm-6"><button class="btn fw-bold text-white fs-4 text-center button" id="changeTicket" type="button">메인으로 가기</button>
                    </div>
                    <div class="col-sm-6"><button class="btn fw-bold text-white fs-4 text-center button" id="resetTicket" type="button">예매 취소</button>
                    </div>
                </div>
                </form>
                <div class="container bg-white w-100 py-3 section5"><!--수수료 환불 규정-->
                    <p class="fs-5 fw-bold">수수료 환불 규정</p>
                    <ul class="fs-6">
                        <p class="fw-bold ">- 월요일 ~ 목요일</p>
                        <li class="px-2">당일 출발 3시간 전까지 KTX 환불 수수료는 무료</li>
                        <li class="px-2">출발 3시간 전부터 출발시간 전까지 KTX 환불 시 5%의 환불 수수료 발생</li>
                        <br>
                         <p class="fw-bold "> -금요일 ~ 일요일, 공휴일, 명절 특별수송기간 승차권</p>
                        <li class="px-2">출발 1일 전까지 KTX 환불 시 400원 (구매일 포함 7일내 환불시 무료)</li>
                        <li class="px-2">출발 3시간 전 ~ 출발시간 전까지 환불시 10% 환불 수수료 발</li>
                        <br>
                         <p class="fw-bold "> -KTX 출발 후 환불시</p>
                        <li class="px-2">출발 후 20분까지는 15% 환불 수수료 발생</li>
                        <li class="px-2">20분 경과 후 ~ 60분까지는 40% 환불 수수료 발생</li>
                        <li class="px-2">60분 경과 후 ~ 도착 시에는 70% 환불 수수료 발생</li>
                    </ul>
                </div>
            </div>
        </section>
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
<script type="text/javascript">
    document.getElementById("changeTicket").addEventListener('click',function(){
        window.location="main.jsp";
    });
    
    document.getElementById("resetTicket").addEventListener('click',function(){
        var answer= confirm("정말 취소하시겠습니까?");
        if(answer){
            document.getElementById("formTag").submit();
        }else{
            return false;
        }
    })
</script>
</html>