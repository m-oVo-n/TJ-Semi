$(document).ready(function () {
    // 클릭 이벤트 처리
    $('.form-check-input').eq(0).on('click', function () {
        $('.certification#display1').toggle('certification');
    });
});

$(document).ready(function () {
    // 클릭 이벤트 처리
    $('.form-check-input').eq(1).on('click', function () {
        $('.certification#display2').toggle('certification');
    });
});


document.addEventListener('DOMContentLoaded', function () {
    // 이름과 휴대전화 번호 입력 상태 확인 함수
    function checkInputs() {
        var c1_inputId = document.getElementById('c1_inputId').value.trim();
        var c1_inputNum1 = document.getElementById('c1_inputNum1').value.trim();
        var c1_inputNum2 = document.getElementById('c1_inputNum2').value.trim();

   
        // 이름과 휴대전화 번호가 입력되었을 때 verifyButton 활성화
        var c1_verifyButton = document.getElementById('c1_verifyButton');
        c1_verifyButton.disabled = !(c1_inputId !== '' && c1_inputNum1 !== '' && c1_inputNum2 !== ''&&c1_inputNum2.length==4);
        
        //이름과 이메일아이디 입력상태 확인 함수
        var  c2_inputName=document.getElementById('c2_inputId').value.trim();
        var c2_inputEmailId=document.getElementById('c2_inputEmailId').value.trim();
        var c2_selectEmail=document.getElementById('c2_selectEmail').value.trim();
        
        // 이름과 이메일이 입력되었을 때 verifyButton 활성화
        var c2_verifyButton = document.getElementById('c2_verifyButton');
        c2_verifyButton.disabled = !(c2_inputId !== '' && c2_inputEmailId !== '' &&c2_selectEmail !== '');
        
    }

    // verifyButton 클릭 시 호출되는 함수
    function showVerificationCode1() {
        // 랜덤한 6자리 숫자 생성
        var randomCode1 = Math.floor(100000 + Math.random() * 900000);

        // p태그에 출력
        var c1_verifyCodeElement = document.getElementById('c1_verifyCode');
        c1_verifyCodeElement.textContent = '인증번호: ' + randomCode1;

        // confirmButton 활성화
        var c1_confirmButton = document.getElementById('c1_confirmButton');
        c1_confirmButton.disabled = false;
        
        // 모달 창 띄우기 (임시로 alert 사용)
        alert('인증번호를 받았습니다. 확인하세요: ' + randomCode1);
    }
    // verifyButton 클릭 시 호출되는 함수
    function showVerificationCode2() {
        // 랜덤한 6자리 숫자 생성
        var randomCode2 = Math.floor(100000 + Math.random() * 900000);

        // p태그에 출력
        var c2_verifyCodeElement = document.getElementById('c2_verifyCode');
        c2_verifyCodeElement.textContent = '인증번호: ' + randomCode2;

        // confirmButton 활성화
        var c2_confirmButton = document.getElementById('c2_confirmButton');
        c2_confirmButton.disabled= false;
        
        // 모달 창 띄우기 (임시로 alert 사용)
        alert('인증번호를 받았습니다. 확인하세요: ' + randomCode2);
        
    }  

    // confirmVerify 입력 상태 확인 함수
    function checkConfirmVerify() {
        var c1_confirmVerifyValue = document.getElementById('c1_confirmVerify').value.trim();
        var c1_verifyCodeElement = document.getElementById('c1_verifyCode').textContent;
        var c1_randomCode = c1_verifyCodeElement.split(': ')[1];

        var c2_confirmVerifyValue = document.getElementById('c2_confirmVerify').value.trim();
        var c2_verifyCodeElement = document.getElementById('c2_verifyCode').textContent;
        var c2_randomCode = c2_verifyCodeElement.split(': ')[1];
        
        // confirmVerify 값과 발급된 인증번호가 같을 때 confirmButton 활성화
        var c1_confirmButton = document.getElementById('c1_confirmButton');
        c1_confirmButton.disabled = !(c1_confirmVerifyValue === c1_randomCode);
        
        //c2도 동일
        var c2_confirmButton = document.getElementById('c2_confirmButton');
        c2_confirmButton.disabled = !(c2_confirmVerifyValue === c2_randomCode);
    }

    // 아이디와 휴대전화 번호 입력 시 이벤트 처리
    var c1_inputIdElement = document.getElementById('c1_inputId');
    var c1_inputNum1Element = document.getElementById('c1_inputNum1');
    var c1_inputNum2Element = document.getElementById('c1_inputNum2');

    c1_inputIdElement.addEventListener('input', checkInputs);
    c1_inputNum1Element.addEventListener('input', checkInputs);
    c1_inputNum2Element.addEventListener('input', checkInputs);

    // verifyButton 클릭 시 이벤트 처리
    var c1_verifyButtonElement = document.getElementById('c1_verifyButton');
    c1_verifyButtonElement.addEventListener('click', showVerificationCode1);

    // confirmVerify 입력 시 이벤트 처리
    var c1_confirmVerifyElement = document.getElementById('c1_confirmVerify');
    c1_confirmVerifyElement.addEventListener('input', checkConfirmVerify);
    
    
    //c2도 동일하게 아이디 이메일 입력시 이벤트 처리
    var c2_inputIdElement = document.getElementById('c2_inputId');
    var c2_inputEmailIdElement = document.getElementById('c2_inputEmailId');

    c2_inputIdElement.addEventListener('input', checkInputs);
    c2_inputEmailIdElement.addEventListener('input', checkInputs);

    // verifyButton 클릭 시 이벤트 처리
    var c2_verifyButtonElement = document.getElementById('c2_verifyButton');
    c2_verifyButtonElement.addEventListener('click', showVerificationCode2);

    // confirmVerify 입력 시 이벤트 처리
    var c2_confirmVerifyElement = document.getElementById('c2_confirmVerify');
    c2_confirmVerifyElement.addEventListener('input', checkConfirmVerify);
});