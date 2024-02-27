<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.adminloginDto.id==null}">
  <%@ include file="admin_login.jsp" %>
</c:if>
<c:if test="${sessionScope.adminloginDto.id!=null}">
<%@ include file="inc/admin_header.jsp" %>
<div class="container w-75 mt-5">
  <h3 class="mb-3">상품 리스트</h3>
  <table class="table">
    <thead>
    <tr>
      <th>번호</th>
      <th>카테고리 코드</th>
      <th>이미지</th>
      <th>상품명</th>
      <th>가격</th>
      <th>제조사</th>
      <th>수량</th>
      <th>수정/삭제</th>
    </tr>
    </thead>
    <tbody>

    <c:if test="${list==null||list.size()==0}">
      <tr>
        <td colspan="8">상품이 존재하지 않습니다</td>
      </tr>
    </c:if>
    <c:if test="${list!=null||list.size()!=0}">
      <c:forEach var="dto" items="${list}">
        <tr>
          <td>${dto.p_num}</td>
          <td>${dto.p_category_fk}</td>
          <td><img src="<c:url value="/fileRepo/${dto.p_image}"/>" style="width:60px" /></td>
          <td>${dto.p_name}</td>
          <td>${dto.price}</td>
          <td>${dto.p_company}</td>
          <td>${dto.p_qty}</td>
          <td>
            <a href="<c:url value='/admin/prodInfo.do?p_num=${dto.p_num}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>" class="btn btn-sm btn-info">수정</a>
            <a href="javascript:pdDel('${dto.p_num}', '${dto.p_image}','${paDto.viewPage}','${paDto.cntPerPage}')" class="btn btn-sm btn-danger">삭제</a>
          </td>
        </tr>
      </c:forEach>
    </c:if>
    </tbody>
  </table>
</div>
<!-- 페이지네이션 -->
<hr/>
<ul class="pagination justify-content-center">
  <li class="page-item ${paDto.prevPage<=0 ? 'disabled': ''}">
    <a class="page-link" href="prodList.do?viewPage=${paDto.prevPage}&cntPerPage=${paDto.cntPerPage}">이전</a>
  </li>
  <c:forEach var="i" begin="${paDto.blockStart}" end="${paDto.blockEnd}">
    <li class="page-item ${paDto.viewPage == i ? 'active':''}">
      <a class="page-link" href="prodList.do?viewPage=${i}&cntPerPage=${paDto.cntPerPage}">${i}</a>
    </li>
  </c:forEach>
  <li class="page-item ${paDto.blockEnd>=paDto.totalPage ? 'disabled': ''}">
    <a class="page-link" href="prodList.do?viewPage=${paDto.nextPage}&cntPerPage=${paDto.cntPerPage}">다음</a>
  </li>
</ul>
  <%@ include file="inc/admin_footer.jsp" %>
</div>
</c:if>
<script>
  function pdDel(p_num, p_image, viewPage, cntPerPage){
    let isDel = confirm("삭제 하시겠습니까?");
    console.log(p_image);
    if(isDel) location.href="<c:url value='/admin/prodDelete.do?p_num='/>"+p_num+"&p_image="
            +p_image+"&viewPage="+viewPage+"&cntPerPage="+cntPerPage;
  }
</script>

