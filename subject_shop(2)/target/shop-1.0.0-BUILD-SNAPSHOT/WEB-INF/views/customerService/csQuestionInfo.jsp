<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="inc/cs_header.jsp" %>
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
    <a href="<c:url value='/view/quesUpdate.do?qid=${qDto.qid}&viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>" class="btn btn-sm btn-light border border-secondary m-3">수정</a>
    <a href="<c:url value='/view/questionList.do?viewPage=${paDto.viewPage}&cntPerPage=${paDto.cntPerPage}'/>"
                           class = "btn btn-sm btn-dark m-3">리스트</a>
    </div>


        <!--------------------------------- 댓글 UI ------------------------------------>
        <!-- 댓글 버튼 -->
        <div class="mt-5 mb-3 d-flex justify-content-between">
            <h6><i class="fa fa-comments-o"></i> 답변</h6>
            <button class="btn btn-sm btn-outline-secondary" id="btn-addReply"
                    data-bs-target="#replyModal" data-bs-toggle="modal"> 답변등록</button>
        </div>

        <!-- 댓글 리스트 영역 -->
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

        <!-- pagination Area -->
        <ul class="pagination justify-content-center my-5">
            <li class="page-item">
                <a class="page-link">이전</a>
            </li>

            <li class="page-item">
                <a class="page-link">1</a>
            </li>

            <li class="page-item">
                <a class="page-link">다음</a>
            </li>
        </ul>


        <!-- The Modal -->
        <div class="modal fade" id="replyModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header border-0">
                        <h5>답변 등록</h5>
                    </div>

                    <!-- Modal body -->
                    <form>
                        <div class="modal-body p-4">
                            <div class="mb-3">
                                <label for="reply_contents">내용</label>
                                <textarea class="form-control" id="reply_contents"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="replyer">작성자</label>
                                <input type="text" class="form-control" id="replyer" name="replyer"/>
                            </div>
                            <div class="mb-3">
                                <label for="reply_date">등록일</label>
                                <input type="text" class="form-control" id="reply_date" name="reply_date"/>
                            </div>
                        </div>


                        <!-- Modal footer -->
                        <div class="modal-footer border-0">
                            <button type="button" id="btn-modal-modify" class="btn btn-sm btn-success">수정</button>
                            <button type="button" id="btn-modal-remove" class="btn btn-sm btn-danger">삭제</button>
                            <button type="button" id="btn-modal-register" class="btn btn-sm btn-primary">등록</button>
                            <button type="button" id="btn-modal-close" class="btn btn-sm btn-secondary">닫기</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
</div>

<script src="../js/reply.js"></script>

<script>
    $(document).ready(function(){
        //게시글 번호
        let qidValue = '<c:out value="${qDto.qid}"/>';
        //댓글 영역 객체
        let replyArea = $(".replyArea");
        let viewPage = 1;
        displayList(viewPage);

        function displayList(viewPage){
            let str = "";
            replyFunc.getList({qid:qidValue, viewPage: viewPage || 1 }, function(data){
                let list = data.list;
                //댓글이 있는 경우
                for(let i=0; i<list.length; i++){
                    str+='<li class="mb-2 p-0" data-rno="'+list[i].rno+'" style="cursor: pointer;">'
                        +'<div class="form-control">'
                        +'<div class="d-flex justify-content-between">'
                        +'<h6>'+list[i].replyer+'</h6><span>'+replyFunc.showDateTime(list[i].r_date)+'</span>'
                        +'</div>'
                        +'<p>'+list[i].r_contents+'</p>'
                        +'</div>'
                        +'</li>';
                }
                replyArea.html(str);
                showPgNavi(data);
            });
        }//displayList
        //페이지네이션
        let pageArea = $(".pagination");

        function showPgNavi(data){
            let prevPage = data.prevPage;
            let nextPage = data.nextPage;
            let blockStart = data.blockStart;
            let blockEnd = data.blockEnd;

            let totalPage = data.totalPage;
            let viewPage = data.viewPage;

            let str = "";

            if(prevPage){
                str +='<li class="page-item"> '
                    + '<a class="page-link" href="'+prevPage+'>이전</a>'
                    + '</li>';
            }
            for(let i = blockStart; i<=blockEnd; i++){
                let active = viewPage==i?"active": "";
                str+='<li class="page-item '+active+'">'
                    +'<a class="page-link" href="'+i+'">'+i+'</a>'
                    +'</li>';
            }

            if(blockEnd<totalPage){
                str+= '<li class="page-item">'
                    + '<a class="page-link" href="'+nextPage+'>다음</a>'
                    +'</li>';
            }
            pageArea.html(str);

        }//showPgNavi

        pageArea.on("click", "li a", function(e){
            e.preventDefault();

            let targetPage = $(this).attr("href");
            viewPage = targetPage;
            displayList(viewPage);
        })
        //Modal
        let modal = $(".modal");

        let taReplyContents = $("#reply_contents");
        let inputReplyer = $("#replyer");
        let inputReplyDate = $("#reply_date");

        let modifyBtn = $("#btn-modal-modify");
        let removeBtn = $("#btn-modal-remove");
        let registerBtn = $("#btn-modal-register");

        $("#btn-modal-close").on("click", ()=>{
            modal.modal("hide");
        });

        $("#btn-addReply").on("click", function(){
            taReplyContents.val("");
            inputReplyer.val("");
            inputReplyer.attr("readonly",false);
            inputReplyDate.closest("div").hide();
            modal.find("button[id != 'btn-modal-close']").hide();
            registerBtn.show();
        });
        //댓글 등록
        registerBtn.on("click", ()=>{
            if(taReplyContents.val()==null || taReplyContents.val().trim()==""){
                alert("댓글을 입력하세요");
                taReplyContents.focus();
                return;
            }
            if(inputReplyer.val()==null || inputReplyer.val().trim()==""){
                alert("작성자를 입력하세요");
                inputReplyer.focus();
                return;
            }
            let reply = {qid:qidValue, r_contents:taReplyContents.val(),
                replyer:inputReplyer.val()};
            replyFunc.register(reply, function(result){
                modal.modal("hide");
                displayList();
            })
        });//registerBtn 클릭시
        //댓글 상세보기
        $(".replyArea").on("click","li", function(){
            let rno = $(this).data("rno");
            inputReplyDate.closest("div").show();
            replyFunc.read(rno, function(reply){
                taReplyContents.val(reply.r_contents);
                inputReplyer.val(reply.replyer).attr("readonly",true);
                inputReplyDate.val(replyFunc.showDateTime(reply.r_date)).attr("readonly",true);
                modal.data("rno", reply.rno);
                modal.find("button[id!='btn-modal-close']").hide();
                modifyBtn.show();
                removeBtn.show();
                modal.modal("show");
            });
        });//상세보기
        modifyBtn.on("click", function(){
           let reply = {rno:modal.data("rno"), r_contents: taReplyContents.val()};
           replyFunc.update(reply, function(result){
              modal.modal("hide");
              displayList();
            })
        });//수정하기
        removeBtn.on("click", function(){
            let rno = modal.data("rno");
            replyFunc.remove(rno, function(result){
                modal.modal("hide");
                displayList();
            })
        });//삭제
    })
</script>
<%@ include file="inc/cs_footer.jsp" %>
