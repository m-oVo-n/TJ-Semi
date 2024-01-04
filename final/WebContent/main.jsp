<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css?after">
<script type="text/javascript">
	function quantityValue(value) {
		document.getElementById("quantity").val(value);
	}
</script>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>Document</title>
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
    <div id="searchInfo">
        <form action="search.p" method="post">
            <input type="text" name="departure" placeholder="출발지" id="dP">
            <input type="text" name="arrival" placeholder="도착지" id="aP">
            <input type="date" name="departDate" placeholder="가는날" id="dT">
            <select name="quantity" id="quantity" onchange="quantityValue(this.value);">
                <option value="0">1인</option>
                <option value="1">2인</option>
                <option value="2">3인</option>
            </select>
            <input type="submit" value="검색" id="searchBtn"></input>
        </form>
    </div>
    <div class="adDetail">
        <span>YATA와 함께 <br>마음까지 움직이는 여행!</span>
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
</body>
</html>