<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/failedPay.css">
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
            <div class="text-center w-100 mb-3 div1">2023년 12월 25일(월) 17:00</div>
            <div class="section1-1"><!-- 서울 -> 부산 -->
                <div class="result">
                    <div class="py-4 text-center">
                        <img src="./img/airplane.png" alt="airplane"><br><br>
                        <h3 class="tw-bold">24:15</h3><br>
                        <h3 class="tw-bold">서울</h3>
                    </div>
                    <div class="py-5 m-auto">
                        <h3 class="fw-bold fs-3 mb-3">대한항공 KE1083<br>
                            <h3 class="tw-bold text-secondary">---24h 55m---</h3>
                    </div>
                    <div class="py-4 text-center">
                        <img src="./img/airplane.png" alt="airplane"><br><br>
                        <h3 class="tw-bold">17:10</h3><br>
                        <h3 class="tw-bold">부산</h3>
                    </div>
                </div>
            </div>
            <div class="m-auto py-5 text-center">
                <h1 class="fw-bold mb-5 text-danger">결제에 실패하였습니다.</h1>
                <a href="pay.jsp" class="fs-2">결제 다시 시도하기</a>
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
</html>