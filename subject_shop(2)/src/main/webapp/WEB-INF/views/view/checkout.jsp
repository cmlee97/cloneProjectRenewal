<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="inc/view_header.jsp" %>
<div class="container mt-5 ">


  <section class="w-75 ps-5">
    <h2 class="mb-5">주문 / 결제</h2>
    <table class="table">
      <thead>
      <tr>
        <th><input type="checkbox" id="checkAll" onclick="checkAll()"/>삭제</th>
        <th>상품사진</th>
        <th>상품명</th>
        <th>수량</th>
        <th>판매가</th>
        <th>합계</th>
      </tr>
      </thead>

      <tbody>
      <c:set var="cartTotPrice" value="0"/>
      <c:set var="cartTotPoint" value="0"/>
      <c:forEach var="dto" items="${cart_list}">
        <tr>
            <%--                   <td><input type="checkbox" name="chk" value="${dto.pNum}"/></td>
             --%>                  <td><input type="checkbox" name="chk" value="${dto.c_num}"/></td>
          <td>
            <image src="<c:url value="/fileRepo/${dto.p_image}"/>" width="80px"/>
          </td>
          <td>${dto.p_name}</td>
          <td>${dto.p_qty}</td>
          <td><fmt:formatNumber value = "${dto.price}"/></td>

          <td><fmt:formatNumber value = "${dto.tot_price}"/>원<br/>
            <fmt:formatNumber value = "${dto.tot_point}"/>포인트
          </td>
        </tr>
        <c:set var="cartTotPrice" value="${cartTotPrice+dto.tot_price}"/>
        <c:set var="cartTotPoint" value="${cartTotPoint+dto.tot_point}"/>
      </c:forEach>

      <tr>
        <form action = "<c:url value='/cart/checkoutDelete.do'/>" name="cartForm" method="post">
          <input type = "hidden" name = "delProdNums"/>
          <td colspan="6">
            <a href="javascript:prodDel()" class="btn btn-sm btn-outline-secondary">선택삭제</a>
          </td>
        </form>
      </tr>
      </tbody>
    </table>

    <div class="text-center">
      장바구니 총액 : <fmt:formatNumber value = "${cartTotPrice}"/> 원<br/>
      총 포인트 : <fmt:formatNumber value = "${cartTotPoint}"/> 포인트
    </div>

    <table class="table">
      <thead>
      <tr>
        <th>구매자 정보</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>이름</td>
        <td>${mDto.name}</td>
      </tr>
      <tr>
        <td>이메일</td>
        <td>${mDto.email}</td>
      </tr>
      <tr>
        <td>전화번호</td>
        <td>${mDto.tel}</td>
      </tr>
      <tr>
        <td><b>받는사람 정보</b></td>
      </tr>
      <tr>
        <td>이름</td>
        <td>${mDto.name}</td>
      </tr>
      <tr>
        <td>배송지 주소</td>
        <td>(${mDto.zipcode})${mDto.road_addr} ${mDto.detail_addr}</td>
      </tr>
      <tr>
        <td>전화번호</td>
        <td>${mDto.tel}</td>
      </tr>
      <tr>
        <td><b>결제정보</b></td>
      </tr>
      <tr>
        <td>총 주문금액</td>
        <td><fmt:formatNumber value = "${cartTotPrice}"/>원</td>
      </tr>
      <tr>
        <td>포인트</td>
        <td>
          <input type="text" id="point" size="10"
                 oninput = "removeChar(event)"/>
          <input type="checkbox" id= "use" onclick = "usePoint(this, ${cartTotPoint}, ${cartTotPrice})" />
          <label for="use">
            전액사용 [<fmt:formatNumber value = "${cartTotPoint}"/>원]
          </label>
        </td>
      </tr>

      <tr>
        <td>결제금액</td>
        <td id="cartTotPrice">
          <fmt:formatNumber value = "${cartTotPrice}"/>원
        </td>
      </tr>

      <tr>
        <td>결제방법</td>
        <td>
          <label><input type="radio" name="payment" value="card" onclick="selPayment()" checked/>신용카드</label>
          <label><input type="radio" name="payment" value="rTransfer" onclick="selPayment()" />실시간 계좌이체</label>
          <label><input type="radio" name="payment" value="deposit" onclick="selPayment()"/>무통장 입금</label>
          <label><input type="radio" name="payment" value="hp" onclick="selPayment()"/>휴대폰</label>
        </td>
      </tr>
      </tbody>
    </table>

    <div id="card" >
      카드선택 : <select>
      <option value="" selected>카드사 선택</option>
      <option value="samsung">삼성카드</option>
      <option value="shinhancard">신한카드</option>
      <option value="lotte">롯데카드</option>
      <option value="bc">비씨카드</option>
      <option value="hyundai">현대카드</option>
    </select><br/><br/>
      할부기간 : <select <c:if test = "${cartTotPrice<50000}">disabled</c:if>>
      <option value="1" selected>일시불</option>
      <option value="2">2개월 무이자할부</option>
      <option value="3">3개월 무이자할부</option>
      <option value="4">4개월 무이자할부</option>
      <option value="5">5개월 무이자할부</option>
      <option value="6">6개월 무이자할부</option>
    </select><br/><br/>
    </div>
    <div id="rTransfer" style="display:none" >
      은행선택 : <select>
      <option value="" selected>은행선택</option>
      <option value="kakao">카카오뱅크</option>
      <option value="woori">우리은행</option>
      <option value="kookmin">국민은행</option>
      <option value="shinhan">신한은행</option>
    </select><br/><br/>
    </div>
    <div id="deposit" style="display:none">
      입금은행 : <select>
      <option value="" selected>은행선택</option>
      <option value="kakao">카카오뱅크</option>
      <option value="woori">우리은행</option>
      <option value="kookmin">국민은행</option>
      <option value="shinhan">신한은행</option>
    </select>
      <ul style="font-size:11px">
        무통장 입금시 유의사항
        <li>입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</li>
        <li>무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</li>
        <li>은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</li>
      </ul>
    </div>
    <div id="hp" style="display:none">
      통신사 : <select>
      <option value="" selected>선택</option>
      <option value="skt">SK</option>
      <option value="lg">LG U+</option>
      <option value="kt">KT</option>
    </select>
    </div>
    <div class="text-center">
      <button class="btn btn-sm btn-dark p-3 m-3">결제하기</button>
      <a href="${pageContext.request.contextPath}" class="btn btn-sm btn-light border border-secondary p-3 m-3">계속 쇼핑하기</a>
    </div>
  </section>
</div>

<script src = "<c:url value = "../js/checkout.js"/>" /></script>
<%@ include file="inc/view_footer.jsp" %>