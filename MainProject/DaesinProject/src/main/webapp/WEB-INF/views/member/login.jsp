<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<script>
	function find_id() {
		location.href = "${root}member/findId";
	}

	function find_pw() {
		location.href = "${root}member/findPw";
	}

	function join() {
		location.href = "${root}member/join";
	}
</script>
<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">로그인</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section" data-aos="fade">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<h2 class="h1 mb-3 text-black">로그인</h2>
			</div>
			<div class="col-md-5">
				<form:form action="${root }member/login_pro" method="post"
					modelAttribute="tempLoginMemberBean">
					<div class="p-3 p-lg-5 border">
						<c:if test="${param.fail==true }">
							<div class="alert alert-danger text-center">
								<h3>로그인 실패</h3>
								<p>아이디나 비밀번호를 확인해주세요</p>
							</div>
						</c:if>
						<div class="form-group row">
							<div class="col-md-12">
								<form:label path="mId" class="text-black">아이디</form:label>
								<form:input path="mId" class="form-control" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-12">
								<form:label path="mPw" class="text-black">비밀번호</form:label>
								<form:password path="mPw" class="form-control" />
							</div>
						</div>
						<br />

						<div class="form-group row">
							<div class="col-lg-12">
								<input type="submit" class="btn btn-primary btn-lg btn-block"
									value="로그인" />
							</div>
						</div>

						<div class="form-group row">
							<div class="col-lg-6 mb-2">
								<input type="button" class="btn btn-info btn-lg btn-block"
									value="아이디찾기" onclick="find_id();" />
							</div>

							<div class="col-lg-6 mb-2">
								<input type="button" class="btn btn-warning btn-lg btn-block"
									value="비밀번호찾기" onclick="find_pw();" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-lg-12">
								<input type="button"
									class="btn btn-lg btn-outline-success col-md-12" value="회원가입"
									onclick="join();" />
							</div>
						</div>

					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>
