<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/view_header.jsp" %>
<style>
  a{
    text-decoration: none;
    color: darkgray;
  }
  input[type='date']::before{
    content: attr(data-placeholder);
    width: 100%;
    color:#666;
  }
  input[type='date']:valid::before{
    display: none;
  }
  li{
    list-style: none;
  }

</style>
<div class='container mt-5 d-flex'>
  <aside class="col-sm-3">
    <h4 class="mb-4">마이페이지</h4>
    <ul>
      <li><a href="<c:url value='/view/myPage.do'/>">비밀번호 변경</a></li>
      <li><a href="<c:url value='/view/userInfo.do'/>">회원정보 수정</a></li>
    </ul>
  </aside>
    <div class="container col-sm-9">
    <form action='<c:url value ="/view/userModify.do"/>' method='post'>
      <input type='hidden' name='no' value='${mDto.no}'>
      <input type='hidden' name='id' value='${mDto.id}'>

      <table class='table table-borderless'>
        <thead>
        <th colspan='2'><h3 class='text-center'>${mDto.name}님 회원정보 수정</h3>
        </thead>
        <tr>
          <td>번호</td>
          <td><input class='form-control' type='text' name='no' value='${mDto.no}' disabled /></td>
        </tr>
        <tr>
          <td>아이디</td>
          <td><input class='form-control' type='text' name='id' value='${mDto.id}' disabled /></td>
        </tr>
        <tr>
          <td>이름</td>
          <td><input class='form-control' type='text' name='name' value='${mDto.name}' /></td>
        </tr>
        <tr>
          <td>나이</td>
          <td><input class='form-control' type='text' name='age' value='${mDto.age}' readonly/></td>
        </tr>
        <tr>
          <td>생년월일</td>
          <td><input class='form-control' type='date' name='birthday' value='${mDto.birthday}'/></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input class='form-control' type='text' name='email' value='${mDto.email}'/></td>
        </tr>
        <tr>
          <td>전화번호</td>
          <td><input class='form-control' type='text' name='tel' value='${mDto.tel}'/></td>
        </tr>
        <tr>
          <td>주소</td>
        </tr>
        <tr>
          <td><input class='form-control' type='text' id="sample4_postcode" name="zipcode" value='${mDto.zipcode}'/></td>
          <td><a class="btn btn-sm btn-outline-secondary p-2" onclick="sample4_execDaumPostcode()">우편번호 찾기</a><br></td>
        </tr>
        <tr>
          <td><input class='form-control col-md-12' type='text' name="road_addr" id="sample4_roadAddress" value='${mDto.road_addr}'/></td>
          <td><input class='form-control' type='text' name="detail_addr" id="sample4_detailAddress" value='${mDto.detail_addr}'/></td>
        </tr>
        <tr>
          <td><input class='form-control' type='text' name="jibun_addr" id="sample4_jibunAddress" value='${mDto.jibun_addr}'/></td>
        </tr>
        <tr>
          <td colspan='2' class='text-center p-4'>
            <input type='submit' value='수정하기' class='btn btn-dark'>
            <input type='reset' value='취소' class='btn btn-light border border-secondary'>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/zipcode.js"></script>

<%@ include file="inc/view_footer.jsp" %>
