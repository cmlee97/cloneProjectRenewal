<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/admin_header.jsp" %>

<div class="container w-50 mt-5">
  <h3>상품 수정</h3>
  <form action="<c:url value='/admin/catUpdate.do'/>" method="post">
    <table class="table table-borderless">
      <tbody>
      <tr>
        <td>카테고리번호</td>
        <td><input  class="form-control form-control-sm" type="text" name="cat_num" value="${cDto.cat_num}" readonly/></td>
      </tr>
      <tr>
        <td>코드</td>
        <td>
          <input type="text" class="form-control form-control-sm" name="code" value = "${cDto.code}"/>
        </td>
      </tr>
      <tr>
        <td>카테고리명</td>
        <td><input type="text" class="form-control form-control-sm" name="cat_name" value = "${cDto.cat_name}"/></td>
      </tr>

      <tr>
        <td colspan="2" class="text-center">
          <input type="submit" class="btn btn-sm btn-primary" value="카테고리수정"/>
          <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>
        </td>
      </tr>
      </tbody>
    </table>
  </form>
</div>

<%@ include file="inc/admin_footer.jsp" %>
