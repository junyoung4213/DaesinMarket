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
<!--fullpage CSS-->
<link rel="stylesheet" href="${root }css/fullpage.css" />

<link rel="stylesheet" href="https://use.fontawesome.com/aa194e1f0f.css">

<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
<style>
.image-container {
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="site-wrap">
		<!-- 상단 메뉴 부분 -->
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top" style="padding-top: 0">
				<div class="container">
					<div class="row justify-content-center">


						<div class="col-md-12 row" style="padding: 0px">
							<div class="site-logo col-md-2 p-0 d-none d-md-block text-left image-container">
								<a href="${root }main" style="all: unset; cursor: pointer;"><img
									class="col-lg-10 col-md-3 p-0" id="logo" src="${root }images/daesinLogo.png"></a>
							</div>
							<nav
								class="site-navigation text-right text-md-center col-md-7 align-self-center"
								role="navigation">
								<div class="container">
									<ul class="site-menu js-clone-nav d-none d-md-block p-0" id="menu">
										<c:if test="${member == null }">
											<li class="d-md-none"><a href="${root }member/login">로그인</a></li>
											<li class="d-md-none"><a href="${root }member/login">회원가입</a></li>
										</c:if>
										<c:if test="${member != null }">
											<li class="d-md-none"><a>회원아이디: ${member.mId }</a></li>
											<li class="d-md-none"><a>포인트: <span
													class="memberPoint"></span></a></li><br>
											<li class="d-md-none"><a href="${root }member/logout">
													로그아웃 </a></li>
											<li class="d-md-none"><a href="${root }member/mypage">
													마이페이지 </a></li>
										</c:if>
										<li><a href="${root }board/main?bCno=1">배달</a></li>
										<li><a href="${root }board/main?bCno=2">쇼핑</a>
										<li><a href="${root }board/main?bCno=3">단순작업</a>
										<li><a href="${root }board/main?bCno=4">역할대행</a>
										<li class="has-children"><a href="#">Contact</a>
											<ul class="dropdown">
												<li><a href="${root }member/support">서포터 신청</a></li>
												<li><a href="${root }member/faq">문의하기</a></li>
											</ul></li>
									</ul>
								</div>
							</nav>

							<div
								class="site-top-icons col-md-3 text-right align-self-center mt-4"
								style="padding: 0px">
								<ul class="">
									<c:if test="${member == null}">
										<li><a href="${root }member/login"> <button
												class="d-none d-md-block btn btn-link"
												style="font-size: 14px; padding:10px 15px 10px 15px"><i class="fas fa-sign-in-alt mr-1"></i>로그인</button>
										</a></li>
										<li><a href="${root }member/join"> <button
												class="d-none d-md-block btn btn-primary"
												style="font-size: 14px; padding: 10px 15px 10px 15px"><i class="fas fa-user-plus mr-1"></i>회원가입</button>
										</a></li>
										<input type="hidden" id="memberId" value="" />
									</c:if>
									<c:if test="${member != null}">
										<li><span class="d-none d-md-block"
											style="font-size: 16px;">아이디: ${member.mId } / </span></li>
										<li><span class="d-none d-md-block"
											style="font-size: 16px;">포인트: <span
												class="memberPoint"></span></span></li><br>
										<li><a href="${root }member/logout"> <span
												class="d-none d-md-block btn btn-primary"
												style="font-size: 14px; padding:10px 15px 10px 15px"><i class="glyphicon glyphicon-log-out mr-1"></i>로그아웃</span>
										</a></li>
										<li><a href="${root }member/mypage"> <span
												class="d-none d-md-block btn btn-info mr-0"
												style="font-size: 14px; padding:10px 15px 10px 15px">마이페이지</span>
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

		</header>