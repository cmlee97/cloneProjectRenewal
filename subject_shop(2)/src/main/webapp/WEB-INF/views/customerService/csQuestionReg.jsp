<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/cs_header.jsp" %>
<div class="container w-75 mt-5 p-5">

    <form action="<c:url value="/view/quesRegister.do"/>" method="post" name="ques_input_form">
        <input type="hidden" name="cntPerPage" value="${pDto.cntPerPage}"/>
        <h4 class="mb-4 text-center">글쓰기</h4>
		<select class="form-select form-select-sm" id="ques_option" name="ques_option">
            <option value="none" selected>문의사항을 선택하세요</option>
            <c:forEach var="opspec" items="${opspec}">
              <option value="${opspec.name()}">${opspec.value}</option>
            </c:forEach>
          </select>
        <input class="form-control mt-2" type="text" id="q_subject" name="q_subject" placeholder="글제목을 입력하세요" autofocus>

        <textarea class="form-control mt-2" name="q_contents" id="q_contents" style="height:400px;" placeholder="내용을 입력하세요"></textarea>

        <input class="form-control mt-2" type="text" id="q_writer" name="q_writer" value="${sessionScope.loginDto.id}" placeholder="${sessionScope.loginDto.id}">
		<h6 class="mt-2 mb-2">공개여부</h6>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="ques_state" id="ques_state" value="open" checked>
		  <label class="form-check-label" for="inlineRadio1">공개</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="ques_state" id="ques_state" value="notopen">
		  <label class="form-check-label" for="inlineRadio2" >비공개</label>
		</div>

        <div class="text-center mt-3">
            <input class="btn btn-outline-success" onclick = "inputCheck()"value ="등록"></input>
        </div>
    </form>
</div>

<script>
	function inputCheck(e){
		if(document.getElementById("ques_option").value=="none") {
			alert("문의사항을 선택하세요");
			return;
		}
		document.ques_input_form.submit();
	}
</script>
<%@ include file="inc/cs_footer.jsp" %>

