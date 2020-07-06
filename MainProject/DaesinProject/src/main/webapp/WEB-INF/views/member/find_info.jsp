<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DaesinMarket:아이디, 비밀번호 찾기</title>
<link rel="stylesheet" href="${root }css/bootstrap.min.css" />
<link rel="stylesheet" href="${root }css/login.css" />
</head>
<body>
<div class="bgImage"></div>
<svg class="blobCont">
		<image xlink:href="https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?ixlib=rb-0.3.5&s=e20bc3d490c974d9ea190e05c47962f5&auto=format&fit=crop&w=634&q=80" mask="url(#mask)" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" />
      <defs>
      <filter id="gooey" height="130%">
				<feGaussianBlur in="SourceGraphic" stdDeviation="15" result="blur" />
				<feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
    	</filter>
    </defs>
			<mask id="mask" x="0" y="0">
				<g style="filter: url(#gooey)">
          <circle class="blob" cx="10%" cy="10%" r="80" fill="white" stroke="white"/>
					<circle class="blob" cx="50%" cy="10%" r="40" fill="white" stroke="white"/>
					<circle class="blob" cx="17%" cy="15%" r="70" fill="white" stroke="white"/>
					<circle class="blob" cx="90%" cy="20%" r="120" fill="white" stroke="white"/>
					<circle class="blob" cx="30%" cy="25%" r="30" fill="white" stroke="white"/>
          <circle class="blob" cx="50%" cy="60%" r="80" fill="white" stroke="white"/>
					<circle class="blob" cx="70%" cy="90%" r="10" fill="white" stroke="white"/>
					<circle class="blob" cx="90%" cy="60%" r="90" fill="white" stroke="white"/>
					<circle class="blob" cx="30%" cy="90%" r="80" fill="white" stroke="white"/>
          <circle class="blob" cx="10%" cy="10%" r="80" fill="white" stroke="white"/>
					<circle class="blob" cx="50%" cy="10%" r="20" fill="white" stroke="white"/>
					<circle class="blob" cx="17%" cy="15%" r="70" fill="white" stroke="white"/>
					<circle class="blob" cx="40%" cy="20%" r="120" fill="white" stroke="white"/>
					<circle class="blob" cx="30%" cy="25%" r="30" fill="white" stroke="white"/>
          <circle class="blob" cx="80%" cy="60%" r="80" fill="white" stroke="white"/>
					<circle class="blob" cx="17%" cy="10%" r="100" fill="white" stroke="white"/>
					<circle class="blob" cx="40%" cy="60%" r="90" fill="white" stroke="white"/>
					<circle class="blob" cx="10%" cy="50%" r="80" fill="white" stroke="white"/>
				</g>
			</mask>
	</svg>

<div class="form__wrapper d-flex align-items-center min-vh-100">
<c:if test="${select == 'Id' }">
	<div class = "form">
</c:if>
<c:if test="${select == 'Pw' }">
	<div class = "form slide">
