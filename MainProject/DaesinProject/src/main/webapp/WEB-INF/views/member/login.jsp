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
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"
    />
    <link rel="stylesheet" href="${root }fonts/icomoon/style.css" />

    <link rel="stylesheet" href="${root }css/bootstrap.min.css" />
    <link rel="stylesheet" href="${root }css/magnific-popup.css" />
    <link rel="stylesheet" href="${root }css/jquery-ui.css" />
    <link rel="stylesheet" href="${root }css/owl.carousel.min.css" />
    <link rel="stylesheet" href="${root }css/owl.theme.default.min.css" />

    <link rel="stylesheet" href="${root }css/aos.css" />

    <link rel="stylesheet" href="${root }css/style.css" />
  </head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<%-- <div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<c:if test="${fail==true }">
							<div class="alert alert-danger">
								<h3>로그인 실패</h3>
								<p>아이디 비밀번호를 확인해주세요</p>
							</div>
						</c:if>
						<form:form action="${root }member/login_pro" method="post" modelAttribute="tempLoginmemberBean">
							<div class="form-group">
								<form:label path="member_id">아이디</form:label>
								<form:input path="member_id" class="form-control" />
								<form:errors path="member_id" style="color:red" />
							</div>
							<div class="form-group">
								<form:label path="member_pw">비밀번호</form:label>
								<form:password path="member_pw" class="form-control" />
								<form:errors path="member_pw" style="color:red" />
							</div>
							<div class="form-group text-right">
								<form:button class="btn btn-primary">로그인</form:button>
								<a href="${root }member/join" class="btn btn-danger">회원가입</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
 --%>
 <div class="bg-light py-3">
        <div class="container">
          <div class="row">
            <div class="col-md-12 mb-0">
              <a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span>
              <strong class="text-black">로그인</strong>
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
				<form action="#" method="post">
					<div class="p-3 p-lg-5 border">
						<div class="form-group row">
							<div class="col-md-12">
								<label for="c_id" class="text-black">아이디</label> <input
									type="text" class="form-control" id="c_id" name="c_id"
									placeholder="" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-md-12">
								<label for="c_pw" class="text-black">비밀번호 </label> <input
									type="password" class="form-control" id="c_pw" name="c_pw"
									placeholder="" />
							</div>
						</div>
						<br />
						
						<div class="form-group row">
							<div class="col-lg-6">
								<input type="submit" class="btn btn-info btn-lg btn-block"
									value="아이디찾기" />
							</div>
						
							<div class="col-lg-6 mb-2">
								<input type="submit" class="btn btn-warning btn-lg btn-block"
									value="비밀번호찾기" />
							</div>
						</div>

						<div class="form-group row">
							<div class="col-lg-12">
								<input type="submit" class="btn btn-primary btn-lg btn-block"
									value="로그인" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
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
