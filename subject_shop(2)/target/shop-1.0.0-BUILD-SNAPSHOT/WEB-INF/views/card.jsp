<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<c:if test="${dto.p_category_fk==cat && (cnt<5)}">
  <c:set var = "cnt" value = "${cnt+1}"/>
<!-- Card -->
<div class="card me-5" style="width:200px; border:none"; height:350px;>
  <a href="<c:url value='/view/prodView.do?p_num=${dto.p_num}&p_spec=${dto.p_spec}'/>" style="height:200px; overflow:hidden;">
    <img class="card-image rounded" src="<c:url value="/fileRepo/${dto.p_image}"/>"
         alt="Card image" style="width:100%">

  </a>
    <div class="card-body">
      <h4 class="card-title" style= "font-size:15px;"><b>${dto.p_name}</b></h4>
      <p class="card-text">${dto.p_company}</p>
      <p class="card-text"><fmt:formatNumber value="${dto.price}"/></p>
      <%--<!-- 로그인 되었을 경우 -->
      <c:if test = "${sessionScope.loginDto !=null}">
        <a href="cartAdd.do?p_num=${dto.p_num}&p_qty=1&p_spec=${dto.p_spec}" class="btn btn-primary" style ="width:100%">장바구니 담기</a>
      </c:if>
      <!-- 로그인 안되었을 경우 -->
      <c:if test = "${sessionScope.loginDto ==null}">
        <a href="javascript:alert('로그인이 필요합니다')" class="btn btn-primary" style ="width:100%">장바구니 담기</a>
      </c:if>--%>
    </div>

</div>
</c:if>