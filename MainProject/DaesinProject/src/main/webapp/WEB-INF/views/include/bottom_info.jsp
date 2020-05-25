<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<footer class="site-footer border-top">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-5 mb-5 mb-lg-0">
				<div class="row text-center">
					<div class="col-md-9">
						<h3 class="footer-heading mb-4">Navigation</h3>
					</div>
					<div class="col-md-6 col-lg-4">
						<ul class="list-unstyled">
							<li><a href="${root }main">HOME</a></li>
							<li><a href="${root }member/about">ABOUT</a></li>
							<li><a href="${root}member/support">서포터 신청하기</a></li>
							<li><a href="${root}member/faq">문의하기</a></li>


						</ul>
					</div>
					<div class="col-md-6 col-lg-4">
						<ul class="list-unstyled">
							<li><a href="${root }board/main">배달</a></li>
							<li><a href="${root }board/main">쇼핑</a></li>
							<li><a href="${root }board/main">단순작업</a></li>
							<li><a href="${root }board/main">역할 대행</a></li>
				
						</ul>
					</div>
			
				</div>
			</div>

			<div class="col-md-6 col-lg-3 text-center">
				<div class="block-5 mb-5 mb-lg-0">
					<h3 class="footer-heading mb-4">Contact Info</h3>
					<ul class="list-unstyled">
						<li class="address">서울시 종로구 12-34 대신빌딩</li>
						<li class="phone"><a href="tel://0212128272">02 1212 8272</a>
						</li>
						<li class="email">Daesin@gmail.com</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row pt-5 mt-5 text-center">
			<div class="col-md-12">
				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script data-cfasync="false"
						src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="icon-heart" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank" class="text-primary">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</div>
</footer>
</div>

