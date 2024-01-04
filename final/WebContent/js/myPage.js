//회원정보관리 + 버튼 누르면 밑에 요소들 나오게
document.getElementById('toggleList1').addEventListener('click', function () {
    var list = document.getElementById('myList1');
    list.style.display = (list.style.display === 'none' || list.style.display === '') ? 'block' : 'none';
});

//나의예약조회 + 버튼 누르면 밑에 요소들 나오게
document.getElementById('toggleList2').addEventListener('click', function () {
    var list = document.getElementById('myList2');
    list.style.display = (list.style.display === 'none' || list.style.display === '') ? 'block' : 'none';
});

//펼쳐보기 버튼 누르면 숨어있던 테이블이 뿅하고 나오게
document.getElementById('moreButton').addEventListener('click', function () {
    event.preventDefault(); //기본동작 막아버리기

    var view = document.getElementById('table');
    view.classList.toggle('hidden');
});

//회원탈퇴할건지 물어보고 모달창 띄워주기
document.getElementById('withdrawal').addEventListener('click', function () {
    var result = confirm('정말로 회원탈퇴를 하시겠습니까?');
    if (result) {
        // Bootstrap 모달 트리거
        var myModal = new bootstrap.Modal(document.getElementById('myModal'));
        myModal.show();
    } else {
        alert('잘 생각하셨어요!');
    }
});


