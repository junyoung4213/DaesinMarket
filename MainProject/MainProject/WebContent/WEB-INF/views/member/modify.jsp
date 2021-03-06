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
					<form action="modify_member.html" method="post">
						<div class="form-group">
							<label for="member_name">이름</label> <input type="text"
								id="member_name" name="member_name" class="form-control" value="홍길동"
								disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="member_id">아이디</label> <input type="text" id="member_id"
								name="member_id" class="form-control" value="abc"
								disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="member_pw">비밀번호</label> <input type="password"
								id="member_pw" name="member_pw" class="form-control" value="1234" />
						</div>
						<div class="form-group">
							<label for="member_pw2">비밀번호 확인</label> <input type="password"
								id="member_pw2" name="member_pw2" class="form-control" value="1234" />
						</div>
						<div class="form-group">
							<div class="text-right text-center">
								<button type="submit" class="btn btn-primary">정보수정</button>
							</div>
						</div>

					</form>
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

