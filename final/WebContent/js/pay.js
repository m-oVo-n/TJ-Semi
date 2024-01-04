    // 체크 여부 확인 함수
    function checkAgreements() {
        var agree1 = document.getElementById('agree1').checked;
        var agree2 = document.getElementById('agree2').checked;

        // 두 체크박스가 모두 체크되었는지 확인
        if (agree1 && agree2) {
            // 체크되었다면 페이지 이동 (이 부분을 결제 처리 로직으로 변경해야 함)
            alert('결제창으로 이동합니다~');
            
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
