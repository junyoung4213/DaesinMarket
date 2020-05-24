<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="en">
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
				<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">Request</strong>
			</div>
		</div>
	</div>
</div>

<div class="container" style="margin-top: 100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 mb-5">
			<div class="col-md-12 text-center">
				<h1 class="mb-3 text-black">미션</h1>
				<br />
				<div class="border-bottom"></div>
				<br /> <br />
			</div>
			<div class="card shadow">
				<div class="card-body">
					<form action="${root }board/modify" method="post">
						<div class="form-group">
							<label for="board_date">위치</label> <input type="text"
								id="board_date" name="board_date" class="form-control"
								value="서울시 마포구 망원동" />
						</div>
						<div class="form-group">
							<label for="board_date">작성시간</label> <input type="text"
								id="board_date" name="board_date" class="form-control"
								value="2018-7-20" disabled="disabled" />
						</div>
						<!-- <div class="form-group">
							<label for="board_date">마감시간</label> <input type="time"
								id="board_date" name="board_date" class="form-control"
								value="2018-7-22"/>
						</div> -->
						<div class="form-group">
							<label for="board_subject">제목</label> <input type="text"
								id="board_subject" name="board_subject" class="form-control"
								value="제목입니다" />
						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea id="board_content" name="board_content"
								class="form-control" rows="10" style="resize: none">본문입니다</textarea>
						</div>
						<div class="form-group">
							<label for="board_file">첨부 이미지</label> <img src="image/logo.png"
								width="100%" /> <input type="file" name="board_file"
								id="board_file" class="form-control" accept="image/*" />
						</div>
						<div class="form-group">
							<label for="board_content">리워드</label> <input type="text"
								id="board_content" name="board_content" class="form-control"
								value="5,000원" />
						</div>
						<div class="form-group">
							<div class="text-right">
								<a href="${root }board/main" class="btn btn-primary">목록보기</a>
								<button type="submit" class="btn btn-info">수정완료</button>
								<a href="${root }board/delete" class="btn btn-warning">삭제하기</a>
							</div>
						</div>
					</form>
				</div>
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
