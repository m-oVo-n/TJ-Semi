document.getElementById("changeTicket").addEventListener('click',function(){
    window.location="result.html";
});

document.getElementById("resetTicket").addEventListener('click',function(){
    var answer= confirm("정말 취소하시겠습니까?");
    if(answer){
        answer=true;
        alert("예매가 취소되었습니다.");
    }else{
        answer=false;
        alert("예매가 정상적으로 취소되지 않았습니다. 다시 시도해주세요.");
    }
})