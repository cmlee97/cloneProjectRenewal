<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/cs_header.jsp" %>
<style>
  a{
    color: black;
  }
</style>
<div class="container mt-5">
  <h3 class="mb-2 text-center">문의사항</h3>
  <h6 class="mb-4 text-center">빠른 시일 내에 답변드리겠습니다.</h6>
  <table class="table">
    <thead class="table-dark">
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>조회수</th>
      <th>글쓴이</th>
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
        <td><a href="<c:url value='/view/quesInfo.do?qid=${dto.qid}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>"><c:out value="${dto.q_subject}"/></a></td>
        <td>${dto.q_hit}</td>
        <td><c:out value="${dto.q_writer}"/></td>
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
      <a class="page-link" href="questionList.do?viewPage=${paDto.prevPage}&cntPerPage=${paDto.cntPerPage}">
        <i class="fa fa-chevron-left" style="color: #000000;"></i>
      </a>
    </li>

    <c:forEach var="i" begin="${paDto.blockStart}" end="${paDto.blockEnd}">
      <li class="page-item ${paDto.viewPage == i ? 'active':''}">
        <a class="page-link" href="questionList.do?viewPage=${i}&cntPerPage=${paDto.cntPerPage}">${i}</a>
      </li>
    </c:forEach>

    <li class="page-item ${paDto.blockEnd >=paDto.totalPage ? 'disabled':''}">
      <a class="page-link" href="questionList.do?viewPage=${paDto.nextPage}&cntPerPage=${paDto.cntPerPage}">
        <i class="fa fa-chevron-right" style="color: #000000;"></i>
      </a>
    </li>
  </ul>
</div>
<script>
  $(document).ready(function(){
    $("#btn-write").click(()=>{
      location.href="<c:url value='/view/quesRegister.do'/>";
    })
  });

  $("#cntPerPage").change(function () {
    let cntVal = $("#cntPerPage option:selected").val();
    alert(cntVal);
    <%--location.href = "<c:url value='list.do?viewPage=${pDto.viewPage}&cntPerPage='/>"+cntVal;--%>
    location.href = "<c:url value='list.do?viewPage=1&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}&cntPerPage='/>"+cntVal;
  });
</script>
<%@ include file="inc/cs_footer.jsp" %>
