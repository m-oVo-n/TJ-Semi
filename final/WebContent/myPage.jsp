<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
  <link href="./css/myPage.css" rel="stylesheet">
  <title>마이페이지</title>
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

  <section class="bg-light pt-2 "><!-- 헤더 밑 푸터 위 구역 전체-->
	<div class="section my-3 mx-auto  d-flex">
    <div class="section1 mx-2 my-5 px-2 py-1"><!--마이페이지 index-->
      <p class="fw-bold fs-4">마이페이지</p>
      <div class="fw-bold px-1 fs-6 mb-1"> 회원정보 관리<button id="toggleList1" class="btn fw-bold">+</button></div>
      <ul id="myList1" class="list-group" style="display: none;">
        <li class="mx-4"><a href="updateMember.jsp"><small>나의 정보 수정</small></a></li>
        <li class="mx-4"><a href="changePw.jsp"><small>비밀번호 변경</small></a></li>
        <li class="mx-4"><a href="#" id="withdrawal"><small>회원탈퇴</small></a></li>
        
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-centered d-flex align-items-center ">
            <div class="modal-content text-center p-2">
              <div class="modal-header">
                <h5 class="modal-title fw-bold">비밀번호 입력</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body p-5">
                <form action="delete.m">
                  <div class="row">
                    <div class="mb-3 col-sm-5 pb-4 text-center">
                      <label for="password" class="form-label">비밀번호</label>
                    </div>
                    <div class="mb-3 col-sm-6 pb-4">
                      <input type="password" class="form-control" id="password" name="password">
                    </div>
                    <div class="mb-3 col-sm-12">
                      <button class="btn btn-light" type="submit" id="" style="width:90%;">탈퇴</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div><!-- 모달 끝 -->
      </ul>
      <div class="fw-bold px-1 mt-3"> 나의 예약조회<button id="toggleList2" class="btn fw-bold">+</button></div>
      <ul id="myList2" class="list-group" style="display: none; ">
        <li class="mx-4"><a href="myReservation.jsp"><small>예약내역</small></a></li>
      </ul>
    </div><!-- 마이페이지 index-->

    <div class="section2 mx-2 my-5 px-3 py-1"><!-- 마이페이지 content-->
      <p class="fw-bold"><small>홈 > 마이페이지</small></p>
      <p class="fw-bold fs-3 pb-3 mb-5">마이페이지</p>
      <div class="d-flex align-items-center justify-content-between w-100">
        <p class="fs-5 fw-bold">■ 나의 기본정보</p>
        <button class="btn btn-secondary btn-sm"  id="moreButton">펼쳐보기</button>
      </div>
      <table class="table text-center align-middle w-100 hidden " id="table"> <!-- 나의 정보 테이블-->
        <thead>
          <tr class="table-secondary">
            <th scope="col">회원명</th>
            <th class="text-start">${MEMBER.name }</th>
            <th scope="col">멤버쉽번호</th>
            <th class="text-start">${MEMBER.member_id }</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>비밀번호</td>
            <td class="text-start">
            	<button type="button" class="btn btn-primary btn-sm mx-2" ><a href="changePw.jsp" class="text-white text-decoration-none">비밀번호 변경</a></button>
            </td>
            <td>이메일</td>
            <td class="text-start">${MEMBER.email }</td>
          </tr>
          <tr>
            <td>연락처</td>
            <td class="text-start">${MEMBER.phone_number }
              <!-- <button type="button" class="btn btn-primary btn-sm mx-2">휴대폰 인증/변경</button> -->
            </td>
            <td>마일리지</td>
            <td class="text-start">
              <button type="button" class="btn btn-primary btn-sm mx-2" data-bs-toggle="modal"
                data-bs-target="#staticBackdrop">마일리지 조회</button>
              
              <!-- Modal -->
              <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content h-50">
                    <div class="modal-header">
                      <h5 class="modal-title">내 마일리지 조회</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p class="fs-5">전혀 없습니다~^ㅇ^</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-primary">확인</button>
                    </div>
                  </div>
                </div>
              </div><!--Modal 끝~-->
			
            </td>
          </tr>
        </tbody>
      </table><!--나의 정보 테이블 끝-->
      </div>
      </div><!-- section안에 section끝  -->
  </section>

<footer>
		<div class="f">
			<a class="yata" href="main.jsp">YATA</a>
			<a href="./footer/footer1.html">저작권 설명</a> 
			<a href="./footer/footer2.html">이용약관</a>
			<a href="./footer/footer3.html">개인정보 처리방침</a>
		</div>
	</footer>
</body>
<script src="./js/myPage.js" type="text/javascript"></script>

</html>