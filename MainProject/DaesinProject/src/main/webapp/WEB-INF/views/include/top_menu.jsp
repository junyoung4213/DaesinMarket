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
						
						
						<div class="col-md-12 row">
							<div class="site-logo col-md-6">
								<a href="${root }main" class="js-logo-clone">대신컴퍼니</a>
							</div>
							<div class="site-top-icons col-md-6 text-right">
								<ul class="">
									<c:if test="${member == null}">
										<li><a href="${root }member/login">
												<span class="d-none d-md-block btn btn-primary"
													style="font-size: 20px;">로그인</span>
											</a></li>
										<li><a href="${root }member/join">
												<span class="d-none d-md-block btn btn-info"
													style="font-size: 20px;">회원가입</span>
											</a></li>
									</c:if>
									<c:if test="${member != null}">
										<li><span class="d-none d-md-block"
											style="font-size: 20px;">회원아이디: ${member.mId } / </span></li>
										<li><span class="d-none d-md-block"
											style="font-size: 20px;">포인트: ${member.mPoint }</span></li>
										<br>
										<li><a href="${root }member/logout">
												<span class="d-none d-md-block btn btn-primary"
													style="font-size: 20px;">로그아웃</span>
											</a></li>
										<li><a href="${root }member/mypage">
												<span class="d-none d-md-block btn btn-info"
													style="font-size: 20px;">마이페이지</span>
											</a></li>
									</c:if>
									<li class="d-inline-block d-md-none ml-md-0"><a href="#"
											class="site-menu-toggle js-menu-toggle">
											<span class="icon-menu"></span>
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