let replyFunc = (() => {
    //게시물 별 리스트
    function getList(param){
        let qid =param.qid;
        $.ajax({
            url:"/shop/replies/list/"+qid,
            type:"get",
            success: (result)=>{
                if(cb) cb(result);
            },
            error: ()=>{alert("요청을 실패하였습니다")}
        });
     }
    //댓글 시간,날짜 표시
    function showDateTime(timeValue){
        //현재시간
        var now = new Date();
        //현재시간과 댓글 등록시간의 갭
        var gap = now.getTime() - timeValue;
        //댓글등록시간을 Date객체로 생성
        var rDate = new Date(timeValue);
        //갭이 24시간 미만
        if(gap < (1000 * 60 * 60 * 24)){
            var hh = rDate.getHours();
            var mi = rDate.getMinutes();
            var ss = rDate.getSeconds();

            return [(hh > 9 ? '' : '0')+hh, ':', (mi > 9 ? '' : '0')+mi,
                ':', (ss > 9 ? '' : '0')+ss].join('');

        }else{//갭이 24시간 이상이면 날짜로 표시
            var yy = rDate.getFullYear();
            var mm = rDate.getMonth() + 1; // 0 --> 1월
            var dd = rDate.getDate();

            return [yy, '/', (mm > 9 ? '' : '0')+mm,
                '/', (dd > 9 ? '' : '0')+dd].join('');
        }
    }

    return{
        getList: getList,
        showDateTime: showDateTime
    }
})();