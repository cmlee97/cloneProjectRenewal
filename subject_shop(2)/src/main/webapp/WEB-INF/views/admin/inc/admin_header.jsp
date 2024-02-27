<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
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
        <li class="nav-item">
          <c:if test="${sessionScope.adminloginDto.id==null}">
            <a class="nav-link" href="<c:url value='/admin/login.do'/>">관리자 로그인</a>
          </c:if>
          <c:if test="${sessionScope.adminloginDto.id!=null}">
            <a class="nav-link" href="<c:url value='/admin/logout.do'/>">관리자 로그아웃</a>
          </c:if>
        </li>
      </ul>
    </div>
  </nav>
</div>
<div class="bg-black w-100 d-flex justify-content-center border-bottom border-dark">
  <nav class="navbar navbar-expand-sm bg-black navbar-dark col-sm-7" style="height:90px">
    <div class="container-fluid col-sm-2">
      <a class="navbar-brand" href="../"><img src="../img/logo.png" style="width:150px"></a>
    </div>
  </nav>
</div>

  <div class="bg-black w-100 d-flex justify-content-center">
    <nav class="navbar navbar-expand-sm bg-black navbar-dark col-sm-7" >
      <div class="container-fluid">
        <ul class="navbar-nav row-cols-5 text-center">
          <li class="nav-item">
            <a class="nav-link" style="color:white" href="<c:url value='/admin/home.do'/>">HOME</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/catInput.do'/>">카테고리등록</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/catList.do'/>">카테고리리스트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/prodInput.do'/>">상품등록</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/prodList.do'/>">상품리스트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/memberList.do'/>">회원리스트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/admin/noticeList.do'/>">공지사항 관리</a>
          </li>
        </ul>
      </div>
    </nav>
  </div>


<!-- header -->
