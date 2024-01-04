document.addEventListener('DOMContentLoaded', function () {
    var tel = document.getElementById('updateNum2');

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

    // 전화번호 입력란 엘리먼트를 가져옴
    var telInput = document.getElementById('updateNum2');

    // 유효성을 체크하는 함수
    var checkValidity = function (event) {
        // 입력된 전화번호 값 가져오기
        var telValue = telInput.value;

        // '-'를 기준으로 전화번호를 나누어 배열로 저장
        var telArray = telValue.split('-');

        // 유효성 검사를 위한 변수 초기화
        var isValid = true;
 
        // 각 부분의 길이가 3 또는 4인지 확인
        for (var i = 0; i < telArray.length; i++) {
            if (telArray[i].length !== 3 && telArray[i].length !== 4) {
                isValid = false;
                break;
            }
        }

        // 유효성 검사 결과에 따른 처리
        if (!isValid) {
            alert('번호를 제대로 입력해주세요!');
            event.preventDefault(); // 폼 제출 기본 동작 막기
        }
    };

    // 전화번호 입력란에서 포커스를 잃었을 때(checkValidity 함수 실행)
    telInput.addEventListener('blur', checkValidity);

    // form 요소에 onsubmit 이벤트 핸들러 추가
    document.querySelector('form').addEventListener('submit', function (event) {
        var id = document.getElementById('id').value;
        var name = document.getElementById('name').value;
        var birth = document.getElementById('birth').value;
        var selectNum = document.getElementById('selectNum').value;
        var updateNum2 = document.getElementById('updateNum2').value;
        var updateEmailId = document.getElementById('updateEmailId').value;
        var updateSelectEmail = document.getElementById('updateSelectEmail').value;

        // 모든 입력 필드의 값이 비어 있는지 확인
        if (id === '' || name === '' || birth === '' || selectNum === '' || updateNum2 === '' || updateEmailId === '' || updateSelectEmail === '') {
            alert('입력되지 않은 값이 있습니다!!\n확인해보세요!');
            event.preventDefault(); // 폼 제출 기본 동작 막기
        } else {
            // 페이지 이동
            window.location.href = './login.html';
        }
    });
});
