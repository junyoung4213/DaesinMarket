<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html>
<html lang="en">
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

<link rel="stylesheet" href="${root }css/style.css" />
</head>

<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<div class="bg-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-12 mb-0">
					<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <a
						href="${root }board/main">Request</a> <span class="mx-2 mb-0">/</span> <strong
						class="text-black">배달</strong>
				</div>
			</div>
		</div>
	</div>
	
      <div class="container" style="margin-top: 100px;">
        <div class="row">
          <div class="col-sm-3"></div>
          <div class="col-sm-6 mb-5">
            <div class="col-md-12 text-center">
              <h1 class="mb-3 text-black">글쓰기</h1>
              <br />
              <div class="border-bottom"></div>
              <br /><br />
            </div>
            <div class="card shadow">
              <div class="card-body">
                <form action="board_read.html" method="post">
                  <div class="form-group">
                    <label for="board_subject">제목</label>
                    <input
                      type="text"
                      id="board_subject"
                      name="board_subject"
                      class="form-control"
                    />
                  </div>
                  <div class="form-group">
                    <label for="board_content">내용</label>
                    <textarea
                      id="board_content"
                      name="board_content"
                      class="form-control"
                      rows="10"
                      style="resize: none;"
                    ></textarea>
                  </div>
                  <div class="form-group">
                    <label for="board_file">첨부 이미지</label>
                    <input
                      type="file"
                      id="board_file"
                      name="board_file"
                      class="form-control"
                      accept="image/*"
                    />
                  </div>
                  <div class="form-group">
                    <label for="board_reward">리워드</label>
                    <input
                      type="text"
                      id="board_reward"
                      name="board_reward"
                      class="form-control"
                    />
                  </div>
                  <!-- <div class="form-group">
                    <label for="board_reward">마감기간</label>
                    <input
                      type="date"
                      id="board_reward"
                      name="board_reward"
                      class="form-control"
                    />
                  </div> -->
                  <div class="form-group">
                    <div class="text-right">
                      <button type="submit" class="btn btn-primary">
                        작성하기
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

