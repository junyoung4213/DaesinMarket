<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />


<c:import url="/WEB-INF/views/include/top_menu.jsp" />


<div class="site-blocks-cover">
	<div class="container" style="background-image: url(images/puzzle.jpg); background-size:cover;" data-aos="fade">
		<div
			class="row align-items-start align-items-md-center justify-content-end">
			<div class="col-md-6 text-center pt-5 mt-5">
				<h2 class="mb-4">시간은 부족한데 할일은 많으신가요?</h2>
				<div class="intro-text text-center text-md-left">
					<p class="mb-4">
						대신 컴퍼니에서는 시간이 부족하신 고객님께<br /> 일을 대신해줄 서포터분들을 연결시켜드립니다.
					</p>
					<p>
						<a href="${root }member/about" class="btn btn-sm btn-primary">자세히보기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="site-section site-section-sm site-blocks-1">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
				data-aos="fade-up" data-aos-delay="">
				<div class="icon mr-4 align-self-start">
					<span class="icon-group"></span>
				</div>
				<div class="text">
					<h2>대행 서비스</h2>
					<p>편의점에서 물건 사기, 대형 쇼핑몰에서 장보기, 콘서트 티켓 예매하기, 맛집 줄서기, 가구 옮기기, 하객
						알바 등등.. 간단한 일부터 숙련이 필요한 일까지, 고객님이 원하시는 모든 일을 서포터가 대신해드립니다.</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
				data-aos="fade-up" data-aos-delay="100">
				<div class="icon mr-4 align-self-start">
					<span class="icon-money"></span>
				</div>
				<div class="text">
					<h2>안전 결제</h2>
					<p>의뢰가 완수되기 전까지 결제 금액은 대신 컴퍼니에서 안전하게 관리합니다. 고객님께서는 안심하시고 서비스를
						이용해주세요.</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
				data-aos="fade-up" data-aos-delay="200">
				<div class="icon mr-4 align-self-start">
					<span class="icon-help"></span>
				</div>
				<div class="text">
					<h2 class="text-uppercase">고객 지원</h2>
					<p>고객님의 의견을 귀기울여 듣겠습니다. 서비스를 이용하시던 도중 불편한 일이 생기셨거나 개선했으면 하는 부분을
						발견하셨다면 언제든지 문의해주세요. 빠르게 처리하도록 노력하겠습니다.</p>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="site-section block-3 site-blocks-2 bg-light">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-7 site-section-heading text-center pt-4">
				<h2>카테고리</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="nonloop-block-3 owl-carousel">
					<div class="item">
						<div class="block-4 text-center">
							<a href="${root }board/main"> <img src="images/delivery.jpg"
								alt="Image placeholder" class="img-fluid" />
							</a>
							<div class="block-4-text p-4">
								<h3>
									<a href="${root }board/main">배달대행 </a>
								</h3>
								<!-- <p class="mb-0">Finding perfect t-shirt</p>
                      <p class="text-primary font-weight-bold">$50</p> -->
							</div>

						</div>
					</div>
					<div class="item">
						<div class="block-4 text-center">
							<a href="${root }board/main"> <img src="images/shopping.jpg"
								alt="Image placeholder" class="img-fluid" />
							</a>
							<div class="block-4-text p-4">
								<h3>
									<a href="${root }board/main">쇼핑대행</a>
								</h3>
								<!-- <p class="mb-0">Finding perfect products</p>
                      <p class="text-primary font-weight-bold">$50</p> -->
							</div>

						</div>
					</div>
					<div class="item">
						<div class="block-4 text-center">
							<a href="${root }board/main"> <img src="images/work.jpg"
								alt="Image placeholder" class="img-fluid" />
							</a>
							<div class="block-4-text p-4">
								<h3>
									<a href="${root }board/main">작업대행</a>
								</h3>
								<!-- <p class="mb-0">Finding perfect products</p>
                      <p class="text-primary font-weight-bold">$50</p> -->
							</div>
						</div>
					</div>
					<div class="item">
						<div class="block-4 text-center">
							<a href="${root }board/main"> <img src="images/actor.jpg"
								alt="Image placeholder" class="img-fluid" />
							</a>
							<div class="block-4-text p-4">
								<h3>
									<a href="${root }board/main">역할대행</a>
								</h3>
								<!-- <p class="mb-0">Finding perfect products</p>
                      <p class="text-primary font-weight-bold">$50</p> -->
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="site-section block-8">
	<div class="container">
		<div class="row justify-content-center mb-5">
			<div class="col-md-7 site-section-heading text-center pt-4">
				<h2>서포터 모집</h2>
			</div>
		</div>
		<div class="row align-items-center justify-content-center">
			<div class="col-md-12 col-lg-4 mb-5">
				<a href="${root }member/support"><img src="images/recruit.jpg"
					alt="Image placeholder" class="img-fluid rounded" /></a>
			</div>
			<div class="col-md-12 col-lg-6 text-center pl-md-5">
				<h3>
					<a href="${root }member/support">서포터를 찾고 있습니다</a>
				</h3>
				<br />
				<!-- <p class="post-meta mb-4">
                By <a href="#">Filling Company</a>
                <span class="block-8-sep">&bullet;</span> September 3, 2018
              </p> -->
				<p>
					일이 끝나고 남는 시간에 추가적으로 돈을 벌고 싶으신 분들,<br /> 전문기술을 가진 분들, 책임감이 투철하신 분들을
					찾고 있습니다.<br /> 간단한 인증절차를 통과하시면 바로 서포터 등록이 가능합니다.<br /> 대신컴퍼니는 함께할
					서포터 여러분을 항상 기다리고 있습니다.
				</p>
				<br />
				<p>
					<a href="member/support" class="btn btn-primary btn-sm">신청하기</a>
				</p>
			</div>
		</div>
	</div>
</div>


<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>
