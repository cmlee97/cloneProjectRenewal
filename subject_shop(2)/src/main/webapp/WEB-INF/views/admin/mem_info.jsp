<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="inc/admin_header.jsp" %>
<style>

</style>
<div class='container w-50 shadow mt-5 p-5 rounded-3 border'>
    <h2>회원 정보</h2>
    <form action='<c:url value ="/admin/memberUpdate.do"/>' method='post'>
        <input type='hidden' name='no' value='${mDto.no}'>
        <input type='hidden' name='id' value='${mDto.id}'>
        <input type='hidden' name='viewPage' value='${paDto.viewPage}'>
        <input type='hidden' name='cntPerPage' value='${paDto.cntPerPage}'>
        <table class='table table-borderless'>
            <thead>
            <th colspan='2'><h3 class='text-center'>${mDto.name}님 회원정보 </h3>
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
                <td>비밀번호</td>
                <td><input class='form-control' type='text' name='pw' value='${mDto.pw}' /></td>
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
                <td><input class='form-control' type='date' name='birthday' value='${mDto.birthday}' min="1900-01-01"
                           max="2022-12-31" data-placeholder="생년월일" required/></td>
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
                    <input type='submit' value='수정하기' class='btn btn-primary'>
                    <input type='reset' value='취소' class='btn btn-warning'>
                    <a href='memberList.do?&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}' class='btn btn-info'>리스트</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/zipcode.js"></script>
<%@ include file="inc/admin_footer.jsp" %>
