<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="en">
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
              <strong class="text-black">회원가입</strong>
            </div>
          </div>
        </div>
      </div>

      <div class="site-section" data-aos="fade">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-12 text-center">
              <h2 class="h1 mb-3 text-black">회원가입</h2>
            </div>
            <div class="card shadow col-md-5">
              <div class="card-body">
                <form action="login.html" method="post">
                  <div class="form-group">
                    <label for="user_id">아이디</label>
                    <div class="input-group">
                      <input
                        type="text"
                        id="user_id"
                        name="user_id"
                        class="form-control"
                      />
                      <div class="input-group-append">
                        <button type="button" class="btn btn-primary">
                          중복확인
                        </button>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="user_id">이메일 주소</label>
                    <div class="input-group">
                      <input
                        type="email"
                        id="user_email"
                        name="user_email"
                        class="form-control"
                      />
                      <div class="input-group-append">
                        <button type="button" class="btn btn-primary">
                          인증하기
                        </button>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="user_id">인증번호</label>
                    <div class="input-group">
                      <input
                        type="email"
                        id="user_email"
                        name="user_email"
                        class="form-control"
                      />
                      <div class="input-group-append">
                        <button type="button" class="btn btn-primary">
                          인증확인
                        </button>
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="user_pw">비밀번호</label>
                    <input
                      type="password"
                      id="user_pw"
                      name="user_pw"
                      class="form-control"
                    />
                  </div>
                  <div class="form-group">
                    <label for="user_pw2">비밀번호 확인</label>
                    <input
                      type="password"
                      id="user_pw2"
                      name="user_pw2"
                      class="form-control"
                    />
                  </div>
                  <div class="form-group">
                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">
                        회원가입
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="col-sm-3"></div>
        </div>
      </div>

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
                    <li><a href="request.html">배달</a></li>
                    <li><a href="request.html">쇼핑</a></li>
                    <li><a href="request.html">단순작업</a></li>
                    <li><a href="request.html">역할 대행</a></li>
                  </ul>
                </div>
                <div class="col-md-6 col-lg-4">
                  <ul class="list-unstyled">
                    <li><a href="contact.html">서포터 신청하기</a></li>
                    <li><a href="FAQ.html">문의하기</a></li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="col-md-6 col-lg-3 text-center">
              <div class="block-5 mb-5 mb-lg-0">
                <h3 class="footer-heading mb-4">Contact Info</h3>
                <ul class="list-unstyled">
                  <li class="address">
                    서울시 종로구 12-34 필링빌딩
                  </li>
                  <li class="phone">
                    <a href="tel://0212128272">02 1212 8272</a>
                  </li>
                  <li class="email">filling@gmail.com</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="row pt-5 mt-5 text-center">
            <div class="col-md-12">
              <p>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;
                <script
                  data-cfasync="false"
                  src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"
                ></script>
                <script>
                  document.write(new Date().getFullYear());
                </script>
                All rights reserved | This template is made with
                <i class="icon-heart" aria-hidden="true"></i> by
                <a
                  href="https://colorlib.com"
                  target="_blank"
                  class="text-primary"
                  >Colorlib</a
                >
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              </p>
            </div>
          </div>
        </div>
      </footer>
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









