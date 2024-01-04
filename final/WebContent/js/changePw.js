function enablePasswordFields() {
	var currentPw = document.getElementById('Pw').value;
	var updatePw = document.getElementById('updatePw');
	var confirmPw= document.getElementById('updatePwConfirm');

	if (currentPw == '') {
		alert('현재 비밀번호를 먼저 입력하세요!');
		document.getElementById('updatePw').value = '';
		document.getElementById('Pw').focus();
	}
}	

function comparePassword1() {
	var pw = document.getElementById('Pw').value;
	var updatePw = document.getElementById('updatePw').value;

	if (pw !== '' && updatePw !== '') {
		if (pw === updatePw) {
			alert('기존 비밀번호를 사용하실 수 없습니다!\n다른 비밀번호를 입력해주세요!');
			//비밀번호가 같을 경우 input 필드를 지우고 다시 입력하도록 설정
			document.getElementById('updatePw').value = '';
		} else {
			console.log('비밀번호가 다릅니다 계속 진행하세옹~^^');
			// 비밀번호 유효성 검사 조건 설정
			var minLength = 8;
			var hasUpperCase = /[A-Z]/.test(updatePw);
			var hasLowerCase = /[a-z]/.test(updatePw);
			var hasDigit = /\d/.test(updatePw);
			var hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(updatePw);

			// 모든 조건을 만족하는지 확인
			if (updatePw.length >= minLength &&
					hasUpperCase &&
					hasLowerCase &&
					hasDigit &&
					hasSpecialChar) {
				console.log("잘됐다!");
			} else {
				console.log('비밀번호 유효성 검사 실패');
				alert('비밀번호가 형식에 맞지않습니다!\n비밀번호는 8자리이상, 대문자,소문자,숫자를 포함해야합니다!');

			}
		}

	}

}




function togglePassword(buttonId) {
	var updatePw = document.getElementById('updatePw');
	var updatePwConfirm = document.getElementById('updatePwConfirm');

	// 버튼을 누른 것이 inputPW의 버튼인지 확인
	var pwButton = buttonId === 'p_button1';
	var chButton = buttonId === 'p_button2';

	// inputPW의 버튼을 클릭한 경우에만 실행
	if (pwButton) {
		// 비밀번호 입력란의 type을 토글
		updatePw.type = (updatePw.type === 'password') ? 'text' : 'password';
	}

	// 확인 비밀번호 입력란의 버튼을 클릭한 경우에만 실행
	if (chButton) {
		// 인 비밀번호 입력란의 type을 토글
		updatePwConfirm.type = (updatePwConfirm.type === 'password') ? 'text' : 'password';
	}
}


function changePw() {
    var currentPw = document.getElementById('Pw').value;
    var newPassword = document.getElementById('updatePw').value;
    var confirmPassword = document.getElementById('updatePwConfirm').value;

    if (currentPw === '' || newPassword === '' || confirmPassword === '') {
        alert('입력되지 않은 칸이 있습니다! 다시 확인해보세요!');
        return false;
    }

    if (newPassword !== confirmPassword) {
        alert('변경된 비밀번호와 일치하지 않습니다!\n다시 입력하세요!');
        document.getElementById('updatePwConfirm').focus();
       return false;
    } else {
        alert('비밀번호 변경을 성공했습니다! \n다시 로그인하세요!');
        document.getElementById('formtag').submit();
        return true;
    }
}

