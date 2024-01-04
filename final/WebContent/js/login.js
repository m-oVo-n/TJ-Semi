// 아이디 저장 함수
function saveUsername() {
	var username = document.getElementById('userName').value;
    if (username) {
        // 저장
        localStorage.setItem('savedUsername', username);
        alert('아이디가 저장되었습니다.');
    } else {
        alert('아이디를 입력해주세요.');
        
    }
	
}

// 페이지 로드 시 저장된 아이디가 있다면 입력 필드에 표시
document.addEventListener('DOMContentLoaded', function () {
	var savedUsername = localStorage.getItem('savedUsername');
	if (savedUsername) {
		document.getElementById('userName').value = savedUsername;
	}
});

// 로그인 함수
/*function login() {
	var username = document.getElementById('userName').value;
	var userpw = document.getElementById('userPw').value;
	var rememberMe = document.getElementById('rememberMe').checked;

	// 로그인 처리를 수행하고 성공하면 아이디 저장
	if (username === 'gonigoni1216' && userpw === '12345') {
		alert('로그인 성공!');
		if (rememberMe) {
			localStorage.setItem('savedUsername', username);
		} else {
			localStorage.removeItem('savedUsername');
		}
		window.location.href="./main.jsp";
	} else {
		alert('로그인 실패. 아이디와 비밀번호를 확인하세요.');
	}
}*/