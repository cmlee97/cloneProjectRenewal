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
    </div>
    <hr class="container mt-3">
    <div class="mt-5 mb-3 d-flex justify-content-between">
            <h6><i class="fa fa-comments-o"></i> 답변</h6>
    </div>
  <%--   <c:if test="${qrDto == null}">
		<form action="<c:url value='/admin/answerRegister.do'/>" method="post">
	</c:if>
    <c:if test="${qrDto != null}">
		<form action="<c:url value='/admin/answerModify.do'/>" method="post">
	</c:if> --%>
      <input type='hidden' id="qid" name='qid' value='${qDto.qid}'>
      <input type='hidden' id="q_writer" name='q_writer' value='${qDto.q_writer}'>
      <div class="mt-3 mb-3">
        <textarea class="w-100 p-2" id="ans_contents" name="ans_contents" placeholder="${qrDto.ans_contents!=null ? qrDto.ans_contents : '답변을 등록하세요'}"></textarea>
      </div>
      <c:if test="${qrDto != null}">
	      <div class="mt-3 mb-3">
	        <h6>${qrDto.anw_reg_date}</h6>
	      </div>
      </c:if>
      <c:if test="${qrDto.rno == null}">
	      <div class="text-center">
	        <input type="button" class="btn btn-primary btn-sm" id="answer_reg" onclick="register()" value="답변 등록"/>
	      </div>
      </c:if>
      <c:if test="${qrDto.rno != null}">
      	<div class="text-center">
	        <input type="button" class="btn btn-primary btn-sm" id="answer_reg" value="답변 수정"/>
	    </div>
      </c:if>
<!--     </form>   -->
        
	<%-- <c:if test="${qDto.ques_state != '문의사항 확인중'}">
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
	</c:if> --%>
        
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
            replyFunc.getList({qid:qidValue}, function(data){
                let answer = data.answer;
                //답변이 있는 경우
                for(let i=0; i<list.length; i++){
                    str+='<div class="form-control">'
                        +'<div class="d-flex justify-content-between">'
                        +'<h6>'+answer.replyer+'</h6><span>'+replyFunc.showDateTime(answer.anw_reg_date)+'</span>'
                        +'</div>'
                        +'<p id="answerContents'+i+'">'+answer.ans_contents+'</p>'
                       	+'<div onclick="answerModify('+answer.rno+','+qidValue+','+i+')" class="btn btn-primary btn-sm" value="수정"></div>'
                        +'<a href="/answerDelete.do?rno='+answer.rno+'&qid='+qidValue+'" class="btn btn-primary btn-sm" value="삭제"/>'
                        +'</div>'
                        +'</li>';
                }
                replyArea.html(str);
                showPgNavi(data);
            });
        }//displayList
       
    })

	function register(){
    	//let qidValue = '<c:out value="${qDto.qid}"/>';
    	let qid = document.getElementById('qid').value;
    	let q_writer = document.getElementById('q_writer').value;
    	let ans_contents = document.getElementById('ans_contents').value;
    	location.href="/shop2/admin/answerRegister.do?qid="+qid+"&q_writer="+q_writer+"&ans_contents="+ans_contents;
    }
</script>
  <%@ include file="inc/admin_footer.jsp" %>
</c:if>