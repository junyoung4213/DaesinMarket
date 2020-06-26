<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" href="${root }css/searchbar.css" />
<link rel="stylesheet" href="${root }css/style.css" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
</head>
<body>
	<div class="site-wrap">
		<!-- 상단 메뉴 부분 -->
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top">
				<div class="container">
					<div class="row justify-content-center">


						<div class="col-md-12 row">
							<div class="site-logo col-md-4 text-left">
								<a href="${root }main" class="js-logo-clone">대신마켓</a>
							</div>

							<div class="site-logo col-md-4 text-center">
								<div class="wrapper">
									<div class="search-container">
										<form action="${root }board/main" method="get">
											<button class="search-button" style="cursor: pointer">
												<i class="fa fa-search"></i>
											</button>
											<input type="text" id="keyward" name="keyward"
												placeholder="검색어를 입력해주세요"> 
										</form>
									</div>
								</div>
							</div>

							<div class="site-top-icons col-md-4 text-right">
								<ul class="">
									<c:if test="${member == null}">
										<li><a href="${root }member/login"> <span
												class="d-none d-md-block btn btn-primary"
												style="font-size: 20px;">로그인</span>
										</a></li>
										<li><a href="${root }member/join"> <span
												class="d-none d-md-block btn btn-info"
												style="font-size: 20px;">회원가입</span>
										</a></li>
										<input type="hidden" id="memberId" value="" />
									</c:if>
									<c:if test="${member != null}">
										<li><span class="d-none d-md-block"
											style="font-size: 20px;">회원아이디: ${member.mId } / </span></li>
										<li><span class="d-none d-md-block"
											style="font-size: 20px;">포인트: <span
												class="memberPoint"></span></span></li>
										<br>
										<li><a href="${root }member/logout"> <span
												class="d-none d-md-block btn btn-primary"
												style="font-size: 20px;">로그아웃</span>
										</a></li>
										<li><a href="${root }member/mypage"> <span
												class="d-none d-md-block btn btn-info"
												style="font-size: 20px;">마이페이지</span>
										</a></li>
										<input type="hidden" id="memberId" value="${member.mId }" />
									</c:if>
									<li class="d-inline-block d-md-none ml-md-0"><a href="#"
										class="site-menu-toggle js-menu-toggle"> <span
											class="icon-menu"></span>
									</a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
			<nav class="site-navigation text-right text-md-center"
				role="navigation">
				<div class="container">
					<ul class="site-menu js-clone-nav d-none d-md-block" id="menu">
						<c:if test="${member == null }">
							<li class="d-md-none"><a href="${root }member/login">로그인</a></li>
							<li class="d-md-none"><a href="${root }member/join">회원가입</a></li>
						</c:if>
						<c:if test="${member != null }">
							<li class="d-md-none"><a>회원아이디: ${member.mId }</a></li>
							<li class="d-md-none"><a>포인트: <span class="memberPoint"></span></a></li>
							<li class="d-md-none"><a href="${root }member/logout">
									로그아웃 </a></li>
							<li class="d-md-none"><a href="${root }member/mypage">
									마이페이지 </a></li>
						</c:if>
						<li><a href="${root }main">HOME</a></li>
						<li><a href="${root }member/about">ABOUT</a></li>
						<li><a href="${root }board/main">Request</a> <%-- <ul class="dropdown">
								<c:forEach var="obj" items="${menuList }">
									<li><a href="${root }board/main?bCno=${obj.cNo}">${obj.cName }</a></li>
								</c:forEach>
							</ul></li> --%>
						<li class="has-children"><a href="#">Contact</a>
							<ul class="dropdown">
								<li><a href="${root }member/support">서포터 신청</a></li>
								<li><a href="${root }member/faq">문의하기</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>