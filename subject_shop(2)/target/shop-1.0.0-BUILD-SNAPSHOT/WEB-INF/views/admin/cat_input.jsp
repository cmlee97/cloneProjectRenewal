<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.adminloginDto.id!=null}">
<%@ include file="inc/admin_header.jsp" %>
  <div class="container w-50 border shadow-sm p-5 my-5">
    <h3>카테고리 등록</h3>

    <form action="<c:url value='/admin/catInput.do'/>" method="post" name="cat_inputFrm">
      <div class="mt-3">
        <label for="code">카테고리 코드</label>
        <input type="text" class="form-control" id="code"
               placeholder="카테고리 코드를 입력하세요" name="code"/>
      </div>
      <div class="mt-3 mb-3">
        <label for="cat_name">카테고리명</label>
        <input type="text" class="form-control" id="cat_name"
               placeholder="카테고리명을 입력하세요" name="cat_name"/>
      </div>
      <div class="text-center">
        <!-- <button></button> : form태그 안에서는 자동으로 submit됨-->
        <input type="button" class="btn btn-primary btn-sm" value="등록"
               onclick = "inputChk()"/>
        <input type="reset" value="취소" class="btn btn-sm btn-secondary"/>
      </div>
    </form>
  </div>
  <%@ include file="inc/admin_footer.jsp" %>
</c:if>
<c:if test="${sessionScope.adminloginDto.id==null}">
  <%@ include file="admin_login.jsp" %>
</c:if>
<script>
  function inputChk(){
    if(!cat_inputFrm.code.value){//code의 값이 null이면 false
      alert("카테고리 코드를 입력하세요");
      cat_inputFrm.code.focus();
      return;
    }
    if(!cat_inputFrm.cat_name.value){//code의 값이 null이면 false
      alert("카테고리 명을 입력하세요");
      cat_inputFrm.cat_name.focus();
      return;
    }
    document.cat_inputFrm.submit();
  }
</script>

