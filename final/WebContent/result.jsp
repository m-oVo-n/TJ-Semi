<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/bf37951062.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b3241593896a9104a800101ea10efd1&libraries=services"></script>
<script type="text/javascript">
//마커 표시하는 함수
function mapMarker(sX,sY,eX,eY) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
	var points = [
	    new kakao.maps.LatLng(sY, sX),
	    new kakao.maps.LatLng(eY, eX)
	];
	
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds();    
	
	var i, marker;
	for (i = 0; i < points.length; i++) {
	    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	    marker = new kakao.maps.Marker({ position : points[i] });
	    marker.setMap(map);
	    
	    // LatLngBounds 객체에 좌표를 추가합니다
	    bounds.extend(points[i]);
	}
	
	map.setBounds(bounds);
}
</script>
<script type="text/javascript" src="js/result.js?after"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/result.css" type="text/css">
</head>
<body onload="initSearch()">
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
			<div id="searchInfo">
				<input type="text" name="departure" placeholder="출발지" id="dP" value=${param.departure }>
				<input type="text" name="arrival" placeholder="도착지" id="aP" value=${param.arrival }>
				<input type="date" name="departDate" placeholder="가는날" id="dT" value=${param.departDate }>
				<select name="quantity" id="quantity">
					<option value='1'>1인</option>
					<option value='2'>2인</option>
					<option value='3'>3인</option>
				</select>
				<button type="button" id="searchBtn" onclick="search()">검색</button>
			</div>
		</div>
	</header>

	<div class="container">
		<div class="left-container">
			<!-- 버스 기차 항공 버튼 -->
			<ul class="type">
					<li class="bus"><button onclick="show('bus')">버스</button></li>
					<li class="train"><button onclick="show('train')">기차</button></li>
					<li class="airport"><button onclick="show('airplane')">항공</button></li>
			</ul>

			<div class="result">
				<div id="busInfo">
				</div>
				<div id="trainInfo"></div>
				<div id="airplaneInfo"></div>
			</div>
		</div>
		<div class="right-container">
			<div id="map"></div>
			<div id="ad"></div>
		</div>
	</div>

	<footer>
		<div class="f">
			<a class="yata" href="main.jsp">YATA</a>
			<a href="footer1.html">저작권 설명</a> 
			<a href="footer2.html">이용약관</a>
			<a href="footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
<script type="text/javascript">
	console.log(<%= request.getParameter("quantity")%>);
	
	document.getElementById("quantity").options[<%= request.getParameter("quantity")%>].selected = true;
</script>
</body>
</html>