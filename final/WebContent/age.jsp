<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/age.css" type="text/css">
<script type="text/javascript">
function plus(age) {
    var inputField = document.querySelector("input[name=" + age + "]");
    var spanElement = document.querySelector("." + age + " span");

    // 현재 값 가져오기
    var currentValue = parseInt(inputField.value);
    
    var adult = document.querySelector("input[name='adult']");
    var child = document.querySelector("input[name='child']");
    var elderly = document.querySelector("input[name='elderly']");

    var total = parseInt(adult.value) + parseInt(child.value) + parseInt(elderly.value);
    if(${quantity} > total) {
    	// 값 증가
        inputField.value = currentValue + 1;

        // span 업데이트
        spanElement.innerHTML = " " + inputField.value;
    }
}

function minus(age) {
    var inputField = document.querySelector("input[name=" + age + "]");
    var spanElement = document.querySelector("." + age + " span");

    // 현재 값 가져오기
    var currentValue = parseInt(inputField.value);

    // 값이 0 미만으로 내려가지 않도록 체크
    if (currentValue > 0) {
        // 값 감소
        inputField.value = currentValue - 1;

        // span 업데이트
        spanElement.innerHTML = " " + inputField.value;
    }
};
</script>
</head>
<body>
	<header>
		<div class="headDiv">
			<ul class="head">
				<li class="title"><a href="main.jsp">YATA</a></li>
				<li>
					<ul class="right">
						<li class="language"><select name="language" id="language">
								<option value="한국어">한국어</option>
								<option value="영어">English</option>
								<option value="중국어">中文</option>
								<option value="일본어">日本語</option>
						</select></li>
						<li class="myres"><a href="myPage.jsp">마이페이지</a></li>
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
		<div class="info">
			<div class="infoBox">
				<span>${trans.departure_station }</span>&nbsp;&nbsp;&nbsp;&#9658;&nbsp;&nbsp;&nbsp;<span>${trans.arrival_station }</span><br>
				<br> <span class="type">${trans.transportation_type }
					${trans.transportation_number }</span>
			</div>
		</div>
	</header>
	<form action="age.p" method="post">
		<div class="container">
			<div class="classType">
				<p class="selectTitle">&bull; class 선택</p>
				<div class="radioBtn">
					<input type="radio" id="sp" name="classType" value="special"><label
						for="sp" id="sp" ${spP == 0 ? 'class="spZeroPrice"' : ''}><span>특/우등</span><br>
					<br>&bull; 물, 다과제공<br>&bull; 넓은 좌석<br>&bull; 콘센트<br>
					<span class="price">${spP } 원</span></label> <input type="radio" id="nm"
						name="classType" value="normal"><label for="nm"><span>일반</span><br>
					<span class="price">${price } 원</span></label>
				</div>
			</div>
			<div class="selectAge">
				<p class="selectTitle">&bull; 연령 선택</p>
				<div class="box">
					<ul class="adult">
						<li><button class="plus" type="button"
								onclick="plus('adult')">+</button></li>
						<li>성인<input type="hidden" name="adult" value="0"><span>
								0</span></li>
						<li><button class="minus" type="button"
								onclick="minus('adult')">-</button></li>
					</ul>
					<ul class="child">
						<li><button class="plus" type="button"
								onclick="plus('child')">+</button></li>
						<li>아동<input type="hidden" name="child" value="0"><span>
								0</span></li>
						<li><button class="minus" type="button"
								onclick="minus('child')">-</button></li>
					</ul>
					<ul class="elderly">
						<li><button class="plus" type="button"
								onclick="plus('elderly')">+</button></li>
						<li>노약자<input type="hidden" name="elderly" value="0"><span>
								0</span></li>
						<li><button class="minus" type="button"
								onclick="minus('elderly')">-</button></li>
					</ul>
				</div>
			</div>
		</div>
		<input type="submit" value="좌석지정으로 가기" id="goBtn">
	</form>
	<footer>
		<div class="f">
			<a class="yata">YATA</a> <a href="./footer/footer1.html">저작권 설명</a> <a
				href="./footer/footer2.html">이용약관</a> <a
				href="./footer/footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
</body>
</html>