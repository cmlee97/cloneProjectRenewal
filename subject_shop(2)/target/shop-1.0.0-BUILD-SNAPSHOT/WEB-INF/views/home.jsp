<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/header.jsp" %>

<div id="demo" class="carousel slide bg-black" data-bs-ride ="carousel">
	
  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="5"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="6"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="7"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="8"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="9"></button>
  </div>

  <!-- The slideshow/carousel -->
  <div class="carousel-inner w-100" style="width:100%; overflow:hidden;">
    <div class="carousel-item active w-100">
      <img src="img/optimize (1).jpg" alt=".." class="d-block">
    </div>
    <div class="carousel-item">
      <img src="img/optimize (2).jpg" alt=".." class="d-block">
    </div>
    <div class="carousel-item">
      <img src="img/optimize (3).jpg" alt=".." class="d-block">
    </div>
    <div class="carousel-item">
      <img src="img/optimize (4).jpg" alt=".." class="d-block">
    </div>
    <div class="carousel-item">
      <img src="img/optimize (5).jpg" alt=".." class="d-block">
    </div>
    <div class="carousel-item">
      <img src="img/optimize (6).jpg" alt=".." class="d-block">
    </div>
    <div class="carousel-item">
      <img src="img/optimize (7).jpg" alt=".." class="d-block">
    </div>
    <div class="carousel-item">
      <img src="img/optimize (8).jpg" alt=".." class="d-block">
    </div>
    <div class="carousel-item">
      <img src="img/optimize (9).jpg" alt=".." class="d-block">
    </div>
    <div class="carousel-item">
      <img src="img/optimize (10).jpg" alt=".." class="d-block">
    </div>
  </div>

  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" style="width:100px; height:100px;"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon" style="width:100px; height:100px;"></span>
  </button>
</div>
<div class="w-100 text-center"
     style="background-image: url('img/homeimg1.jpg'); height:100%; background-position: center; background-size: cover;
  object-fit: fill;">
  <h1 class="p-5 mb-4" style="color:white; font-size:50px;">BEAUTY</h1>
  <section class="w-100 ps-5 d-flex justify-content-center p-5">
    <div class="d-flex justify-content-center col-sm-7">
      <c:set var = "cnt" value = "0"/>
      <c:set var = "cat" value = "A100"/>
      <c:if test="${prod_list.size()!=0}">
        <div class="d-flex w-100">
          <c:forEach var = "dto" items="${prod_list}">
            <%@ include file="card.jsp" %>
          </c:forEach>
          <c:set var = "cnt" value = "0"/>
        </div>
      </c:if>
    </div>
  </section>

</div>
<div class="w-100 text-center"
     style="background-image: url('img/homeimg2.jpg'); height:100%; background-position: center; background-size: cover;
  object-fit: fill;">
  <h1 class="p-5 mb-4" style="color:white; font-size:50px;">CLOTHES</h1>
  <section class="w-100 ps-5 d-flex justify-content-center p-5">
    <div class="d-flex justify-content-center col-sm-7">
      <c:set var = "cnt" value = "0"/>
      <c:set var = "cat" value = "B100"/>
      <c:if test="${prod_list.size()!=0}">
        <div class="d-flex w-100">
          <c:forEach var = "dto" items="${prod_list}">
            <%@ include file="card.jsp" %>
          </c:forEach>
          <c:set var = "cnt" value = "0"/>
        </div>
      </c:if>
    </div>
  </section>

</div>
<div class="w-100 text-center"
     style="background-image: url('img/homeimg3.jpg'); height:100%; background-position: center; background-size: cover;
  object-fit: fill;">
    <h1 class="p-5 mb-4" style="color:white; font-size:50px;">LIVING</h1>
    <section class="w-100 ps-5 d-flex justify-content-center p-5">
      <div class="d-flex justify-content-center col-sm-7">
        <c:set var = "cnt" value = "0"/>
        <c:set var = "cat" value = "C100"/>
        <c:if test="${prod_list.size()!=0}">
          <div class="d-flex w-100">
            <c:forEach var = "dto" items="${prod_list}">
                <%@ include file="card.jsp" %>
            </c:forEach>
            <c:set var = "cnt" value = "0"/>
          </div>
        </c:if>
      </div>
    </section>
  </div>
<div class="w-100 text-center"
     style="background-image: url('img/homeimg4.jpg'); height:100%; background-position: center; background-size: cover;
  object-fit: fill;">
  <h1 class="p-5 mb-4" style="color:white; font-size:50px;">SPORTS</h1>
  <section class="w-100 ps-5 d-flex justify-content-center p-5">
    <div class="d-flex justify-content-center col-sm-7">
      <c:set var = "cnt" value = "0"/>
      <c:set var = "cat" value = "D100"/>
      <c:if test="${prod_list.size()!=0}">
        <div class="d-flex w-100">
          <c:forEach var = "dto" items="${prod_list}">
            <%@ include file="card.jsp" %>
          </c:forEach>
          <c:set var = "cnt" value = "0"/>
        </div>
      </c:if>
    </div>
  </section>
</div>
<%@ include file="inc/footer.jsp" %>