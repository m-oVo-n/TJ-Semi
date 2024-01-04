var inputBirth = document.getElementById('inputBirth');
var inputPw = document.getElementById('inputPw');
var checkPw = document.getElementById('checkPw');
var checkMsg = document.getElementById('checkMsg');
var passwordMessage = document.getElementById('passwordMessage');
var inputNum2 = document.getElementById('inputNum2');
var telMsg = document.getElementById('telMsg');

inputPw.addEventListener('input', join);
checkPw.addEventListener('input', join);
inputBirth.addEventListener('input', join);

function join() {
    var password = inputPw.value;
    var checkValue = checkPw.value;

    // 비밀번호 유효성 검사 조건 설정
    var minLength = 8;
    var hasUpperCase = /[A-Z]/.test(password);
    var hasLowerCase = /[a-z]/.test(password);
    var hasDigit = /\d/.test(password);
    var hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

    // 값이 들어오면 형식에 맞는지 알려줘!
    // 입력값이 있을 때 메시지를 보여주자~
    if (password) {
        passwordMessage.style.display = 'block';
    } else {
        passwordMessage.style.display = 'none';
    }

    // 모든 조건을 만족하는지 확인
    if (password.length >= minLength &&
        hasUpperCase &&
        hasLowerCase &&
        hasDigit &&
        hasSpecialChar) {
        console.log("잘됐다!");
        passwordMessage.innerHTML = '비밀번호 형식이 올바릅니다!';
        passwordMessage.style.color = 'green';
    } else {
        console.log('비밀번호 유효성 검사 실패');
        passwordMessage.innerHTML = '비밀번호가 형식에 맞지 않습니다.';
        passwordMessage.style.color = 'red';
    }

    //checkvalue에 값이 들어오 checkMsg띄워줘~~~
    if (checkValue) {
        checkMsg.style.display = 'block';
    } else {
        checkMsg.style.display = 'none';
    }

    //비밀번호값이랑 비밀번호 입력값이랑 같은지 확인해주라
    if (password === checkValue) {
        console.log("비밀번호를 잘 입력했구나 축하한다.");
        checkMsg.innerHTML = '비밀번호가 같습니다!';
        checkMsg.style.color = 'green';
    } else {
        console.log("비밀번호가 틀렸다. 똑바로 해봐라.");
        checkMsg.innerHTML = '비밀번호가 다릅니다!'
        checkMsg.style.color = 'red';
    }
    
}


function togglePassword() {

    var inputPw = document.getElementById('inputPw');
    var checkPw = document.getElementById('checkPw');
    var checkMsg = document.getElementById('checkMsg');
    var passwordMessage = document.getElementById('passwordMessage');

    // 버튼을 누른 것이 inputPW의 버튼인지 확인
    var pwButton = event.target.id === 'p_button1';
    var chButton = event.target.id === 'p_button2';

    // inputPW의 버튼을 클릭한 경우에만 실행
    if (pwButton) {
        // 비밀번호 입력란의 type을 토글
        inputPw.type = (inputPw.type === 'password') ? 'text' : 'password';
    }

    // inputPW의 버튼을 클릭한 경우에만 실행
    if (chButton) {
        // 확인 비밀번호 입력란의 type을 토글
        checkPw.type = (checkPw.type === 'password') ? 'text' : 'password';
    }

}

//생년월일 4자리 2자리 2자리 마다 끊어서 .찍어주기(가독성 올려주기)
document.addEventListener('DOMContentLoaded', function () {
    var inputBirth = document.getElementById('inputBirth');

    inputBirth.addEventListener('input', function () {
        var inputValue = this.value.replace(/[^\d]/g, '');
        var formattedValue = '';

        for (var i = 0; i < inputValue.length; i++) {
            if (i === 4 || i === 6) {
                formattedValue += '.';
            }
            formattedValue += inputValue[i];
        }

        this.value = formattedValue;
    });
});

//생년월일
document.addEventListener('DOMContentLoaded', function () {
    var inputBirth = document.getElementById('inputBirth');
    var birthMsg = document.getElementById('birthMsg');

    //생년월일 분리
    inputBirth.addEventListener('input', function () {
        var birthInput = this.value;
        var birthArray = birthInput.split('.');

        if (birthArray.length === 3) {
            var year = birthArray[0];
            var month = birthArray[1];
            var day = birthArray[2];

            if (year.length == 4 && parseInt(year) <= 2023 && parseInt(year) >= 1900 && parseInt(month) >= 1 && parseInt(month) <= 12 && parseInt(day) >= 1 && parseInt(day) <= 31) {
                console.log("잘 됐다!")
                birthMsg.style.display = 'none';
            } else {
                birthMsg.style.display = 'block';
                birthMsg.innerHTML = '유효하지 않은 생년월일입니다.';
                birthMsg.style.color = 'red';
            }
        }
    });
});


