<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="inc/view_header.jsp" %>
<section class="w-100 d-flex justify-content-center">
    <div class="col-sm-7 mt-5">
        <ul class="d-flex p-0" style="list-style:none;">
        <!-- 상품 이미지 -->
        <li class="me-5 col">
            <img src="<c:url value="/fileRepo/${pDto.p_image}"/>" width="600px"/>
        </li>
        <!-- 상품 상세내용 -->
        <li>
            <h3 class="mt-3 mb-3">롯데백화점 | ${pDto.p_company}</h3>
            <form name="prodForm" method="post">
                [${pDto.p_spec}] ${pDto.p_name}<br/>

                <hr/>
                상품수량 : <input type="text" name="p_qty" size="3" value="1"/>개<br/>
                <div class="text-end mt-3" style="font-weight: bold; font-size:30px;">
                    <fmt:formatNumber value="${pDto.price}"/>원<br/>
                </div>
                적립되는 포인트 > <fmt:formatNumber value="${pDto.p_point}"/> 포인트<br/>


                <a href="javascript:history.back();" class="btn btn-sm btn-light border border-secondary p-3 mt-3">계속 쇼핑하기</a>
                <c:if test="${sessionScope.loginDto != null}">
                    <a href="javascript:goCart(${pDto.p_num})" class="btn btn-sm btn-dark p-3 mt-3">장바구니 담기</a>
                </c:if>
                <c:if test = "${sessionScope.loginDto ==null}">
                    <a href="javascript:alert('로그인이 필요합니다')" class="btn btn-sm btn-dark p-3 mt-3">장바구니 담기</a>
                </c:if>

                <p class="mt-5 text-center" style="font-size: 20px;"><b>상세정보</b><br/>
                    ${pDto.p_content}
                </p>
            </form>
        </li>
    </ul>
    </div>
</section>
</div>
<script>
    function goCart(p_num){
        console.log(p_num);
        document.prodForm.action = "<c:url value = '/cart/cartAdd.do?p_num='/>"+p_num;
        document.prodForm.submit();
    }
</script>
<%@ include file="inc/view_footer.jsp" %>
