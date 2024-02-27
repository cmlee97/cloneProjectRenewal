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
<div class="container w-75 mt-5">
  <h3 class="mb-3"> 회원 리스트</h3>
  <table class='table table-striped'>
    <thead class='table-dark'>
    <tr>
      <th>번호</th>
      <th>아이디</th>
      <th>비밀번호</th>
      <th>이름</th>
      <th>나이</th>
      <th>생년월일</th>
      <th>이메일</th>
      <th>전화번호</th>
      <th>주소</th>
      <th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="dto" items="${list}">
      <tr>
        <td>${dto.no}</td>
        <td><a href="<c:url value = '/admin/memberInfo.do?no=${dto.no}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>">${dto.id}</a></td>
        <td>${dto.pw}</td>
        <td>${dto.name}</td>
        <td>${dto.age}</td>
        <td>${dto.birthday}</td>
        <td>${dto.email}</td>
        <td>${dto.tel}</td>
        <td>(${dto.zipcode})${dto.road_addr} ${dto.detail_addr}</td>

        <td><a href="<c:url value='/admin/memberDelete.do?no=${dto.no}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>" class='btn btn-danger btn-sm'>삭제</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
  <hr/>
  <ul class="pagination justify-content-center">
    <li class="page-item ${paDto.prevPage<=0 ? 'disabled': ''}">
      <a class="page-link" href="memberList.do?viewPage=${paDto.prevPage}&cntPerPage=${paDto.cntPerPage}">이전</a>
    </li>
    <c:forEach var="i" begin="${paDto.blockStart}" end="${paDto.blockEnd}">
      <li class="page-item ${paDto.viewPage == i ? 'active':''}">
        <a class="page-link" href="memberList.do?viewPage=${i}&cntPerPage=${paDto.cntPerPage}">${i}</a>
      </li>
    </c:forEach>
    <li class="page-item ${paDto.blockEnd>=paDto.totalPage ? 'disabled': ''}">
      <a class="page-link" href="memberList.do?viewPage=${paDto.nextPage}&cntPerPage=${paDto.cntPerPage}">다음</a>
    </li>
  </ul>
<script>
  function memDel(no){
    let isDel = confirm("삭제 하시겠습니까?");
    if(isDel) location.href="memberDelete.do?no="+no;
  }
</script>
  <%@ include file="inc/admin_footer.jsp" %>
</c:if>

