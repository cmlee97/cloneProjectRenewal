<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.adminloginDto.id==null}">
  <%@ include file="admin_login.jsp" %>
</c:if>
<c:if test="${sessionScope.adminloginDto.id!=null}">
<%@ include file="inc/admin_header.jsp" %>
<style>
  td{vertical-align:middle;}
</style>
<div class="container w-50 mt-5">
  <h3>상품 등록</h3>
  <form action="<c:url value='/admin/prodInput.do'/>" method="post" enctype="multipart/form-data">
    <table class="table table-borderless">
      <tbody>
      <tr>
        <td>카테고리</td>
        <td>
          <select class="form-select form-select-sm" name="p_category_fk">
            <c:if test = "${list==null || list.size() ==0}">
              <option value="">카테고리 없음</option>
            </c:if>
            <c:if test = "${list!=null || list.size() !=0}">
              <c:forEach var = "cDto" items="${list}">
                <option value="${cDto.code}">${cDto.cat_name}[${cDto.code}]</option>
              </c:forEach>
            </c:if>
          </select>
        </td>
      </tr>
      <tr>
        <td>상품명</td>
        <td><input type="text" class="form-control form-control-sm" name="p_name"/></td>
      </tr>
      <tr>
        <td>제조회사</td>
        <td><input type="text" class="form-control form-control-sm" name="p_company"/></td>
      </tr>
      <tr>
        <td>상품이미지</td>
        <td><input type="file" class="form-control form-control-sm" name="p_image"/></td>
      </tr>
      <tr>
        <td>상품수량</td>
        <td><input type="text" class="form-control form-control-sm" name="p_qty"/></td>
      </tr>
      <tr>
        <td>상품가격</td>
        <td><input type="text" class="form-control form-control-sm" name="price"/></td>
      </tr>
      <tr>
        <td>상품사양</td>
        <td>
          <select class="form-select form-select-sm" name="p_spec">
            <option value="none" selected>일반</option>
            <c:forEach var="p_spec" items="${pdSpec}">
              <option value="${p_spec.name()}">${p_spec.value}</option>
            </c:forEach>
          </select>
        </td>
      </tr>
      <tr>
        <td>상품소개</td>
        <td>
          <textarea class="form-control" name="p_content" rows="3"></textarea>
        </td>
      </tr>
      <tr>
        <td>상품포인트</td>
        <td><input type="text" class="form-control form-control-sm" name="p_point"/></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="submit" class="btn btn-sm btn-primary" value="상품등록"/>
          <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>
        </td>
      </tr>
      </tbody>
    </table>
  </form>
</div>
  <%@ include file="inc/admin_footer.jsp" %>

</c:if>
