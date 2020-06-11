﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

</head>
<script>
	function findPwBtn() {

		var formData = $('#testform').serialize();

		$.ajax({

			type : "post",
			url : "<c:url value='/email/findPassword.do'/>",
			data : formData,
			success : function(data) {
				if (data == "complete") {
					alert("[성공]메일주소로 비밀번호가 전송되었습니다");
				} else if (data == "false") {
					alert("[실패]아이디와 이메일주소를 확인해주세요")
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
					class="text-black">비밀번호 찾기</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section" data-aos="fade">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<h2 class="h1 mb-3 text-black">비밀번호 찾기</h2>
			</div>
			<div class="card shadow col-md-5">
				<div class="card-body">
					<form:form action="" method="post" modelAttribute="tempMemberBean"
						id="testform">
						<div class="form-group">
							<form:label path="mId">아이디</form:label>
							<div class="input-group">
								<form:input path="mId" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<form:label path="mEmail">이메일 주소</form:label>
							<div class="input-group">
								<form:input path="mEmail" class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<div class="text-center">
								<form:button type="button" class="btn btn-primary"
									onclick="findPwBtn();">비밀번호 찾기</form:button>
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









