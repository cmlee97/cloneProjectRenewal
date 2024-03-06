<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.adminloginDto.id==null}">
  <%@ include file="admin_login.jsp" %>
</c:if>
<c:if test="${sessionScope.adminloginDto.id!=null}">
<%@ include file="inc/admin_header.jsp" %>
<style>
  a{
    color: black;
  }
</style>
<input type="hidden" value="${sessionScope.loginDto.id}" id="loginUser"/>
<div class="container mt-5">
  <h3 class="mb-2 text-center">문의사항 리스트</h3>
  <div class="row justify-content-start">
	  <div class="dropdown">
	  	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
	    문의사항 종류
	  	</button>
	  	<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
	    		<li><a class="dropdown-item" href='questionList.do?viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'>전체</a></li>
	  		<c:forEach var="opspec" items="${opspec}">
	    		<li><a class="dropdown-item" href='questionList.do?viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}&ques_option=${opspec.name()}'>${opspec.value}</a></li>
	  		</c:forEach>
	  	</ul>
	  </div>
  </div>
  <table class="table">
    <thead class="table-dark text-center">
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>종류</th>
      <th>고객아이디</th>
      <th>공개여부</th>
      <th>등록일</th>
      <th>진행상태</th>
      <th></th>
    </tr>
    </thead>
    <tbody>
    <c:set var="rowNum" value="${paDto.startRowNum}"/>
    <c:forEach var="dto" items="${list}">
      <tr class="text-center">
        <td>${rowNum}</td>
        <td><a href="<c:url value='quesInfo.do?qid=${dto.qid}'/>"><c:out value="${dto.q_subject}"/></a></td>
        <td><c:forEach var="opspec" items="${opspec}"><c:if test="${opspec.name()==dto.ques_option}">${opspec.value}</c:if></c:forEach></td>
        <td>${dto.q_writer}</td>
        <td>${dto.ques_state=="open" ? '공개' : '비공개'}</td>
        <td>${dto.reg_date}</td>
        <td>${dto.ans_state}</td>
        <td><a class="btn btn-success">답변등록</a></td>
      </tr>
      <c:set var="rowNum" value="${rowNum - 1}"/>
    </c:forEach>

    </tbody>
  </table>
  <ul class="pagination justify-content-center my-5">
    <li class="page-item ${paDto.prevPage <=0 ? 'disabled':''}">
      <a class="page-link" href="questionList.do?viewPage=${paDto.prevPage}&cntPerPage=${paDto.cntPerPage}&ques_option=${paDto.ques_option}">
        <i class="fa fa-chevron-left" style="color: #000000;"></i>
      </a>
    </li>

    <c:forEach var="i" begin="${paDto.blockStart}" end="${paDto.blockEnd}">
      <li class="page-item ${paDto.viewPage == i ? 'active':''}">
        <a class="page-link" href="questionList.do?viewPage=${i}&cntPerPage=${paDto.cntPerPage}&ques_option=${paDto.ques_option}">${i}</a>
      </li>
    </c:forEach>

    <li class="page-item ${paDto.blockEnd >=paDto.totalPage ? 'disabled':''}">
      <a class="page-link" href="questionList.do?viewPage=${paDto.nextPage}&cntPerPage=${paDto.cntPerPage}&ques_option=${paDto.ques_option}">
        <i class="fa fa-chevron-right" style="color: #000000;"></i>
      </a>
    </li>
  </ul>
</div>
<script>
  $(document).ready(function(){
    $("#btn-write").click(()=>{
    	let session = document.getElementById('loginUser').value;
    	if(session==''){
    		alert("로그인이 필요한 서비스 입니다.");
    		return;
    	}
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
  <%@ include file="inc/admin_footer.jsp" %>
</c:if>