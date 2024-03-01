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
	<li><a href="<c:url value='/view/questionInfo.do?q_writer=${sessionScope.loginDto.id}'/>">문의사항 확인</a></li>
    </ul>
  </aside>
    <div class="container w-50 mt-5 p-5">

   <form action="<c:url value="/view/quesModify.do"/>" method="post" name="ques_input_form">
        <input type="hidden" name="cntPerPage" value="${paDto.cntPerPage}"/>
        <h4 class="mb-4 text-center">글쓰기</h4>
		<select class="form-select form-select-sm" id="ques_option" name="ques_option">
            <option value="${quesinfo.ques_option}" selected>${quesinfo.ques_option}</option>
            <c:forEach var="opspec" items="${opspec}">
              <option value="${opspec.name()}">${opspec.value}</option>
            </c:forEach>
          </select>
        <input class="form-control mt-2" type="text" id="q_subject" name="q_subject" placeholder="${quesinfo.q_subject}" autofocus>

        <textarea class="form-control mt-2" name="q_contents" id="q_contents" style="height:400px;" placeholder="${quesinfo.q_contents}"></textarea>

        <input class="form-control mt-2" type="text" id="q_writer" name="q_writer" value="${sessionScope.loginDto.id}" placeholder="${sessionScope.loginDto.id}">
		<input class="form-control mt-2" type="text" id="reg_date" name="reg_date" value="${quesinfo.reg_date}" placeholder="${quesinfo.reg_date}">
		<h6 class="mt-2 mb-2">공개여부</h6>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="ques_state" id="ques_state" value="open" checked>
		  <label class="form-check-label" for="inlineRadio1">공개</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="ques_state" id="ques_state" value="notopen">
		  <label class="form-check-label" for="inlineRadio2" >비공개</label>
		</div>

        <div class="text-center mt-3">
            <input class="btn btn-outline-success" onclick = "modifysubmit()"value ="수정"></input>
        </div>
    </form>
    <div class="d-flex mb-4 justify-content-center">
  
    <a href="javascript:history.back();" class = "btn btn-sm btn-dark m-3">목록으로 돌아가기</a>
    <c:if test="${qDto.ques_state!='문의사항 확인중'}">
    	<a href="<c:url value='/view/quesModify.do?viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>"
                           class = "btn btn-sm btn-success m-3">수정</a>
    </c:if>
    
     <a href="<c:url value='/view/questionRemove.do?qid=${qDto.qid}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>"
                           class = "btn btn-sm btn-danger m-3">삭제</a>
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
	function modifysubmit(){
		
	}

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
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/zipcode.js"></script>

<%@ include file="inc/view_footer.jsp" %>
