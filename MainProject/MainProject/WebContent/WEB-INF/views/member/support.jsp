<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html>
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
              <a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span>
              <span class="text-black">Contact</span>
              <span class="mx-2 mb-0">/</span>
              <strong class="text-black">서포터 신청</strong>
            </div>
          </div>
        </div>
      </div>

      <div class="site-section" data-aos="fade">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-12 text-center">
              <h2 class="h1 mb-3 text-black">서포터 신청</h2>
            </div>
            <div class="col-md-5">
              <form action="#" method="post">
                <div class="p-3 p-lg-5 border">
                  <div class="form-group row">
                    <div class="col-md-6">
                      <label for="c_fname" class="text-black"
                        >성 <span class="text-danger">*</span></label
                      >
                      <input
                        type="text"
                        class="form-control"
                        id="c_fname"
                        name="c_fname"
                      />
                    </div>
                    <div class="col-md-6">
                      <label for="c_lname" class="text-black"
                        >이름 <span class="text-danger">*</span></label
                      >
                      <input
                        type="text"
                        class="form-control"
                        id="c_lname"
                        name="c_lname"
                      />
                    </div>
                  </div>
                  <div class="forn-inline">
                    <div class="form-group row">
                      <div class="col-md-12 mb-3">
                        <label for="phone" class="text-black"
                          >전화번호 <span class="text-danger">*</span></label
                        >
                        <input
                          id="phone"
                          type="text"
                          class="form-control"
                          name="phone"
                          placeholder=""
                        />
                      </div>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-lg-12">
                      <input
                        type="submit"
                        class="btn btn-primary btn-lg btn-block"
                        value="메시지 보내기"
                      />
                    </div>
                  </div>
                </div>
              </form>
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
