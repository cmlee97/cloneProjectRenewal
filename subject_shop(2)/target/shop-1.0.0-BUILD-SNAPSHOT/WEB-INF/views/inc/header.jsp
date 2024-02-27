<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>롯데백화점</title>
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
    a{
      text-decoration: none;
    }
  </style>
</head>
<body>
<div class="bg-black w-100 d-flex justify-content-center">
  <nav class="navbar navbar-expand-sm bg-black navbar-dark col-sm-7" style="height:30px; font-size:10px;">
    <div class="container-fluid">
      <ul class="navbar-nav pt-1 ms-auto">
        <li class="nav-item d-flex">
          <c:if test="${sessionScope.loginDto.id==null}">
            <a class="nav-link" href="<c:url value='/member/login.do'/>">로그인</a>
          </c:if>
          <c:if test="${sessionScope.loginDto.id!=null}">
            <p class="mt-2" style="color:white;">${sessionScope.loginDto.name}님 반갑습니다.</p>
            <a class="nav-link" href="<c:url value='/member/logout.do'/>">
               로그아웃</a>
          </c:if>
        </li>
        <li class="nav-item">
          <c:if test="${sessionScope.loginDto.id==null}">
          <a class="nav-link" href="<c:url value='/member/register.do'/>">회원가입</a>
          </c:if>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value='/view/customerService.do'/>">고객센터</a>
        </li>
      </ul>
    </div>
  </nav> 
</div> 
<div class="bg-black w-100 d-flex justify-content-center border-bottom border-dark">
  <nav class="navbar navbar-expand-sm bg-black navbar-dark col-sm-7" style="height:90px">
    <div class="container-fluid col-sm-2">
      <a class="navbar-brand" href="<c:url value='/'/>"><img src="<c:url value='img/logo.png'/>" style="width:150px"></a>
    </div>
    <div class="container-fluid col-sm-8">

    </div>
    <div class="container-fluid col-sm-1 text-align-center">
      <c:if test="${sessionScope.loginDto != null}">
        <a class="navbar-brand" href="<c:url value='/view/myPage.do'/>">
          <i class = "fa fa-user" style="color: #ffffff;padding-left:15px;"></i><p style="font-size:12px;">마이롯데</p>
        </a>
      </c:if><c:if test="${sessionScope.loginDto == null}">
      <a class="navbar-brand" href="javascript:alert('로그인이 필요합니다')">
        <i class="fa fa-user" style="color: #ffffff; padding-left:15px;"></i><p style="font-size:12px;">마이롯데</p>
      </a>
      </c:if>
    </div>
    <div class="container-fluid col-sm-1">
      <c:if test="${sessionScope.loginDto != null}">
        <a class="navbar-brand" href="<c:url value='/cart/cart.do'/>">
          <i class="fa fa-shopping-bag" style="color: #ffffff; padding-left:10px;"></i><p style="font-size:12px;">쇼핑백</p>
        </a>
      </c:if><c:if test="${sessionScope.loginDto == null}">
        <a class="navbar-brand" href="javascript:alert('로그인이 필요합니다')">
          <i class = "fa fa-shopping-bag" style="color: #ffffff; padding-left:10px;"></i><p style="font-size:12px;">쇼핑백</p>
        </a>
      </c:if>
    </div>
   
  </nav>
</div>
<div class="bg-black w-100 d-flex justify-content-center">
  <div class="dropdown" style="background-color: white; width:50px;">
  <button type="button" class="btn dropdown" style="background-color: white; height:100%; width:50px;" data-bs-toggle="dropdown">
    <i class="fa fa-bars" style="color: #000000;"></i>
  </button>
    <ul class="dropdown-menu" style="position: relative; z-index:8; border-radius: 0;">
      <c:forEach var = "dto" items="${cat_list}">
        <li class="dropdown-item" onclick="click(${dto.code})">
          <a class="dropdown-link w-100" style="color:black;" href="<c:url value='/view/catView.do?p_category_fk=${dto.code}' />">${dto.cat_name}</a>
        </li>
      </c:forEach>
    </ul>
  </div>
  <nav class="navbar navbar-expand-sm bg-black navbar-dark col-sm-7" >

    <div class="container-fluid" >
      <ul class="navbar-nav col-sm-3">
        <li class="nav-item">
          <a class="nav-link" style="color:white" href="<c:url value="/" />">HOME</a>
        </li>
        <li class="nav-item">
          <a class="nav-link mx-3" href="<c:url value='/view/prodAll.do'/>">ALL</a>
        </li>

        <c:forEach var="p_spec" items="${pdSpec}">
          <li class="nav-item mx-3">
              <a class="nav-link" href="<c:url value='/view/specView.do?p_spec=${p_spec.name()}'/>">${p_spec.name()}</a>
          </li>
        </c:forEach>


      </ul>
    </div>
  </nav>
</div>
<script>
  function click(code){
    location.href="<c:url value='/view/catView.do?p_category_fk='/>"+code;
  }
</script>
<!-- header -->
