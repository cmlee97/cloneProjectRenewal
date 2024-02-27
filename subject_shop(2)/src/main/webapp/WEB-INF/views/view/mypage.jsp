<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/view_header.jsp" %>
<style>
    a{
        color: darkgray;
    }
    li{
        list-style: none;
    }
</style>
<div class="container mt-5 d-flex">
    <aside class="col-sm-3">
        <h4 class="mb-4">마이페이지</h4>
        <ul>
            <li><a href="<c:url value='/view/myPage.do'/>">비밀번호 변경</a></li>
            <li><a href="<c:url value='/view/userInfo.do'/>">회원정보 수정</a></li>
        </ul>
    </aside>
    <div class="container col-sm-9">
        <h3>비밀번호 변경</h3>
        <input type="hidden" id="memberId" value="${sessionScope.loginDto.id}">
        <input type="hidden" id="memberPw" value="${sessionScope.loginDto.pw}">
        <input type="text" class="form-control mb-4" id="pw" name="pw" placeholder="현재비밀번호"/>
        <input type="text" class="form-control mb-4" id="newPw" name="newPw" placeholder="새 비밀번호"/>
        <p id="pwChkMsg"></p>
        <input type="text" class="form-control mb-4" id="newPwConfirm" name="newPwConfirm" placeholder="새 비밀번호확인"/>

        <div class="text-center m-3">
            <button id="pwChangeBtn" class="btn btn-dark">비밀번호 변경</button>
        </div>
    </div>
</div>
<script>
    let pw="";
    let currentPwChk="";

    function pwCheck(){
        pw = $("#pw").val();//입력된현재 비밀번호
        $.ajax({
            url:"<c:url value='/member/pwCheck.do'/>",
            type:"post",
            data:{"pw":pw},
            async:false,//동기화처리
            success:function(result) {
                if (result == "ok") {//입력된비밀번호와 현재비밀번호가 일치
                    // alert("현재비밀번호 확인완료");
                    currentPwChk = true;
                } else {//불일치
                    // alert("현재비밀번호 다시 확인바랍니다");
                    currentPwChk = false;
                }
            },
            error: function(){
                alert("현재 비밀번호 체크 요청 실패");
            }
        });
    }
    let newPwChk = "";
    //새비밀번호 유효성 체크
    $("#newPw").on("keyup",function(){
        let npValue = $("#newPw").val();
        if(npValue==""){
            $("#pwChkMsg").text("새 비밀번호를 입력하세요");
            newPwChk=false;
        }else if(npValue.length < 4){
            $("#pwChkMsg").text("4자리 이상 입력하세요");
            newPwChk=false;
        }else{
            $("#pwChkMsg").text("");
            newPwChk = true;
        }
    });
    //새 비밀번호 확인
    let newPwConfirmChk="";
    $("#newPwConfirm").on("keyup", function(){
        let npcValue = $("#newPwConfirm").val();
        if(npcValue==""){
            $("#pwChkMsg").text("확인 비밀번호를 입력하세요");
            newPwConfirmChk=false;
        }else if($("#newPw").val() != npcValue){
            $("#pwChkMsg").text("비밀번호가 일치하지 않습니다");
            newPwConfirmChk=false;
        }else{
            $("#pwChkMsg").text("");
            newPwConfirmChk=true;
        }
    });
    //비밀번호 변경 요청시
    $("#pwChangeBtn").on("click", function(){
        pwCheck();

        console.log("currentPwChk");
        if(currentPwChk==false){
            alert("현재 비밀번호를 다시 확인하세요");
        }else if(newPwChk==false){
            alert("새 비밀번호를 다시 확인하세요");
        }else if(newPwConfirmChk==false){
            alert("새 비밀번호가 일치하지 않습니다");
        }else if(currentPwChk==true && newPwChk==true && newPwConfirmChk==true){
            let id = $("#memberId").val();
            let pw = $("#newPw").val();
            let member = {"id":id, "pw":pw};
            $.ajax({
                url:"<c:url value='/member/pwChange.do'/>",
                type:"post",
                data:JSON.stringify(member),//JSON문자열로 변환 (javascript객체를 전송할 수 없기 때문에)
                contentType:"application/json; charset=utf8",
                success:function(result){

                    if(result>0){
                        alert("비밀번호가 변경되었습니다. 새로운 비밀번호로 로그인 하세요");
                        location.href="<c:url value="/member/logout.do"/>";
                    }
                },
                error: function (){
                    alert("비밀번호 변경 요청 실패");
                }
            });
        }

    });
</script>

<%@ include file="inc/view_footer.jsp" %>
