<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.adminloginDto.id==null}">
  <%@ include file="admin_login.jsp" %>
</c:if>
<c:if test="${sessionScope.adminloginDto.id!=null}">
<%@ include file="inc/admin_header.jsp" %>
<style>
  td{vertical-align:middle;}
</style>
<div class="container w-50 border shadow-sm p-5 my-5">
  <h3 class="mb-3">카테고리 목록</h3>
  <table class="table">
    <thead>
    <tr>
      <th>번호</th>
      <th>코드</th>
      <th>카테고리명</th>
      <th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="cDto" items="${list}">
      <tr>
        <td>${cDto.cat_num}</td>
        <td>${cDto.code}</td>
        <td>${cDto.cat_name}</td>
        <td>
          <a href="<c:url value='/admin/catInfo.do?cat_num=${cDto.cat_num}'/>" class="btn btn-sm btn-info">수정</a>
          <a href="<c:url value='/admin/catDelete.do?cat_num=${cDto.cat_num}'/>"
             class = "btn btn-outline-danger btn-sm">삭제</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
  <%@ include file="inc/admin_footer.jsp" %>
</c:if>

