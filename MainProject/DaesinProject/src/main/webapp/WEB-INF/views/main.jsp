<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />


<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<div id="fullpage" class="container p-0">
	<c:if test="${member == null }">
		<div class="site-blocks-cover section sec1 pb-5" margin-bottom: 150px">
	</c:if>
	<c:if test="${member != null }">
		<div class="site-blocks-cover section sec1 pb-5" margin-bottom: 150px">
	</c:if>
	<div class="container slide slide1"
		style="background-image: url(images/2025745.jpg); background-size: cover;"
		data-aos="fade">
		<div
			class="row ml-5 align-items-start align-items-md-center text-black">
			<div class="col-md-7 text-center">
				<h1 class="mb-4" style="color: black;">누군가 대신해줬으면 하는 일이 있으신가요?</h1>
				<div class="intro-text text-center text-md-left">
					<p class="mb-4" style="color: black;">
						대신마켓에서는 여러분의 일을 대신해줄 사람을 찾을 수 있습니다!<br>
						단순 심부름부터 역할 대행까지 다양한 분야의 일을 대신해드립니다<br>
						지금 바로 온라인으로 간편하게 일을 맡겨보세요!
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container slide slide2"
		style="background-image: url(images/money.jpg); background-size: cover;"
		data-aos="fade">
		<div
			class="row ml-5 align-items-start align-items-md-center text-black">
			<div class="col-md-7 text-center">
				<h1 class="mb-4" style="color: black; padding: 10px;font-weight: bold;">시간이 남는데 부수입을<br>올리고 싶으신가요?</h1>
				<div class="intro-text text-center text-md-left">
					<p class="mb-4" style="color: black;">
						대신마켓에서는 하루에 수천개의 대행 요청이 올라오고 있습니다.<br>
						여러분이 하고 싶은 의뢰를 수행하고 그에 맞는 보상을 받아보세요!
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div
	class="site-section site-section-sm site-blocks-1 section sec2 p-0 pt-5">
	<div class="container slide slide1">
		<div class="row mb-4">
			<div class="col-md-5" style="padding: 0px">
				<div class="block-16">
					<figure>
						<img src="${root }images/delivery.jpg" alt="Image placeholder"
							class="img-fluid rounded" />
					</figure>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-6" style="padding: 0px">
				<div class="site-section-heading pt-3 mb-4">
					<h1 class="text-black" style="text-align: center;">대행서비스?</h1>
				</div>
				<p style="font-size: 18px;"><strong>대행서비스</strong>란, 단어 그대로 다른 사람의 일을 대신해주는 서비스입니다. 
				고객님이 일을 부탁하시면 다른 사람이 그 일을 대신 수행해 줄 것입니다. 대신마켓에서는 손쉽게 대행서비스를 이용하실 수 있게 서비스를 제공하고 있습니다.
				사소한 일부터 복잡한 일까지 일단 부탁해보세요!<p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-0"
				data-aos="fade-up" data-aos-delay="">
				<div class="icon mt-1 mr-4 align-self-start">
					<span class="icon-group"></span>
				</div>
				<div class="text">
					<h2>서비스</h2>
					<p>편의점에서 물건 사기, 대형 쇼핑몰에서 장보기, 콘서트 티켓 예매하기, 맛집 줄서기, 대행 알바 등 고객님이
						원하시는 모든 일을 서포터가 대신해드립니다.</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0"
				data-aos="fade-up" data-aos-delay="100">
				<div class="icon mt-1 mr-4 align-self-start">
					<span class="icon-money"></span>
				</div>
				<div class="text">
					<h2>안전 결제</h2>
					<p>의뢰가 완수되기 전까지 결제 금액은 대신마켓에서 안전하게 관리합니다.<br>고객님께서는 안심하시고 편하게 <br>서비스를 이용해주세요.</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pr-0"
				data-aos="fade-up" data-aos-delay="200">
				<div class="icon mt-1 mr-4 align-self-start">
					<span class="icon-assistive-listening-systems"></span>
				</div>
				<div class="text">
					<h2>고객 지원</h2>
					<p>고객님을 위해 대신마켓은 24시간 상담을 운영하고 있습니다.<br>서비스를 이용하시는 도중 불편한 일이 생기셨거나 개선했으면 하는 부분을<br>
						발견하셨다면 언제든지 문의해주세요.</p>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="site-section block-8 section sec4 pt-5">
	<div class="container slide slide1">
		<div class="row justify-content-center mb-5 pt-5" data-aos="fade-down" data-aos-delay="1">
			<div class="col-md-7 site-section-heading text-center pt-4">
				<h2 >서포터 모집</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-12 col-lg-3 mb-5" data-aos="fade-right"
				data-aos-delay="100">
				<a href="${root }member/support"><img src="images/recruit.jpg"
					alt="Image placeholder" class="img-fluid rounded" /></a>
			</div>
			<div class="col-md-12 col-lg-6 text-center mt-5">
				<h3 data-aos="fade-left" data-aos-delay="1">
					<a href="${root }member/support">서포터님을 찾고 있습니다</a>
				</h3>
				<br />
				<p data-aos="fade-up" data-aos-delay="100">
					대신마켓에서는 일이 끝나고 남는 시간에 추가적으로 수입을 얻고 싶으신 분,<br /> 단기 아르바이트를 찾으시는 분, 책임감이 투철하신 분을
					찾고 있습니다.<br />간단한 인증절차를 거치시면 바로 대행 일을 시작하실 수 있습니다.<br />
					대신마켓과 함께하실 분들은 지금 바로 신청해주세요!
				</p>
				<p data-aos="fade-up" data-aos-delay="400">
					<a href="member/support" class="btn btn-primary btn-sm">신청하기</a>
				</p>
			</div>
		</div>
	</div>
</div>

</div>
<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>
