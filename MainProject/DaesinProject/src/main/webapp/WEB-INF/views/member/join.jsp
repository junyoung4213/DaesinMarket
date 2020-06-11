<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

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
			data : "userEmail=" + $("#mEmail").val(),
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
					$('#mEmail').attr('readonly', true)
					$('#certification').attr('readonly', true)
				} else if (data == "false") {
					alert("인증번호를 잘못 입력하셨습니다.")

				}
			},
			error : function(data) {
				alert("에러가 발생했습니다.");
			}
		});
	};

	function checkPwd() {
		var f1 = document.forms[0];
		var pw1 = f1.mPw.value;
		var pw2 = f1.mPw2.value;
		if (pw1 != pw2) {
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
		} else {
			document.getElementById('checkPwd').style.color = "black";
			document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";

		}

	}
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
									<button type="button" class="btn btn-primary"
										onclick="emailBtn();" id="email_Btn">인증하기</button>
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

						<div class="form-group">
							<form:label path="mPw">비밀번호</form:label>
							<form:password path="mPw" class="form-control" />
							<form:errors path="mPw" style="color:red" />
						</div>
						<div class="form-group">
							<form:label path="mPw2">비밀번호 확인</form:label>
							<form:password path="mPw2" class="form-control"
								onkeyup="checkPwd()" />
							<form:errors path="mPw2" style="color:red" />
							<div id="checkPwd"></div>


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

</body>
</html>









