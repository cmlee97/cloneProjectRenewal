<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/cs_header.jsp" %>
<div class="container w-75 mt-5 p-5">

    <form action="<c:url value="/view/quesRegister.do"/>" method="post">
        <input type="hidden" name="cntPerPage" value="${pDto.cntPerPage}"/>
        <h4 class="mb-4 text-center">글쓰기</h4>

        <input class="form-control" type="text" id="q_subject" name="q_subject" placeholder="글제목을 입력하세요" autofocus>

        <textarea class="form-control mt-2" name="q_contents" id="q_contents" style="height:400px;" placeholder="내용을 입력하세요"></textarea>

        <input class="form-control mt-2" type="text" id="q_writer" name="q_writer" placeholder="이름을 입력하세요">

        <div class="text-center mt-3">
            <button class="btn btn-sm btn-light border border-secondary">등록</button>
        </div>
    </form>
</div>
<%@ include file="inc/cs_footer.jsp" %>
