<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DaesinMarket:로그인</title>
<link rel="stylesheet" href="${root }css/bootstrap.min.css" />
<link rel="stylesheet" href="${root }css/login.css" />
<link rel="stylesheet" href="${root }css/magnific-popup.css" />
<link rel="stylesheet" href="${root }css/jquery-ui.css" />
<link rel="stylesheet" href="${root }css/owl.carousel.min.css" />
<link rel="stylesheet" href="${root }css/owl.theme.default.min.css" />
<link rel="stylesheet" href="${root }css/aos.css" />
<link rel="stylesheet" href="${root }css/style.css" />
</head>
<body>
<div class="bgImage"></div>
<svg class="blobCont">
		<image xlink:href="https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?ixlib=rb-0.3.5&s=e20bc3d490c974d9ea190e05c47962f5&auto=format&fit=crop&w=634&q=80" mask="url(#mask)" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" />
      <defs>
      <filter id="gooey" height="130%">
				<feGaussianBlur in="SourceGraphic" stdDeviation="15" result="blur" />
				<feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
    	</filter>
    </defs>
			<mask id="mask" x="0" y="0">
				<g style="filter: url(#gooey)">
          <circle class="blob" cx="10%" cy="10%" r="80" fill="white" stroke="white"/>
					<circle class="blob" cx="50%" cy="10%" r="40" fill="white" stroke="white"/>
					<circle class="blob" cx="17%" cy="15%" r="70" fill="white" stroke="white"/>
					<circle class="blob" cx="90%" cy="20%" r="120" fill="white" stroke="white"/>
					<circle class="blob" cx="30%" cy="25%" r="30" fill="white" stroke="white"/>
          <circle class="blob" cx="50%" cy="60%" r="80" fill="white" stroke="white"/>
					<circle class="blob" cx="70%" cy="90%" r="10" fill="white" stroke="white"/>
					<circle class="blob" cx="90%" cy="60%" r="90" fill="white" stroke="white"/>
					<circle class="blob" cx="30%" cy="90%" r="80" fill="white" stroke="white"/>
          <circle class="blob" cx="10%" cy="10%" r="80" fill="white" stroke="white"/>
					<circle class="blob" cx="50%" cy="10%" r="20" fill="white" stroke="white"/>
					<circle class="blob" cx="17%" cy="15%" r="70" fill="white" stroke="white"/>
					<circle class="blob" cx="40%" cy="20%" r="120" fill="white" stroke="white"/>
					<circle class="blob" cx="30%" cy="25%" r="30" fill="white" stroke="white"/>
          <circle class="blob" cx="80%" cy="60%" r="80" fill="white" stroke="white"/>
					<circle class="blob" cx="17%" cy="10%" r="100" fill="white" stroke="white"/>
					<circle class="blob" cx="40%" cy="60%" r="90" fill="white" stroke="white"/>
					<circle class="blob" cx="10%" cy="50%" r="80" fill="white" stroke="white"/>
				</g>
			</mask>
	</svg>

	<header class="site-navbar" role="banner" style="background:none;">
			<div class="site-navbar-top" style="border-bottom:none;">
				<div class="container">
							<div class="site-logo col-md-12 text-center" style="font-size:30px">
								<a href="${root }main" class="js-logo-clone" style="background:white;">대신마켓</a>
							</div>
				</div>
			</div>
	</header>
			
	<div class="form__wrapper d-flex align-items-center min-vh-100">
		<div class="form">
			<div class="form__options">
				<div class="form__options__login">
					<div class="options__body">
						<h4 class="mb-4">회원이신가요?</h4>
						<a href="#" class="btn btn-light toggle-slide">로그인하기</a>
					</div>
				</div>
				<div class="form__options__signup">
					<h4 class="mb-4">아직 회원이 아니신가요?</h4>
					<a href="#" class="btn btn-light toggle-slide">회원가입하기</a> <small>1분이면 가입이 끝납니다!</small>
				</div>
			</div>
			<div class="form__background"></div>
			<div class="form__body">
				<form:form action="${root }member/login_pro" class="login col-md-4 mt-0"
					method="post" modelAttribute="tempLoginMemberBean">
					<h2 class="text-center mb-5">로그인</h2>
					<div class="form-group">
						<form:label path="mId" class="text-black">아이디</form:label>
						<form:input path="mId" class="form-control" />
					</div>
					<div class="form-group">
						<form:label path="mPw" class="text-black">비밀번호</form:label>
						<form:password path="mPw" class="form-control" />
					</div>
					
					<div class="row col-md-12 m-0 p-0 text-center">
					<div class="card btn2 col-md-6 mb-4 p-2" >
					<a href="${root }member/findId">아이디 찾기</a>
					</div>
					<div class="card btn2 col-md-6 mb-4 p-2">
					<a href="${root }member/findPw">비밀번호 찾기</a>
					</div>
					</div>
					
					<div class="form-group text-center">
					<input type="submit" class="btn btn-lg" value="로그인" name="login" id="login">
					</div>
				</form:form>
				<form:form class="sign-up col-md-4 mt-0" action="${root }member/join_pro"
					method="post" modelAttribute="joinMemberBean">
					<h2 class="text-center mb-4">회원가입</h2>
					<form:hidden path="memberIdExist" />
					<div class="form-group">
						<form:label path="mId2" >아이디</form:label>
						<div class="input-group">
							<form:input path="mId2" class="form-control"
								onkeypress="resetMemberIdExist()"/>
								<button type="button" class="btn"
									onclick="checkMemberIdExist()" style="border-radius:0px 5px 5px 0px; padding:10px 20px" id="">중복확인</button>
						</div>
					</div>
					<div class="form-group">
						<form:label path="mEmail">이메일 주소</form:label>
						<div class="input-group">
							<form:input path="mEmail" class="form-control" placeholder="ex)daesin@example.com" />
						</div>
					</div>
					<div class="form-group mb-4">
						<form:label path="mPw2">비밀번호</form:label>
						<form:password path="mPw2" class="form-control" />
					</div>
					<div class="form-group text-center">
					<input type="submit" class="btn" value="회원가입" name="signup" id="signup">
					</div>
				</form:form>
			</div>

		</div>
	</div>
	<script src="${root }js/jquery-3.3.1.min.js"></script>
	<script src="${root }js/jquery-ui.js"></script>
	<script src="${root }js/popper.min.js"></script>
	<script src="${root }js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
