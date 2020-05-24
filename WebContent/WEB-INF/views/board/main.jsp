<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="en">
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


	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <a
						href="${root }board/main">Request</a> <span class="mx-2 mb-0">/</span> <strong
						class="text-black">배달</strong>
				</div>
			</div>
		</div>
	</div>

	<!-- 게시글 리스트 -->
	<div class="container" style="margin-top: 100px;">
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title text-center mb-5">배달 게시판</h4>
				<table class="table table-hover mb-5" id="board_list">
					<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">금액</th>
							<th class="text-center d-none d-md-table-cell">지역</th>
							<th class="text-center d-none d-md-table-cell">작성시간</th>
							<th class="text-center">지원자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="${root }board/read">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="read.html">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="read.html">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="read.html">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="read.html">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="read.html">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="read.html">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="read.html">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="read.html">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
						<tr>
							<td class="text-center">10</td>
							<td class="text-center"><a href="read.html">물건 대신 옮겨주실분
									구합니다</a></td>
							<td class="text-center">5,000원</td>
							<td class="text-center d-none d-md-table-cell">서울</td>
							<td class="text-center d-none d-md-table-cell">2018-12-12</td>
							<td class="text-center">1명</td>
						</tr>
					</tbody>
				</table>

				<div class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="#" class="page-link">이전</a></li>
						<li class="page-item"><a href="#" class="page-link">1</a></li>
						<li class="page-item"><a href="#" class="page-link">2</a></li>
						<li class="page-item"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link">6</a></li>
						<li class="page-item"><a href="#" class="page-link">7</a></li>
						<li class="page-item"><a href="#" class="page-link">8</a></li>
						<li class="page-item"><a href="#" class="page-link">9</a></li>
						<li class="page-item"><a href="#" class="page-link">10</a></li>
						<li class="page-item"><a href="#" class="page-link">다음</a></li>
					</ul>
				</div>

				<div class="d-block d-md-none">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="#" class="page-link">이전</a></li>
						<li class="page-item"><a href="#" class="page-link">다음</a></li>
					</ul>
				</div>

				<div class="text-right">
					<a href="${root }board/write" class="btn btn-primary">글쓰기</a>
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




