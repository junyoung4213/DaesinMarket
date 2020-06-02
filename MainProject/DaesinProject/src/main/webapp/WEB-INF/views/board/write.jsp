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

<script>
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup() {
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("${root}popup/jusoPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadAddrPart1, addrDetail) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		$('#bAddr1').val(roadAddrPart1.substring(0,addrDetail.length));
		$('#bAddr2').val(roadAddrPart1.substring(addrDetail.length+2,roadAddrPart1.length));
		var list = roadAddrPart1.split(" ");
		$('#bAddr3').val(list[0] +" "+ list[1])
	}
</script>


<c:import url="/WEB-INF/views/include/top_menu.jsp" />


<div class="bg-light py-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <a
					href="${root }board/main">Request</a> <span class="mx-2 mb-0">/</span>
				<strong class="text-black">배달</strong>
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
				<br /> <br />
			</div>
			<div class="card shadow">
				<div class="card-body">
					<form:form action="${root }board/write_pro" method="post"
						modelAttribute="writeContentBean" enctype="multipart/form-data">
						<form:hidden path="bCno" value="${bCno }" />
						<form:hidden path="bMno" value="${member.mNo }" />
						<div class="form-group">
							<form:label path="bTitle">제목</form:label>
							<form:input path="bTitle" class="form-control" />
						</div>
						<div class="form-group">
							<form:label path="bContent">내용</form:label>
							<form:textarea path="bContent" class="form-control" rows="10"
								style="resize: none;"></form:textarea>
						</div>
						<div class="form-group">
							<form:label path="biName">첨부이미지</form:label>
							<form:input type="file" path="upload_file" class="form-control"
								accept="image/*" />
						</div>
						<div class="form-group">
							<form:label path="bReward">금액</form:label>
							<form:input path="bReward" class="form-control" />
						</div>
						<div class="form-group">
							<form:label path="bAddr1">주소</form:label>
							<div class="input-group">
								<form:input path="bAddr1" class="form-control"
									placeholder="Enter Addr" required="true" readonly="true" />
								<div class="input-group-append">
									<form:button type="button" class="btn btn-primary"
										onclick="goPopup();">주소검색</form:button>
								<input type="hidden" id="confmKey" name="confmKey" value="">
								</div>
							</div>
						</div>
						<div class="form-group">
							<form:label path="bAddr2">상세주소</form:label>
							<form:input path="bAddr2" class="form-control"
								placeholder="상세주소" required="true" readonly="true" />
						</div>
						
						<form:hidden path="bAddr3" value=""/>
						
						<div class="form-group">
							<form:label path="bEndTime">마감기간</form:label>
							<form:input type="date" path="bEndTime" class="form-control" />
						</div>
						<div class="form-group">
							<div class="text-center">
								<form:button class="btn btn-primary">작성하기</form:button>
							</div>
						</div>
					</form:form>
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

