<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<c:import url="/WEB-INF/views/include/top_menu.jsp" />


<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">마이페이지</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section" data-aos="fade">
	<div class="container">
		<div class="justify-content-center">
			<div class="col-md-12 text-center">
				<h2 class="h1 mb-3 text-black">마이페이지</h2>
			</div>
			<div class="row col-md-12 justify-content-center">
				<div class="card shadow col-md-3 text-center p-5 m-3"
					onclick="modify();" style="cursor: pointer">정보수정</div>
				<div class="card shadow col-md-3 text-center p-5 m-3"
					onclick="point();" style="cursor: pointer">포인트 충전</div>

			</div>
			<div class="row col-md-12 justify-content-center">
				<div class="card shadow col-md-3 text-center p-5 m-3"
					onclick="trade();" style="cursor: pointer">내 게시물 보기</div>
				<div class="card shadow col-md-3 text-center p-5 m-3"
					onclick="support();" style="cursor: pointer">내가 맡은 의뢰글 보기</div>
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
<script>
	function modify() {
		location.href = "${root }member/modify";
	}

	function point() {
		location.href = "${root}member/point";
	}

	function trade() {
		location.href = "${root}trade/member";
	}

	function support() {
		location.href = "${root}trade/supporter";
	}
</script>
</body>
</html>

