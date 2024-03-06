<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.adminloginDto.id==null}">
  <%@ include file="admin_login.jsp" %>
</c:if>
<c:if test="${sessionScope.adminloginDto.id!=null}">
<%@ include file="inc/admin_header.jsp" %>
<div class="container w-50 mt-5 p-5">

    <div class = "d-flex mb-2" >
        <h5 style="width:130px; margin-right:50px;">제목</h5><h6>${qDto.q_subject}</h6>
    </div>
    <div class = "d-flex mb-2">
        <h5 style="width:130px; margin-right:50px;">작성자</h5><h6>${qDto.q_writer}</h6>
    </div>
    <div class = "d-flex mb-2">
        <h5 style="width:130px; margin-right:50px;">문의사항종류</h5>
        <h6><td><c:forEach var="opspec" items="${opspec}"><c:if test="${opspec.name()==qDto.ques_option}">${opspec.value}</c:if></c:forEach></td></h6>
    </div>
    <div class="mb-4 border border-secondary rounded p-4">
        <h7>${qDto.q_contents}</h7>
    </div>
    <div class="d-flex mb-4 justify-content-center">
  
    <a href="<c:url value='javascript:history.bakck()'/>"
                           class = "btn btn-sm btn-dark m-3">리스트</a>
    <a href="<c:url value=''/>"
                           class = "btn btn-sm btn-success m-3">답변 등록</a>
    </div>
		<c:if test="${qDto.ques_state!='문의사항 확인중'}">
        <div class="mt-5 mb-3 d-flex justify-content-between">
            <h6><i class="fa fa-comments-o"></i> 답변</h6>
        </div>
        <ul class="p-0 replyArea" style="list-style:none">
            <li class="mb-2 p-0">
                <div class="form-control">
                    <div class="d-flex justify-content-between">
                        <h6>홍길동</h6><span>2022-12-12</span>
                    </div>
                    <p>댓글 테스트 ..........</p>
                </div>
            </li>
        </ul>
	</c:if>
        
</div>

<script src="../js/reply.js"></script>

<script>
    $(document).ready(function(){
        //게시글 번호
        let qidValue = '<c:out value="${qDto.qid}"/>';
        //답변 영역 객체
        let replyArea = $(".replyArea");

        function displayList(){
            let str = "";
            replyFunc.getList(qid:qidValue, function(data){
                let answer = data.answer;
                //답변이 있는 경우
                    str+='<div class="form-control">'
                        +'<div class="d-flex justify-content-between">'
                        +'<h6>'+answer.replyer+'</h6><span>'+replyFunc.showDateTime(answer.anw_reg_date)+'</span>'
                        +'</div>'
                        +'<p>'+answer.ans_contents+'</p>'
                        +'</div>'
                        +'</li>';
                }
                replyArea.html(str);
                showPgNavi(data);
            });
        }//displayList
        
    })
</script>
  <%@ include file="inc/admin_footer.jsp" %>
</c:if>