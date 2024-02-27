
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/admin_header.jsp" %>

<div class="container d-flex mt-5 justify-content-center">
  <div class="w-75 shadow p-5 rounded border">
    <form method="post" action="<c:url value='/admin/noticeModify.do'/>">
      <input type="hidden" name="viewPage" value="${paDto.viewPage}"/>
      <input type="hidden" name="cntPerPage" value="${paDto.cntPerPage}"/>
        <%-- <input type="hidden" name="searchType" value="${pDto.searchType}"/>
         <input type="hidden" name="keyWord" value="${pDto.keyWord}"/>--%>
      <h3>공지사항 수정</h3>
      <div class="form-group">
        <label for="subject">번호</label>
        <input type="text" class="form-control" id="bid"
               name="bid" readonly value="${nDto.bid}"/>
      </div>

      <div class="form-group">
        <label for="subject">제목</label>
        <input type="text" class="form-control" id="subject"
               name="subject" value="${nDto.subject}"/>
      </div>

      <div class="form-group">
        <label for="contents">내용</label>
        <textarea class="form-control" id="contents"
                  name="contents" rows="4">${nDto.contents}</textarea>
      </div>
      <div class="form-group">
        <label for="writer">글쓴이</label>
        <input type="text" class="form-control" id="writer"
               name="writer" readonly value="${nDto.writer}"/>
      </div>
      <div class="form-group mt-4">
        <button type="submit" id="btn-modify" class="btn btn-primary me-2">수정하기</button>
        <button type="button" id="btn-remove" class="btn btn-danger me-2">삭제</button>
        <button type="button" id="btn-list" class="btn btn-secondary">리스트</button>
      </div>
    </form>
  </div>
</div>
<script>
  $("#btn-list").click(()=>{
    location.href="<c:url value='/admin/noticeList.do?viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>";
  });
  $("#btn-remove").click(()=>{
    location.href="<c:url value='/admin/noticeRemove.do?bid=${nDto.bid}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>";
  });
</script>
<%@ include file="inc/admin_footer.jsp" %>