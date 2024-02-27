
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="inc/view_header.jsp" %>

<h3 class="m-5 text-center" style="font-size:40px;">
    <c:forEach var="cat" items="${cat_list}">
        ${cat.code==p_category_fk? cat.cat_name: ''}
    </c:forEach>ITEMS
</h3>
<section class="w-100 ps-5 d-flex justify-content-center">
<c:if test="${catProdList.size()==0}">
    <p>상품이 존재하지 않습니다.</p>
</c:if>

    <div class="col-sm-7">
        <c:if test="${catProdList.size()!=0}">
            <div class="d-flex mt-3 w-100">
                <c:set var = "cnt" value = "0"/>
                <c:forEach var = "dto" items="${catProdList}">
                    <%@ include file="card.jsp" %>
                </c:forEach>
            </div>
        </c:if>
    </div>
</section>

<%@ include file="inc/view_footer.jsp" %>