document.querySelectorAll('.toggle-slide').forEach(e => e.addEventListener('click', toggle));

/* document.querySelectorAll('form').forEach(f => f.addEventListener('submit', (e) => e.preventDefault()) ) */

function toggle(e) {
  e.preventDefault();
  document.querySelector('.form').classList.toggle('slide');
}

function checkMemberIdExist() {
	var mId = $("#mId2").val()
	var regId =/^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$/i;

	if (!regId.test(mId)) {
		swal("에러발생", "아이디는 영문+소문자 조합으로만 가능합니다", "error");
		return;
	}

	$.ajax({
		url : "${root}member/checkMemberIdExist/" + mId,
		type : "get",
		dataType : "text",
		success : function(result) {
			if (result.trim() == "true") {
				swal("성공", "사용할 수 있는 아이디입니다", "success");
				$("#memberIdExist").val("true")
			} else {
				swal("실패", "이미 사용중인 아이디입니다", "error");
				$("#memberIdExist").val("false")
			}
		}
	})
}
function resetMemberIdExist() {
	$("#memberIdExist").val("false")
}
	
	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
	 
	$('#mEmail').focusout(function(){
		if(!emailRule.test($('#mEmail').val())){
			swal("양식 오류", "이메일 주소를 양식대로 입력해주세요", "error").then(function(){
			$('#mEmail').focus();
			});
		}else{
			var m_email=$('#mEmail').val().trim();
			$.ajax({
				url : "${root}member/checkMemberEmailExist/" + m_email,
				type : "get",
				dataType : "text",
				success : function(result) {
					if (result.trim() == "true") {
						swal("중복확인 성공", "사용할 수 있는 이메일입니다", "success");
					} else {
						swal("중복확인 실패", "이미 사용중인 이메일입니다", "error");
					}
				}
			})
		}
	})
	
	$('#signup').on("click",function(e){
		var pwRule = /^[a-zA-Z0-9]{8,20}$/;
		if( $("#mId2").val() == ""){
			swal("실패", "아이디를 입력해주세요", "error");
			 e.preventDefault();
			 return;
		}
		
		if( $("#memberIdExist").val()=="false"){
			swal("실패", "아이디 중복확인을 해주세요", "error");
			 e.preventDefault();
			 return;
		}
		
		if( $("#mEmail").val()==""){
			swal("실패", "이메일 입력을 해주세요", "error");
			 e.preventDefault();
			 return;
		}
		
		console.log(pwRule.test($("#mPw2").val()));
		if( !pwRule.test($("#mPw2").val())){
			swal("실패", "비밀번호는 문자,숫자의 조합 8자~20자로 입력해주세요", "error");
			 e.preventDefault();
			 return;
		}
		
	})
	
	$('#login').on("click",function(e){
		if( $("#mId").val() == ""){
			swal("실패", "아이디를 입력해주세요", "error");
			e.preventDefault();
		    e.stopPropagation();
		    return;
		}
		if( $("#mPw").val() == ""){
			swal("실패", "비밀번호를 입력해주세요", "error");
			e.preventDefault();
		    e.stopPropagation();
		    return;
		}
	})
	
	
</script>
</body>
</html>