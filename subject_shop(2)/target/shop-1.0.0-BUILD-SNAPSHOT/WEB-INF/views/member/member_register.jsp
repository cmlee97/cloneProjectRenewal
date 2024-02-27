<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원가입페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    *{
      box-sizing: border-box;
    }
    a{
      text-decoration: none;
      color: lightgray;
    }
	input[type='date']::before{
		  content: attr(data-placeholder);
		  width: 100%;
		  color:#666;
	}
	input[type='date']:valid::before{
		display: none;
	}
  </style>
</head>
<body>
	<div class="container w-50 mt-5 p-5">
		<form action="<c:url value='/member/memberRegister.do'/>" method="post" onSubmit="return submitChk()">
			<h3 class="text-center mb-4">회원가입</h3>
			<%-- <div class = "row"> --%>

				<input class="form-control mb-3 border-0 bg-light" onkeyup = "idCheck()" type="text" id="id" name="id" placeholder="아이디"/>
					<p id="chkMsg" class="mb-3"></p>
				<input type="hidden" id="isIdChk" value="no"/>
			
			<input class="form-control mb-3 border-0 bg-light" type="text" name="pw" placeholder="비밀번호">
			<input class="form-control mb-3 border-0 bg-light" type="text" name="name" placeholder="이름">
			<input class="form-control mb-3 border-0 bg-light" type="date" name="birthday" id="birthday" min="1900-01-01"
				   max="2022-12-31" data-placeholder="생년월일" required>
			<div class="row">
				<div class="col-md-8 pe-0">
					<input class="form-control mb-3 border-0 bg-light" type="text" name="email" id="email" placeholder="이메일">
				</div>
				<div class="col-md-4">
					<span class="btn btn-outline-secondary w-100" onclick="emailCheck()">인증하기</span>
				</div>
			</div>
			<%--이메일 인증코드 확인--%>
			<div class="row" id="confirmEmail">
	
			</div>
	
			<input class="form-control mb-3 border-0 bg-light" type="text" name="tel" placeholder="전화번호">
			<!-- 주소 -->
			<div class="row mb-2">
				<div class="col-md-6">
					<input class="form-control mb-3 border-0 bg-light" type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호" readonly>
				</div>
				<div class="col-md-6 p-0 ps-2">
					<a class="btn btn-sm btn-outline-secondary p-2" onclick="sample4_execDaumPostcode()">우편번호 찾기</a><br>
				</div>
			</div>
	
			<input class="form-control mb-3 border-0 bg-light" type="text" name="road_addr" id="sample4_roadAddress" placeholder="도로명주소" readonly>
			<input class="form-control mb-3 border-0 bg-light" type="text" name="jibun_addr" id="sample4_jibunAddress" placeholder="지번주소" readonly>
			<!-- <span id="guide" style="color:#999;display:none"></span> -->
			<input class="form-control mb-3 border-0 bg-light" type="text" id="sample4_detailAddress" name="detail_addr" placeholder="상세주소">
			<div class="text-center mt-5">
				<input type="submit" class="btn btn-dark" value="가입">
				<input type="reset" class="btn btn-light border border-secondary" value="취소">
			</div>
		</form>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="chkModal">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">중복체크 확인</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
	
				<!-- Modal body -->
				<div class="modal-body text-center" id="chkMsg">
	
				</div>
	
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
				</div>
	
			</div>
		</div>
	</div>
<script>

	function submitChk(){
		let isIdChk = $("#isIdChk").val();
		console.log("isIdChk : " + isIdChk);
		if(isIdChk == "no"){
			alert("아이디 중복체크를 확인해주세요!!");
			$("#id").select();
			return false;
		}

		if(!isEmailChk){
			alert("이메일 인증 확인을 해주세요!!");
			$("#email").select();
			return false;
		}
	}

	function idCheck(){
		let uid = $("#id").val();
		if(uid.length<4){
			$("#chkMsg").html("아이디 길이는 4자리 이상 이어야합니다.");
			$("#chkMsg").css({"color":"red", "font-size":"13px"});
			return;
		}
		$.ajax({
			url:"<c:url value='/member/memberIdCheck.do'/>",
			type:"get",
			data : {"uid":uid},//서버에 전송할 데이터
			success: function(responseData){
				//responseData ="yes" or "no", yes:사용가능 no:사용불가
				if(responseData=="yes"){
					$("#chkMsg").html("사용가능한 아이디 입니다");
					$("#chkMsg").css({"color":"blue", "font-size":"13px"});
					$("#isIdChk").val("yes");
				}else{
					$("#chkMsg").html("사용 불가능한 아이디 입니다");
					$("#chkMsg").css({"color":"red", "font-size":"13px"});
				}
				// $("#chkModal").modal("show");
			},
			error : function(){
				$("#chkMsg").html("서버 에러입니다");
				$("#chkModal").modal("show");
			}
		});
	}
	let serverUUID = "";
	let isEmailChk=false;
	function emailCheck(){
		let uEmail =$("#email").val();

		$.ajax({
			url:"<c:url value='/member/memberEmailCheck.do'/>",
			type: "get",
			data: {"uEmail" : uEmail},
			success:function(uuid){
				if(uuid!="fail") {
					serverUUID=uuid;
					console.log("이메일인증코드 : " + uuid);
					$("#confirmEmail").html('<div class="col-md-8 pe-0">'
							+'<input class="form-control mb-2" type="text" name="confirmUUID" id="confirmUUID"/></div>'
							+'<div class="col-md-4">'
							+'<span class="btn btn-outline-secondary w-100" onclick="emailConfirm()">인증코드확인</span></div>')
				}else{
					alert("이메일을 다시 확인하세요");
					$("#email").select();
				}
			},
			error:function(){
				alert("이메일인증실패");
			}
		});
	}
	function emailConfirm(){
		let confirm = $("#confirmUUID").val();
		if(confirm==null || confirm=="") {
			alert("인증코드 확인하세요");
			$("#confirmUUID").select();
		}else if(serverUUID==confirm){
			alert("인증에 성공했습니다");
			isEmailChk="true";
		}else{
			alert("인증코드를 다시 확인하세요");
			$("#confirmUUID").select();
			return;
		}
	}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/zipcode.js"></script>

</body>
</html>