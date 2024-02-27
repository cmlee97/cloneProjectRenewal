<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-06-23
  Time: 오후 4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="inc/admin_header.jsp" %>
<div class = "container mt-5 border shadow p-5 mb-5">
  <h3>관리자 로그인</h3>
  <form action="<c:url value='/admin/loginOk.do'/>">
    <div class="mt-3 mb-3">
      <lable for="id">아이디</lable>
      <input type="text" class="form-control" id="id" placeholder="아이디" name="id"
             value="">
    </div>
    <div class="mb-3">
      <lable for="pw">비밀번호</lable>
      <input type="password" class="form-control" id="password" placeholder="비밀번호" name="password"/>
    </div>
    <div class="text-center">
      <input type="submit" class="btn btn-sm btn-primary" value="로그인"/>
    </div>
  </form>
</div>
<%@ include file="inc/admin_footer.jsp" %>
