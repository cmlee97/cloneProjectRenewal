<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/cs_header.jsp" %>
<style>
    a{
        color: black;
    }
</style>
<div class="container mt-5">

    <h2 class="mb-3 text-center">공지 사항</h2>
    <table class="table mt-4">
        <thead class="table-light text-center">
        <tr>
            <th>제목</th>
            <th>등록일</th>
            <th></th>
        </tr>
        </thead>

        <tbody class="text-center">
        <c:forEach var="dto" items="${list}">
            <tr>
                <td>${dto.subject}</td>
                <td>${dto.reg_date}</td>
                <td onclick="showContent(${dto.bid})"><i class="fa fa-chevron-down" style="color: #000000; cursor:pointer"></i></td>
            </tr>
            <tr class="p-5" id="contents${dto.bid}" style="display:none; text-align: left;">
                <td colspan="3" style="font-size:13px; padding-left:300px; padding-right:300px;">${dto.contents}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pagination justify-content-center my-5">
        <li class="page-item ${paDto.prevPage <=0 ? 'disabled':''}">
            <a class="page-link" href="noticeList.do?viewPage=${paDto.prevPage}&cntPerPage=${paDto.cntPerPage}">
                <i class="fa fa-chevron-left" style="color: #000000;"></i>
            </a>
        </li>

        <c:forEach var="i" begin="${paDto.blockStart}" end="${paDto.blockEnd}">
            <li class="page-item ${paDto.viewPage == i ? 'active':''}">
                <a class="page-link" href="noticeList.do?viewPage=${i}&cntPerPage=${paDto.cntPerPage}">${i}</a>
            </li>
        </c:forEach>

        <li class="page-item ${paDto.blockEnd >=paDto.totalPage ? 'disabled':''}">
            <a class="page-link" href="noticeList.do?viewPage=${paDto.nextPage}&cntPerPage=${paDto.cntPerPage}">
                <i class="fa fa-chevron-right" style="color: #000000;"></i>
            </a>
        </li>
    </ul>
</div>
    <script>
        function showContent(bid){
            $('#contents'+bid).toggle();
        }

    </script>
<%@ include file="inc/cs_footer.jsp" %>