</c:if>
			<div class="form__options">
				<div class="form__options__login">
					<div class="options__body">
						<h4 class="mb-4">아이디를 잊으셨나요?</h4>
						<a href="#" class="btn btn-light toggle-slide">아이디 찾기</a>
					</div>
				</div>
				<div class="form__options__signup">
					<h4 class="mb-4">비밀번호를 잊으셨나요?</h4>
					<a href="#" class="btn btn-light toggle-slide">비밀번호 찾기</a> 
				</div>
			</div>
			<div class="form__background"></div>
			<div class="form__body">
				<form:form action="#" class="login col-md-5 mt-0"
					method="post" modelAttribute="findIdBean">
					<h2 class="text-center mb-4 mt-3">아이디 찾기</h2>
					<div class="form-group col-md-12 text-center">
							<form:label path="mEmail">이메일 주소</form:label>
							<div class="input-group">
								<form:input path="mEmail" class="form-control" style="text-align:center" placeholder="가입이메일주소"/>
								<div class="input-group-append">
									<form:button type="button" class="btn"
										onclick="emailBtn();" style="border-radius:0px 5px 5px 0px; padding:10px 20px" id="emailReg">인증하기</form:button>
								</div>
							</div>
						</div>
						<div class="form-group col-md-12 text-center">
							<form:label path="certification" >인증번호</form:label>
							<div class="input-group">
								<form:input path="certification" class="form-control" style="text-align:center" />
								<div class="input-group-append">
									<button type="button" class="btn"
										onclick="emailAuthBtn();" id="email_AuthBtn" style="border-radius:0px 5px 5px 0px; padding:10px 20px">인증확인</button>
								</div>
							</div>
						</div>

						<div id="resultId" class="text-center form-group col-md-12"
							style="display: none">
							<form:label path="mId">고객님의 아이디입니다</form:label>
							<div class="input-group">
								<form:input path="mId" type="text" readonly="true"
									class="form-control" style="text-align:center" />
							</div>
						</div>
				</form:form>
				<form:form class="sign-up col-md-5 mt-3 text-center" action="#" id="findPw"
					method="post" modelAttribute="findPwBean">
					<h2 class="text-center mb-4">비밀번호 찾기</h2>
					<div class="form-group col-md-12" >
							<form:label path="mId">아이디</form:label>
							<div class="input-group col-md-10 ml-4">
								<form:input path="mId" class="form-control" style="text-align:center"/>
							</div>
						</div>
						<div class="form-group col-md-12">
							<form:label path="mEmail">이메일 주소</form:label>
							<div class="input-group col-md-10 ml-4">
								<form:input path="mEmail" class="form-control" style="text-align:center" />
							</div>
						</div>

						<div class="form-group p-3">
							<div class="text-center">
								<form:button type="button" class="btn btn-lg"
									onclick="findPwBtn();" style="padding:10px 20px">비밀번호 찾기</form:button>
							</div>
						</div>
				</form:form>
			</div>

		</div>
	</div>
	<script src="${root }js/jquery-3.3.1.min.js"></script>
	<script src="${root }js/jquery-ui.js"></script>
	<script src="${root }js/popper.min.js"></script>
	<script src="${root }js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	 */
	function emailBtn() {

		/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
		$.ajax({

			type : "get",
			url : "<c:url value='/email/createEmailCheck.do'/>",
			data : "userEmail=" + $("#mEmail").val(),
			complete : function(data) {
				swal("인증메일 발송 성공", "입력하신 메일로 인증번호가 발송되었습니다", "success");
				$('#emailReg').html("재전송")
			}
		});
	};
	/*
	이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	 */

	function emailAuthBtn() {
		$.ajax({
			type : "get",
			url : "<c:url value='/email/emailAuth.do'/>",
			data : "authCode=" + $('#certification').val(),
			success : function(data) {
				if (data == "complete") {
					swal("인증 완료", "인증이 완료되었습니다", "success");

					$('#email_Btn').attr('disabled', true)
					$('#email_AuthBtn').attr('disabled', true)
					$('#mEmail').attr('readonly', true)
					$('#certification').attr('readonly', true)
					returnId();
				} else if (data == "false") {
					swal("인증 실패", "인증번호를 잘못 입력하셨습니다", "error");
				}
			},
			error : function(data) {
				swal("에러 발생", "에러가 발생했습니다! 다시 시도해주세요", "error");
			}
		});
	};

	function returnId() {
		var mEmail = $("#mEmail").val()

		$.ajax({
			url : "${root}member/returnId/" + mEmail,
			type : "get",
			dataType : "text",
			success : function(data) {
				$('#resultId').css("display", "");
				$('#mId').attr("placeholder", data)
			}
		})
	}
	
	document.querySelectorAll('.toggle-slide').forEach(e => e.addEventListener('click', toggle));

	/* document.querySelectorAll('form').forEach(f => f.addEventListener('submit', (e) => e.preventDefault()) ) */

	function toggle(e) {
	  e.preventDefault();
	  document.querySelector('.form').classList.toggle('slide');
	}
	
	function findPwBtn() {

		var formData = $('#findPw').serialize();

		$.ajax({

			type : "post",
			url : "<c:url value='/email/findPassword.do'/>",
			data : formData,
			success : function(data) {
				if (data == "complete") {
					swal("성공", "메일주소로 변경된 비밀번호가 전송되었습니다", "success").then(function(){
						location.href="${root}member/login"
					});
				} else if (data == "false") {
					swal("실패", "아이디와 이메일주소를 확인해주세요", "error");
				}
			},
			error : function(data) {
				swal("에러 발생", "에러가 발생했습니다! 다시 시도해주세요", "error");
			}
		});
	};

</script>
</body>
</html>









