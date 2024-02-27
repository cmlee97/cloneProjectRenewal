<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-07-04
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/cs_header.jsp" %>
<div class="container w-75 mt-5 p-5">
    <form method="post" action="<c:url value='/view/quesModify.do'/>">
      <input type="hidden" name="viewPage" value="${paDto.viewPage}"/>
      <input type="hidden" name="cntPerPage" value="${paDto.cntPerPage}"/>
<%--      <input type="hidden" name="searchType" value="${pDto.searchType}"/>
      <input type="hidden" name="keyWord" value="${pDto.keyWord}"/>--%>
      <h3 class="mb-4">문의사항 수정 하기</h3>
      <div class="form-group">
        <label for="qid">번호</label>
        <input type="text" class="form-control" id="qid"
               name="qid" readonly value="${qDto.qid}"/>
      </div>

      <div class="form-group">
        <label for="q_subject">제목</label>
        <input type="text" class="form-control" id="q_subject"
               name="q_subject" value="${qDto.q_subject}"/>
      </div>

      <div class="form-group">
        <label for="q_contents">내용</label>
        <textarea class="form-control" id="q_contents"
                  name="q_contents" rows="4">${qDto.q_contents}</textarea>
      </div>
      <div class="form-group">
        <label for="q_writer">글쓴이</label>
        <input type="text" class="form-control" id="q_writer"
               name="q_writer" readonly value="${qDto.q_writer}"/>
      </div>
      <div class="form-group mt-4 d-flex justify-content-center">
        <button type="submit" id="btn-modify" class="btn btn-success me-2">수정하기</button>
        <button type="button" id="btn-remove" class="btn btn-danger me-2">삭제</button>
        <button type="button" id="btn-list" class="btn btn-secondary">리스트</button>
      </div>
    </form>

</div>
<script>
  $("#btn-list").click(()=>{
    location.href="<c:url value='/view/questionList.do?viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>";
  });
  $("#btn-remove").click(()=>{
    location.href="<c:url value='/view/questionRemove.do?qid=${qDto.qid}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>";
  });
</script>
<%@ include file="inc/cs_footer.jsp" %>