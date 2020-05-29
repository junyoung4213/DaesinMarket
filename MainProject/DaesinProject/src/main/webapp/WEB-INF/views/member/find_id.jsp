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
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	 */
	function emailBtn() {

		/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
		$.ajax({

			type : "get",
			url : "<c:url value='/email/createEmailCheck.do'/>",
			data : "userEmail=" + $("#m_email").val(),
			complete : function(data) {
				alert("입력하신 메일로 인증번호가 발송되었습니다.");
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
					alert("인증이 완료되었습니다.");

					$('#email_Btn').attr('disabled', true)
					$('#email_AuthBtn').attr('disabled', true)
					$('#m_email').attr('readonly', true)
					$('#certification').attr('readonly', true)
					returnId();
				} else if (data == "false") {
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},
			error : function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	};
	
	
	function returnId() {
		var m_email = $("#m_email").val()

		$.ajax({
			url : "${root}member/returnId/" + m_email,
			type : "get",
			dataType : "text",
			success : function(data) {
				$('#resultId').css("display", "");
				$('#m_id').attr("placeholder",data)
			}
		})
	}
</script>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />


<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">아이디 찾기</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section" data-aos="fade">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<h2 class="h1 mb-3 text-black">아이디 찾기</h2>
			</div>
			<div class="card shadow col-md-5">
				<div class="card-body">
					<form:form action="#" method="post" modelAttribute="joinMemberBean">
						<div class="form-group">
							<form:label path="m_email">이메일 주소</form:label>
							<div class="input-group">
								<form:input path="m_email" class="form-control" />
								<div class="input-group-append">
								<form:button type="button" class="btn btn-primary" onclick="emailBtn();">인증하기</form:button>
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="certification">인증번호</form:label>
							<div class="input-group">
								<form:input path="certification" class="form-control" />
								<div class="input-group-append">
									<button type="button" class="btn btn-primary"
										onclick="emailAuthBtn();" id="email_AuthBtn">인증확인</button>
								</div>
							</div>
						</div>

						<div id="resultId" class="text-center form-group"
							style="display: none">
							<form:label path="m_id">찾은 아이디</form:label>
							<div class="input-group">
								<form:input path="m_id" type="text" readonly="true"
									class="form-control" style="text-align:center" />
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








