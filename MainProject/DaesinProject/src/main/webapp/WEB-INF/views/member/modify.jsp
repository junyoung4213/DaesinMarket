<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<script>

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
					class="text-black">정보수정</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section" data-aos="fade">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<h2 class="h1 mb-3 text-black">정보수정</h2>
			</div>
			<div class="card shadow col-md-5">
				<div class="card-body">
					<form:form action="${root }member/modify_pro" method="post" modelAttribute="modifyMemberBean">
					<form:hidden path="mNo" value="${mNo}"/>
						<div class="form-group">
							<form:label path="mId">아이디</form:label>
							<form:input path="mId" class="form-control"
								value="${mId}" disabled="true" />
						</div>
						<div class="form-group">
							<form:label path="mEmail">이메일</form:label>
							<form:input path="mEmail" class="form-control"
								value="${mEmail}" disabled="true" />
						</div>
						<div class="form-group">
							<form:label path="mPw">새비밀번호</form:label>
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
							<div class="text-right text-center">
								<form:button class="btn btn-primary">정보수정</form:button>
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