//전화번호 4자리 입력하면 - 자동 입력
document.addEventListener('DOMContentLoaded', function () {
    var tel = document.getElementById('inputNum');

    tel.addEventListener('input', function () {
        var telvalue = this.value.replace(/[^\d]/g, '');
        var formattedValue = '';

        for (var i = 0; i < telvalue.length; i++) {
            if (i === 4) {
                formattedValue += '-';
            }
            formattedValue += telvalue[i];
        }

        this.value = formattedValue;
    });
});

//전화번호 분리
inputNum.addEventListener('input', function () {
    var telInput = this.value;
    var telArray = telInput.split('-');
    var isValid = true;

    for (var i = 0; i < telArray.length; i++) {
        if (telArray[i].length !== 3 && telArray[i].length !== 4) {
            isValid = false;
            break;
        }
    }

    if (isValid) {
        console.log("잘 됐다!");
        telMsg.style.display = 'none';
    } else {
        telMsg.style.display = 'block';
        telMsg.innerHTML = '올바른 번호 형식이 아닙니다';
        telMsg.style.color = 'red';
    }
});
//마케팅 선택 동의-> 상위 체크버튼 눌러야 하위체크버튼  이메일 ,mms 체크할수있게!
document.getElementById('check3').addEventListener('change', function() {
    var emailCheckbox = document.getElementById('checkbox1');
    var mmsCheckbox = document.getElementById('checkbox2');

    if (this.checked) {
        emailCheckbox.removeAttribute('disabled');
        mmsCheckbox.removeAttribute('disabled');
    } else {
        emailCheckbox.setAttribute('disabled', 'disabled');
        mmsCheckbox.setAttribute('disabled', 'disabled');
    }
});

function checkAgreements() {
    var agree1 = document.getElementById('agree1').checked;
    var agree2 = document.getElementById('agree2').checked;

    // 두 체크박스가 모두 체크되었는지 확인
    if (agree1 && agree2) {
        // 체크되었다면 페이지 이동 (이 부분을 결제 처리 로직으로 변경해야 함)
        alert('회원가입 완료!');
        
    } else {
        // 체크되지 않았다면 알림 또는 다른 처리 가능
        alert('이용약관에 동의해주세요.');

        // 체크되지 않은 항목 중 첫 번째 체크박스로 포커스 이동
        if (!agree1.checked) {
            agree1.focus();
        } else if (!agree2.checked) {
            agree2.focus();
        }
    }
}

//입력완료되면 login.html 로 보내줘야돼
function checkAndSubmit(event) {
    // 폼의 기본 동작을 막음
    event.preventDefault();

    var inputIdElement = document.getElementById('inputId');
    var inputIdValue = inputIdElement ? inputIdElement.value.trim() : '';
    var inputPwValue = document.getElementById('inputPw').value.trim();
    var checkPwValue = document.getElementById('checkPw').value.trim();
    var inputNameValue = document.getElementById('inputName').value.trim();
    var inputBirthValue = document.getElementById('inputBirth').value.trim();
    var genderValue = document.getElementById('gender').value;
    var inputNumValue = document.getElementById('inputNum').value.trim();
    var inputEmailIdValue = document.getElementById('inputEmailId').value.trim();
    var selectEmailValue = document.getElementById('selectEmail').value;

    // 나머지 필드에 대한 검증도 동일한 패턴으로 처리
    if (!inputIdValue || !inputPwValue || !checkPwValue || !inputNameValue || !inputBirthValue || !inputNumValue || !inputEmailIdValue) {
        alert('모든 필드를 입력해주세요!');
        console.log('모든 필드를 입력해주세요!!!');
        allFieldsFilled = false;
    }else{
        alert("회원가입이 성공적으로 이루어졌습니다! 로그인 화면으로 이동합니다!");
        document.getElementById("addForm").submit();
        //window.location.href = 'login.html'; // 이동할 페이지의 경로로 수정
    }
    
}