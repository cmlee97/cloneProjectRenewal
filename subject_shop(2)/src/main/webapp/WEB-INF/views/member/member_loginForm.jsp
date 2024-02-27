<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    *{
      box-sizing: border-box;
    }
    a{
      text-decoration: none;
      color: lightgray;
    }
	a:hover{
		color:black;
	}
  </style>
</head>
<body>
<div class="container w-50 p-5 mt-5">
	<form action="<c:url value='/member/login.do'/>" method="post">
		<h3 class="text-center mb-4">로그인</h3>
		<input class="form-control mb-3 border-0 bg-light" style="height:50px;" type="text" id="id" name="id" placeholder="아이디"/>
		<input class="form-control mb-2 border-0 bg-light" style="height:50px;" type="text" id="pw" name="pw" placeholder="비밀번호"/>

		<div class="text-center pt-4">
			<input type="submit" class="btn btn-danger w-100" style="height:50px;" value="로그인하기"/>
		</div>
	</form>
	<div class="mt-3 w-100  findIdPw">
		<div class="d-flex justify-content-end mt-2 mb-5">
			<div><a href="<c:url value='/member/idPwFind.do?find=id'/>">아이디찾기</a>
				<span style="color:lightgray">|</span>
				<a href="<c:url value='/member/idPwFind.do?find=pw'/>">비밀번호 찾기</a></div>
		</div>
		<hr class="bd-light"/>
		<div class="d-flex justify-content-center">
			<div><a href="<c:url value='/member/register.do'/>">회원가입</a></div>
		</div>
	</div>
</div>
</body>
</html>
