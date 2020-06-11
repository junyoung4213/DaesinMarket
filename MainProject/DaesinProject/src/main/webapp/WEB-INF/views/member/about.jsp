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
					class="text-black">About</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section" data-aos="fade">
	<div class="container border-bottom">
		<div class="row mb-5">
			<div class="col-md-6">
				<div class="block-16">
					<figure>
						<img src="${root }images/blog_1.jpg" alt="Image placeholder"
							class="img-fluid rounded" />
					</figure>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<div class="site-section-heading pt-3 mb-4">
					<h2 class="text-black">인력대행서비스?</h2>
				</div>
				<p>시간은 돈으로도 살 수 없다는 말이 있습니다. 하지만 현대 사회에서는 그것이 가능합니다. 예를 들면 고속도로의
					하이패스, 놀이공원의 패스권, 우편물 특급배송이 있습니다. 합당한 비용을 지불하면 그만큼의 시간을 절약할 수 있는
					시스템입니다. 필링컴퍼니는 모든 분야에서 고객님들의 소중한 시간을 절약시켜드리기 위해 인력대행 서비스를 시작했습니다.</p>
			</div>
		</div>
	</div>
</div>

<div class="site-section site-blocks-2" data-aos="fade">
        <div class="container">
          <div class="row text-center">
            <div class="col-md-12 border-bottom mb-5">
              <h1 class="text-black site-section-heading pt-3 mb-4 text-center">
                대행 서비스 목록
              </h1>
            </div>
            <div
              class="col-sm-3 col-md-3 col-lg-3 mb-5 mb-lg-0"
              data-aos="fade"
              data-aos-delay=""
            >
              <a class="block-2-item" href="${root }board/main?bCno=1">
                <figure class="image">
                  <img
                    src="${root }images/delivery.jpg"
                    alt=""
                    class="img-fluid"
                    style="height: 300px; width: 300px;"
                  />
                </figure>
                <div class="text">
                  <h2>배달 대행</h2>
                </div>
              </a>
            </div>
            <div
              class="col-sm-3 col-md-3 col-lg-3 mb-5 mb-lg-0"
              data-aos="fade"
              data-aos-delay="100"
            >
              <a class="block-2-item" href="${root }board/main?bCno=2">
                <figure class="image">
                  <img
                    src="${root }images/shopping.jpg"
                    alt=""
                    class="img-fluid"
                    style="height: 300px; width: 300px;"
                  />
                </figure>
                <div class="text">
                  <h2>쇼핑 대행</h2>
                </div>
              </a>
            </div>
            <div
              class="col-sm-3 col-md-3 col-lg-3 mb-5"
              data-aos="fade"
              data-aos-delay="200"
            >
              <a class="block-2-item" href="${root }board/main?bCno=3">
                <figure class="image">
                  <img
                    src="${root }images/work.jpg"
                    alt=""
                    class="img-fluid"
                    style="height: 300px; width: 300px;"
                  />
                </figure>
                <div class="text">
                  <h2>작업 대행</h2>
                </div>
              </a>
            </div>
            <div
              class="col-sm-3 col-md-3 col-lg-3 mb-5 mb-lg-0"
              data-aos="fade"
              data-aos-delay="200"
            >
              <a class="block-2-item" href="${root }board/main?bCno=4">
                <figure class="image">
                  <img
                    src="${root }images/actor.jpg"
                    alt=""
                    class="img-fluid"
                    style="height: 300px; width: 300px;"
                  />
                </figure>
                <div class="text">
                  <h2>역할 대행</h2>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>
