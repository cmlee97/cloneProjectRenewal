<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>아이디 비밀번호 찾기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        *{
            box-sizing: border-box;
        }
        body{
            background-color: black;
        }
        a{
            text-decoration: none;
        }
        .container{
            background-color: white;
        }
    </style>
</head>
<body>
<div class="container w-50 shadow rounded border p-5 mt-5">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link <c:if test="${requestScope.find=='id'}">active</c:if>"
               data-bs-toggle="tab" href="#menu1">아이디 찾기</a>
        </li>
        <li class="nav-item">
            <a class="nav-link <c:if test="${requestScope.find=='pw'}">active</c:if>"
               data-bs-toggle="tab" href="#menu2">비밀번호 찾기</a>
        </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <%--아이디 찾기--%>
        <div id="menu1" class="container tab-pane fade <c:if test="${requestScope.find=='id'}">active show</c:if>"><br>
            <div id="findIdSuccess" style="display:none" class="px-4">
                <p class="text-center mt-4">가입된 아이디는 <b><span id="resultId"></span></b>입니다.</p>
                <a class="btn btn-danger mt-3 w-100" type="button" href="<c:url value="/member/login.do"/>">로그인</a>
            </div>

            <div id="findIdBefore" class="px-4">
                <p>이름과 휴대폰 번호를 입력하세요.</p>
                <input class="form-control mb-2" type="text" id="name" name="name" placeholder="이름"/>
                <input class="form-control mb-2" type="text" id="tel" name="tel" placeholder="전화번호"/>
                <input class="btn btn-dark mt-3 w-100" type="button" value="아이디 찾기" onclick="idFind()"/>
            </div>
        </div>
        <%--비밀번호 찾기--%>
        <div id="menu2" class="container tab-pane fade <c:if test="${requestScope.find=='pw'}">active show</c:if>"><br>
            <div id="findPwSuccess" style="display:none" class="px-4">
                <p class="text-center mt-4">
                    <small>해당 이메일로 임시 비밀번호를 보냈습니다.
                        로그인 후 마이페이지에서 비밀번호를 변경하시기 바랍니다.</small>
                </p>
                <a class="btn btn-primary mt-3 w-100" type="button" href="<c:url value="/member/login.do"/>">로그인</a>
            </div>

            <div id="findPwBefore" class="px-4">
                <p>가입한 아이디와 이메일을 입력하세요.</p>
                <input class="form-control mb-2" type="text" id="id" name="id" placeholder="아이디"/>
                <input class="form-control mb-2" type="text" id="email" name="email" placeholder="이메일"/>
                <input class="btn btn-dark mt-3 w-100" type="button" value="비밀번호 찾기" onclick="pwFind()"/>
            </div>
        </div>
    </div>
</div>
    <script>
        function idFind(){
            let name = $("#name").val();
            let tel = $("#tel").val();

            $.ajax({
                url:"<c:url value='/member/findId.do?name='/>"+name+"&tel="+tel,
                type:"post",
                success: function(data){ // data는 찾기 실패시 0, 찾으면 해당 아이디값
                    if(data == 0){
                        alert("이름 및 휴대폰 번호를 다시 확인하시기 바랍니다")
                    }else{ // 아이디 찾기 성공
                        $("#findIdBefore").css("display", "none");
                        $("#findIdSuccess").css("display", "block");
                        $("#resultId").text(data);
                    }
                },
                error:function(){alert("아이디 찾기 요청을 실패하였습니다")}
            });
        }
        function pwFind(){
            let uid = $("#id").val();
            let uEmail = $("#email").val();
            $.ajax({
                url:"<c:url value='/member/findPw.do?uid='/>"+uid+"&uEmail="+uEmail,
                type:"post",
                success: function(data){ // data는 찾기 실패시 0, 찾으면 해당 아이디값
                    if(data == 0){
                        alert("아이디와 이메일을 다시 확인하시기 바랍니다")
                    }else{ // 아이디 찾기 성공
                        $("#findPwBefore").css("display", "none");
                        $("#findPwSuccess").css("display", "block");

                    }
                },
                error:function(){alert("비밀번호 찾기 요청을 실패하였습니다")}
            });
        }
    </script>


</body>
</html>


