<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="inc/view_header.jsp" %>
<div class="container w-75 mt-5">
    <h3>장바구니 리스트</h3>

    <table class="table">
        <thead>
        <tr>

            <th>상품이미지</th>
            <th>상품명</th>
            <th>수량</th>
            <th>판매가</th>
            <th>합계</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${cart_list==null||cart_list.size()==0}">
            <tr>
                <td colspan="6">장바구니가 비었습니다.</td>
            </tr>
        </c:if>
        <c:if test="${cart_list!=null||cart_list.size()!=0}">
            <c:set var = "cartTotPrice" value = "0"/>
            <c:set var = "cartTotPoint" value = "0"/>
            <c:forEach var="dto" items="${cart_list}">
                <tr>
                    <td><a href="<c:url value='/view/prodView.do?p_num=${dto.p_num}&p_spec=${dto.p_spec}'/>"><img src="<c:url value="/fileRepo/${dto.p_image}"/>" style="width:60px" /></a></td>
                    <td>${dto.p_name}</td>
                    <td>
                        <form action="<c:url value='/cart/cartModify.do'/>" method="post">
                            <input type = "hidden" name = "p_num" value="${dto.p_num}"/>
                            <input type = "text" class="mt-3" size = "3" name = "p_qty" value = "${dto.p_qty}"/>개
                            <input type = "submit" class = "btn btn-sm btn-secondary" style="margin-left:10px;" value ="수정"/>
                        </form>
                    </td>
                    <td>
                        <fmt:formatNumber value = "${dto.price}"/>원<br/><fmt:formatNumber value = "${dto.p_point}"/>포인트
                    </td>
                    <td>
                        <fmt:formatNumber value = "${dto.tot_price}"/>원<br/><fmt:formatNumber value = "${dto.tot_point}"/>포인트
                    </td>
                    <td>
                        <a href="<c:url value='/cart/cartDelete.do?p_num=${dto.p_num}'/>" class="btn btn-sm btn-danger mt-3">삭제</a>
                    </td>
                </tr>
                <c:set var = "cartTotPrice" value = "${cartTotPrice+dto.tot_price}"/>
                <c:set var = "cartTotPoint" value = "${cartTotPoint+dto.tot_point}"/>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
    <!-- 장바구니 총액 표시 -->
    <div class = "text-end">
        장바구니 총액 : <fmt:formatNumber value = "${cartTotPrice}"/> 원 <br/>
        총 포인트 : <fmt:formatNumber value = "${cartTotPoint}"/> 포인트
    </div>
    <div class = "text-center mb-3">
        <a href="<c:url value='/cart/checkout.do'/>" class = "btn btn-sm btn-dark p-3 mt-3">구매하기</a>
        <a href="${pageContext.request.contextPath}" class = "btn btn-sm btn-light border border-secondary p-3 mt-3">계속 쇼핑하기</a>
    </div>

</div>
<script>

</script>
<%@ include file="inc/view_footer.jsp" %>
