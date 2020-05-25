<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html>
<head>
<title>Daesin Company</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700" />
<link rel="stylesheet" href="${root }fonts/icomoon/style.css" />

<link rel="stylesheet" href="${root }css/bootstrap.min.css" />
<link rel="stylesheet" href="${root }css/magnific-popup.css" />
<link rel="stylesheet" href="${root }css/jquery-ui.css" />
<link rel="stylesheet" href="${root }css/owl.carousel.min.css" />
<link rel="stylesheet" href="${root }css/owl.theme.default.min.css" />

<link rel="stylesheet" href="${root }css/aos.css" />

<link rel="stylesheet" href="${root }css/style.css" />


</head>
<script>
	function checkMemberIdExist() {
		var mId = $("#mId").val()

		if (mId.length == 0) {
			alert("아이디를 입력해주세요");
			return;
		}

		$.ajax({
			url : "${root}member/checkMemberIdExist/" + mId,
			type : "get",
			dataType : "text",
			success : function(result) {
				if (result.trim() == "true") {
					alert("사용할 수 있는 아이디입니다");
					$("#memberIdExist").val("true")
				} else {
					alert("사용할 수 없는 아이디입니다");
					$("#memberIdExist").val("false")
				}
			}
		})
	}
	function resetMemberIdExist() {
		$("#memberIdExist").val("false")
	}

	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	 */
			function emailBtn() {
				
				/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
				$.ajax({
					
					type : "get",
					url : "<c:url value='/email/createEmailCheck.do'/>",
					data : "userEmail=" + $("#mEmail").val() + "&random="
							+ $("#random").val(),
					//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
					/* encodeURIComponent
					예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
					중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
					그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
					success : function(data) {
						alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
					},
					error : function(data) {
						alert("에러가 발생했습니다.");
						return false;
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
					data : "authCode=" + $('#certification').val() + "&random="
							+ $("#random").val(),
					success : function(data) {
						if (data == "complete") {
							alert("인증이 완료되었습니다.");
						} else if (data == "false") {
							alert("인증번호를 잘못 입력하셨습니다.")
						}
					},
					error : function(data) {
						alert("에러가 발생했습니다.");
					}
				});
			};
</script>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />


<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">회원가입</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section" data-aos="fade">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<h2 class="h1 mb-3 text-black">회원가입</h2>
			</div>
			<div class="card shadow col-md-5">
				<div class="card-body">
					<form:form action="${root }member/join_pro" method="post"
						modelAttribute="joinMemberBean">
						<form:hidden path="memberIdExist" />
						<div class="form-group">
							<form:label path="mId">아이디</form:label>
							<div class="input-group">
								<form:input path="mId" class="form-control"
									onkeypress="resetMemberIdExist()" />
								<div class="input-group-append">
									<button type="button" class="btn btn-primary"
										onclick="checkMemberIdExist()">중복확인</button>
								</div>
							</div>
							<form:errors path="mId" style="color:red" />
						</div>
						<div class="form-group">
							<form:label path="mEmail">이메일 주소</form:label>
							<div class="input-group">
								<form:input path="mEmail" class="form-control" />
								<div class="input-group-append">
									<button type="button" class="btn btn-primary" onclick="emailBtn();">인증하기</button>
								</div>
							</div>
						</div>
						<div class="form-group">
						<form:label path="certification">인증번호</form:label>
							<div class="input-group">
								<form:input path="certification" class="form-control" />
								<div class="input-group-append">
									<button type="button" class="btn btn-primary" onclick="emailAuthBtn();">인증확인</button>
								</div>
							</div>
						</div>

						<%-- <form:hidden path="random" value="${random }" /> --%>
						<input type="hidden" path="random" id="random" value="${random }" />


						<div class="form-group">
							<form:label path="mPw">비밀번호</form:label>
							<form:password path="mPw" class="form-control" />
							<form:errors path="mPw" style="color:red" />
						</div>
						<div class="form-group">
							<form:label path="mPw2">비밀번호 확인</form:label>
							<form:password path="mPw2" class="form-control" />
							<form:errors path="mPw2" style="color:red" />
						</div>
						<div class="form-group">
							<div class="text-center">
								<form:button class="btn btn-primary">회원가입</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

<script src="${root }js/jquery-3.3.1.min.js"></script>
<script src="${root }js/jquery-ui.js"></script>
<script src="${root }js/popper.min.js"></script>
<script src="${root }js/bootstrap.min.js"></script>
<script src="${root }js/owl.carousel.min.js"></script>
<script src="${root }js/jquery.magnific-popup.min.js"></script>
<script src="${root }js/aos.js"></script>
<script src="${root }js/main.js"></script>
</body>
</html>









