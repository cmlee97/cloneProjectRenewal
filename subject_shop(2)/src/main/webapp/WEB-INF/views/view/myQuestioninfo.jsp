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

    <div class = "d-flex mb-2" >
        <h5 style="width:100px; margin-right:50px;">제목</h5><h6>${qDto.q_subject}</h6>
    </div>
    <div class = "d-flex mb-2">
        <h5 style="width:100px; margin-right:50px;">작성자</h5><h6>${qDto.q_writer}</h6>
    </div>
    <div class="mb-4 border border-secondary rounded p-4">
        <h7>${qDto.q_contents}</h7>
    </div>
    <div class="d-flex mb-4 justify-content-center">
  
    <a href="<c:url value='/view/questionList.do?viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>"
                           class = "btn btn-sm btn-dark m-3">리스트</a>
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
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/zipcode.js"></script>

<%@ include file="inc/view_footer.jsp" %>
