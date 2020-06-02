<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<body>
	<div class="site-wrap">
		<!-- 상단 메뉴 부분 -->
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top">
				<div class="container">
					<div class="row align-items-center">
						<div
							class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">

						</div>

						<div
							class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
							<div class="site-logo">
								<a href="${root }main" class="js-logo-clone">대신컴퍼니</a>
							</div>
						</div>

						<div class="col-6 col-md-4 order-3 order-md-3 text-right">
							<div class="site-top-icons">
								<ul>
									<c:if test="${member == null}">
										<li><a href="${root }member/login"><span class=""
												style="font-size: 15px;">로그인</span></a></li>
										<li><a href="${root }member/join"><span class=""
												style="font-size: 15px;">회원가입</span></a></li>
									</c:if>
									<c:if test="${member != null}">
										<li><a href="${root }member/logout"><span class=""
												style="font-size: 15px;">로그아웃</span></a></li>
										<li><a href="${root }member/modify"><span class=""
												style="font-size: 15px;">마이페이지</span></a></li>
									</c:if>



									<li class="d-inline-block d-md-none ml-md-0"><a href="#"
										class="site-menu-toggle js-menu-toggle"><span
											class="icon-menu"></span></a></li>
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
						<li><a href="${root }main">HOME</a></li>
						<li><a href="${root }member/about">ABOUT</a></li>
						<li class="has-children"><a>Request</a>
							<ul class="dropdown">
								<c:forEach var="obj" items="${menuList }">
									<li><a href="${root }board/main?bCno=${obj.cNo}">${obj.cName }</a></li>
								</c:forEach>
							</ul></li>
						<li class="has-children"><a href="#">Contact</a>
							<ul class="dropdown">
								<li><a href="${root }member/support">서포터 신청</a></li>
								<li><a href="${root }member/faq">문의하기</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>