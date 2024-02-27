<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.adminloginDto.id==null}">
  <%@ include file="admin_login.jsp" %>
</c:if>
<c:if test="${sessionScope.adminloginDto.id!=null}">
  <%@ include file="inc/admin_header.jsp" %>
<div class="container mt-5">

  <h2 class="mb-3">공지 사항</h2>
    <table class="table mt-4">
    <thead class="table-dark">
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>글쓴이</th>
      <th>조회수</th>
      <th>등록일</th>
    </tr>
    </thead>
    <%-- XSS(cross-site Scripting 공격 : 웹사이트에 스크립트 코드를 주입시켜서 공격하는
       해킹 기법,
       JSP의 <c:out />는 입력된 태그를 해석하지 못하도록 문자로 변환하여 공격을 방어함.
    --%>
    <tbody>
    <c:set var="rowNum" value="${paDto.startRowNum}"/>
    <c:forEach var="dto" items="${list}">
      <tr>
        <td>${rowNum}</td>
        <td><a href="<c:url value='/admin/noticeInfo.do?bid=${dto.bid}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>">${dto.subject}</a></td>
        <td><c:out value="${dto.writer}"/></td>
        <td>${dto.hit}</td>

        <td>${dto.reg_date}</td>
      </tr>
      <c:set var="rowNum" value="${rowNum - 1}"/>
    </c:forEach>
    <tr>
      <td colspan="5" class="text-center">
        <button class="btn btn-dark" id="btn-write">글쓰기</button>
      </td>
    </tr>
    </tbody>
  </table>
  <ul class="pagination justify-content-center my-5">
    <li class="page-item ${paDto.prevPage <=0 ? 'disabled':''}">
      <a class="page-link" href="noticeList.do?viewPage=${paDto.prevPage}&cntPerPage=${paDto.cntPerPage}">이전</a>
    </li>

    <c:forEach var="i" begin="${paDto.blockStart}" end="${paDto.blockEnd}">
      <li class="page-item ${paDto.viewPage == i ? 'active':''}">
        <a class="page-link" href="noticeList.do?viewPage=${i}&cntPerPage=${paDto.cntPerPage}">${i}</a>
      </li>
    </c:forEach>

    <li class="page-item ${paDto.blockEnd >=paDto.totalPage ? 'disabled':''}">
      <a class="page-link" href="noticeList.do?viewPage=${paDto.nextPage}&cntPerPage=${paDto.cntPerPage}">다음</a>
    </li>
  </ul>
  </div>
  <script>
    $(document).ready(function(){
      $("#btn-write").click(()=>{
        location.href="<c:url value='/admin/noticeRegister.do'/>";
      })
    });
  </script>

<%@ include file="inc/admin_footer.jsp" %>
</c:if>