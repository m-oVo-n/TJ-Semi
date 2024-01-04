<%@page import="dto.Point"%>
<%@page import="dto.Schedule"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/pay.css" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script src="js/pay.js" type="text/javascript"></script>

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
	<div class="allSection">
		<form action="pay.p" method="post">
			<section class="section">
				<!--헤더 밑 첫번째 구역 전체-->
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
					<div class="row">
						<!--좌석  한 줄-->
						<div class="col-sm-5"></div>
						<div
							class="col-sm-1 p-2 bg-secondary rounded-2 text-white fw-bold">결제금액</div>
						<div class="col-sm-2 p-2">${addPrice }원</div>
						<div class="col-sm-4"></div>
					</div>
				</div>
				<!-- 항공사버튼,좌석, 운임,결제금액 구역 끝-->
			</section>
			<section class="section">
				<div class="title">마일리지</div>
				<div class="coupon">
					<div class="bg-white text-center align-middle rounded-4 AppCoupon">
						적용 가능한 마일리지 - 발급가능한 마일리지 확인 >
						<button type="button" class="btn btn-white fw-bold"
							data-bs-toggle="modal" data-bs-target="#Modal">내 마일리지 확인</button>

						<!-- Modal -->
						<div class="modal fade" id="Modal" tabindex="-1"
							aria-labelledby="ModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="ModalLabel">내 마일리지 조회</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p><input id="p" type="hidden" value="${point.point }">${point.point } P</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-primary"
											onclick="usePoint()">적용하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex m-auto coupon2">
					<div class="bg-white text-center align-middle rounded-4 m-auto userAmount">
						<input id="useP" type="text" placeholder="금액입력창" name="coupon" class="border-0 w-75 h-50 bg-white align-text-bottom" readonly="readonly">
					</div>
					<button type="button"
						class="btn btn-primary text-center rounded-4 userAll"
						onclick="usePoint()">모두 사용</button>
				</div>
			</section>
			<section class="section">
				<!--결제수단(section3) 시작-->
				<div class="title">결제 수단</div>
				<table class="table">
					<tr>
						<!--N pay-->
						<th scope="row" class="p-3">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="payment"
									value="nPay" id="check1"> <label
									class="form-check-label" for="nPay"> N PAY </label>
							</div>
						</th>
					</tr>

					<tr>
						<th scope="row" class="table-secondary p-3">
							<!--toss pay-->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="payment"
									value="tossPay" id="check2"> <label
									class="form-check-label" for="tossPay"> TOSS PAY </label>
							</div>
						</th>
					</tr>

					<tr>
						<th scope="row" class="p-3">
							<!--간편결제-->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="payment"
									value="easyPayment" id="check3"> <label
									class="form-check-label" for="easyPayment"> 신용/체크 등록
									간편결제 </label>
							</div>
						</th>
					</tr>

					<tr>
						<th scope="row" class="table-secondary p-3">
							<!--일반결제-->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="payment"
									value="generalPayment" id="check4"> <label
									class="form-check-label" for="generalPayment"> 신용/체크
									일반결제 </label>
							</div>
						</th>
					</tr>

					<tr>
						<th scope="row" class="p-3">
							<!--다른결제수단-->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="payment"
									value="otherPayment" id="check5"> <label
									class="form-check-label" for="otherPayment"> 다른
									결제수단(페이코 / 프리패스 / 정기권 / 프리미엄 마일리지) </label>
							</div>
						</th>
					</tr>
				</table>
			</section>
			<!--결제수단 section3 끝-->
			<section class="section">

				<div class="title">결제 상세</div>
				<div class="flex-box">
					<div>
						<p>이용금액</p>
					</div>
					<div class="col-sm-1"></div>
					<div>
						<p><input id="price" type="hidden" value="${addPrice }">${addPrice }원</p>
					</div>
				</div>
				<div class="flex-box">
					<div>
						<p>최종 결제금액</p>
					</div>
					<div class="col-sm-1"></div>
					<div>
						<p id="toP">${addPrice }원</p>
					</div>
				</div>
			</section>
			<section class="section">
				<div class="p-3">
					<div class="title">취소 및 부도예약금 안내</div>
					<p class="fw-bold p-2">위 구매조건을 모두 확인하였으며, 결제에 동의합니다.</p>
					<div class="form-check">
						<input class="form-check-input " type="checkbox" id="agree1">
						<label class="form-check-label" for="agree1"> 개인정보 이용약관
							동의(필수) </label>
					</div>
					<div class="form-check ">
						<input class="form-check-input" type="checkbox" id="agree2">
						<label class="form-check-label" for="agree2"> 전자금융거래 이용약관
							동의(필수) </label>
					</div>
				</div>
			</section>
			<div class="d-flex justify-content-end pb-5 ">
				<button type="submit" class="btn btn-primary me-3">결제하기</button>
				<button type="reset" class="btn btn-primary me-2">취소</button>
			</div>
		</form>
	</div>
	<footer>
		<div class="f">
			<a class="yata" href="main.jsp">YATA</a> 
			<a href="./footer/footer1.html">저작권 설명</a> 
			<a href="./footer/footer2.html">이용약관</a> 
			<a href="./footer/footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
	<script type="text/javascript">
		function usePoint() {
			let p = document.getElementById("p").value;
			let insertP = document.getElementById("useP");
			insertP.setAttribute("placeholder", p + " P");
			insertP.value = p;
			console.log(p);
			let toP = document.getElementById("toP");
			let toPrice = parseInt(document.getElementById("price").value) - parseInt(p);
			toP.innerHTML = "<input type='hidden' name='toPrice' value='"+toPrice+"'>" + toPrice + "원";
			console.log(toPrice );
		}
	</script>
</body>
</html>