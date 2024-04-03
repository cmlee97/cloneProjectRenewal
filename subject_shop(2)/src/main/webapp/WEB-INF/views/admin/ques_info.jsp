<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  
    <a href="<c:url value='javascript:history.back()'/>"
                           class = "btn btn-sm btn-dark m-3">리스트</a>
    </div>
    <hr class="container mt-3">
    <div class="mt-5 mb-3 d-flex justify-content-between">
            <h6><i class="fa fa-comments-o"></i> 답변</h6>
    </div>

      <input type='hidden' id="qid" name='qid' value='${qDto.qid}'>
      <input type='hidden' id="q_writer" name='q_writer' value='${qDto.q_writer}'>
      <input type='hidden' id="q_writer" name='rno' value='${qrDto.rno}'>
      <div class="mt-3 mb-3">
        <textarea class="w-100 p-2" id="ans_contents" name="ans_contents">${qrDto.ans_contents!=null ? qrDto.ans_contents : '답변을 등록하세요'}</textarea>
      </div>
	      <div class="mt-3 mb-3">
	        <h6><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${qrDto.anw_reg_date}"/></h6>
	      </div>
      <c:if test="${qrDto.rno == 0}">
	      <div class="text-center">
	        <input type="button" class="btn btn-primary btn-sm" id="answer_reg" onclick="register()" value="답변 등록"/>
	      </div>
      </c:if>
      <c:if test="${qrDto.rno != 0}">
      	<div class="text-center">
	        <input type="button" class="btn btn-primary btn-sm" onclick="modify()" id="answer_modify" value="답변 수정"/>
	        <input type="button" class="btn btn-danger btn-sm" onclick="del()" id="answer_del" value="답변 삭제"/>
	    </div>
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
    	let qid = document.getElementById('qid').value;
    	let q_writer = document.getElementById('q_writer').value;
    	let ans_contents = document.getElementById('ans_contents').value;
    	location.href="/shop2/admin/answerRegister.do?qid="+qid+"&q_writer="+q_writer+"&ans_contents="+ans_contents;
    }
	function modify(){
    	let qid = document.getElementById('qid').value;
    	let rno = document.getElementById('rno').value;
    	let ans_contents = document.getElementById('ans_contents').value;
    	location.href="/shop2/admin/answerModify.do?qid="+qid+"&rno="+rno+"&ans_contents="+ans_contents;
    }
	function del(){
    	let qid = document.getElementById('qid').value;
    	let rno = document.getElementById('rno').value;
    	location.href="/shop2/admin/answerDelete.do?qid="+qid+"&rno="+rno;
    }
</script>
  <%@ include file="inc/admin_footer.jsp" %>
</c:if>