<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/view_header.jsp" %>
<style>
  a{
    text-decoration: none;
    color: darkgray;
  }
  input[type='date']::before{
    content: attr(data-placeholder);
    width: 100%;
    color:#666;
  }
  input[type='date']:valid::before{
    display: none;
  }
  li{
    list-style: none;
  }

</style>
<div class='container mt-5 d-flex'>
  <aside class="col-sm-3">
    <h4 class="mb-4">마이페이지</h4>
    <ul>
      <li><a href="<c:url value='/view/myPage.do'/>">비밀번호 변경</a></li>
      <li><a href="<c:url value='/view/userInfo.do'/>">회원정보 수정</a></li>
	<li><a href="<c:url value='/view/questionInfo.do?q_writer=${sessionScope.loginDto.id}'/>">문의사항 확인</a></li>
    </ul>
  </aside>
    <div class="container col-sm-9 mb-4">
   	<div class="row justify-content-start">
	  <div class="dropdown">
	  	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
	    문의사항 종류
	  	</button>
	  	<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
	    		<li><a class="dropdown-item" href='/shop2/view/questionInfo.do?q_writer=${sessionScope.loginDto.id}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'>전체</a></li>
	  		<c:forEach var="opspec" items="${opspec}">
	    		<li><a class="dropdown-item" href='/shop2/view/questionInfo.do?q_writer=${sessionScope.loginDto.id}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}&ques_option=${opspec.name()}'>${opspec.value}</a></li>
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
      <th>공개여부</th>
      <th>등록일</th>
      <th>진행상태</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="rowNum" value="${paDto.startRowNum}"/>
    <c:forEach var="dto" items="${ques_list}">
      <tr>
        <td>${rowNum}</td>
        <td><a href="<c:url value='/view/myquesInfo.do?qid=${dto.qid}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}&ques_option=${paDto.ques_option}'/>"><c:out value="${dto.q_subject}"/></a></td>
        <td><c:forEach var="opspec" items="${opspec}"><c:if test="${opspec.name()==dto.ques_option}">${opspec.value}</c:if> </c:forEach></td>
        <td>${dto.ques_state=="open" ? '공개' : '비공개'}</td>
        <td>${dto.reg_date}</td>
        <td>${dto.ans_state}</td>
      </tr>
      <c:set var="rowNum" value="${rowNum - 1}"/>
    </c:forEach>

    </tbody>
  </table>
  <ul class="pagination justify-content-center my-5">
    <li class="page-item ${paDto.prevPage <=0 ? 'disabled':''}">
      <a class="page-link" href="questionInfo.do?viewPage=${paDto.prevPage}&cntPerPage=${paDto.cntPerPage}&ques_option=${paDto.ques_option}">
        <i class="fa fa-chevron-left" style="color: #000000;"></i>
      </a>
    </li>

    <c:forEach var="i" begin="${paDto.blockStart}" end="${paDto.blockEnd}">
      <li class="page-item ${paDto.viewPage == i ? 'active':''}">
        <a class="page-link" href="questionInfo.do?viewPage=${i}&cntPerPage=${paDto.cntPerPage}&ques_option=${paDto.ques_option}">${i}</a>
      </li>
    </c:forEach>

    <li class="page-item ${paDto.blockEnd >=paDto.totalPage ? 'disabled':''}">
      <a class="page-link" href="questionInfo.do?viewPage=${paDto.nextPage}&cntPerPage=${paDto.cntPerPage}&ques_option=${paDto.ques_option}">
        <i class="fa fa-chevron-right" style="color: #000000;"></i>
      </a>
    </li>
  </ul>
  	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/zipcode.js"></script>

<%@ include file="inc/view_footer.jsp" %>
