<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/admin_header.jsp" %>
<div class="container w-50 mt-5">
    <h3>상품 수정</h3>
    <form action="<c:url value='/admin/prodUpdate.do'/>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="viewPage" value="${paDto.viewPage}"/>
        <input type="hidden" name="cntPerPage" value="${paDto.cntPerPage}"/>
        <table class="table table-borderless">
            <tbody>
            <tr>
                <td>상품번호</td>
                <td><input  class="form-control form-control-sm" type="text" name="p_num" value="${pDto.p_num}" readonly/></td>
            </tr>
            <tr>
                <td>카테고리</td>
                <td>
                    <select class="form-select form-select-sm" name="p_category_fk">
                        <c:if test="${list !=null || list.size != 0}">
                            <c:forEach var="cDto" items="${list}">
                                <option value="${cDto.code}"
                                    ${(cDto.code==pDto.p_category_fk) ? 'selected' : '' }>${cDto.cat_name}[${cDto.code}]</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </td>
            </tr>
            <tr>
                <td>상품명</td>
                <td><input type="text" class="form-control form-control-sm" name="p_name" value = "${pDto.p_name}"/></td>
            </tr>
            <tr>
                <td>제조회사</td>
                <td><input type="text" class="form-control form-control-sm" name="p_company" value="${pDto.p_company}"/></td>
            </tr>
            <tr>
                <td>상품이미지</td>
                <td>
                    <img src="<c:url value="/fileRepo/${pDto.p_image}"/>" style="width:100px" />
                    <input type="file" class="form-control form-control-sm" name="p_image"/>
                    <!-- 이미지를 수정하지 않는 경우에는 지금 현재의 이미지를 넘겨야 함 -->
                    <input type="hidden" class="form-control form-control-sm" name="p_image" value = "${pDto.p_image}"/>
                </td>
            </tr>
            <tr>
                <td>상품수량</td>
                <td><input type="text" class="form-control form-control-sm"
                           name="p_qty" value="${pDto.p_qty}"/></td>
            </tr>
            <tr>
                <td>상품가격</td>
                <td><input type="text" class="form-control form-control-sm"
                           name="price" value="${pDto.price}"/></td>
            </tr>
            <tr>
                <td>상품사양</td>
                <td>
                    <select class="form-select form-select-sm" name="p_spec">
                        <c:if test="${(pDto.p_spec==none)}">
                            <option value="none" selected>일반</option>
                        </c:if>
                        <c:if test="${(pDto.p_spec!=none)}">
                        <option value="none">일반</option>
                    </c:if>
                        <c:forEach var="p_spec" items="${pdSpec}">
                            <option value="${p_spec.name}"
                                ${(p_spec.name==pDto.p_spec) ? 'selected' : '' }>${p_spec.value}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>상품소개</td>
                <td>
                    <textarea class="form-control" name="p_content" rows="3">${pDto.p_content}</textarea>
                </td>
            </tr>
            <tr>
                <td>상품포인트</td>
                <td><input type="text" class="form-control form-control-sm"
                           name="p_point" value="${pDto.p_point}"/></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <input type="submit" class="btn btn-sm btn-primary" value="상품수정"/>
                    <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<%@ include file="inc/admin_footer.jsp" %>