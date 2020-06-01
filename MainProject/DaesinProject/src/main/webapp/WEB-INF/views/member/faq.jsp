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

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <span
					class="text-black">Contact</span> <span class="mx-2 mb-0">/</span>
				<strong class="text-black">문의하기</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section" data-aos="fade">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<h2 class="h1 mb-3 text-black">문의하기</h2>
			</div>
			<div class="col-md-5">
				<form:form action="${root }email/question.do" method="post"
					modelAttribute="questionBean">
					<div class="p-3 p-lg-5 border">
						<form:hidden path="m_no" value="${member.m_no }" />
						<form:hidden path="m_email" value="${member.m_email }" />
						<form:hidden path="m_id" value="${member.m_id }" />

						<div class="form-group row">
							<div class="col-md-12">
								<form:label path="title" class="text-black">제목</form:label>
								<form:input path="title" class="form-control" />
							</div>
						</div>

						<div class="form-group row">
							<div class="col-md-12 mb-3">
								<form:label path="content" class="text-black">내용</form:label>
								<form:textarea path="content" cols="30" rows="7"
									class="form-control" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-lg-12">
								<form:button class="btn btn-primary btn-lg btn-block">문의메일 보내기</form:button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
			<!-- <div class="col-md-5 ml-auto">
              <div class="p-4 border mb-3">
                <span class="d-block text-primary h6 text-uppercase"
                  >New York</span
                >
                <p class="mb-0">
                  203 Fake St. Mountain View, San Francisco, California, USA
                </p>
              </div>
              <div class="p-4 border mb-3">
                <span class="d-block text-primary h6 text-uppercase"
                  >London</span
                >
                <p class="mb-0">
                  203 Fake St. Mountain View, San Francisco, California, USA
                </p>
              </div>
              <div class="p-4 border mb-3">
                <span class="d-block text-primary h6 text-uppercase"
                  >Canada</span
                >
                <p class="mb-0">
                  203 Fake St. Mountain View, San Francisco, California, USA
                </p>
              </div>
            </div> -->
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
