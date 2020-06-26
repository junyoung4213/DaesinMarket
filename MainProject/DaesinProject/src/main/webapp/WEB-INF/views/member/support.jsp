<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<div class="bg-light py-3">
	<div class="container" style="padding-top:200px">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <span
					class="text-black">Contact</span> <span class="mx-2 mb-0">/</span>
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
				<form:form id="sup" action="${root}member/support_pro" method="post" modelAttribute="tempSupporterBean">
					<form:hidden path="mNo" value="${member.mNo}" />
					<div class="p-3 p-lg-5 border">
						<div class="form-group row">
							<div class="col-md-6">
								<form:label path="sFname" class="text-black">성</form:label>
								<span class="text-danger">*</span>
								<form:input path="sFname" class="form-control" />
							</div>
							<div class="col-md-6">
								<form:label path="sLname" class="text-black">이름</form:label>
								<span class="text-danger">*</span>
								<form:input path="sLname" class="form-control" />
							</div>
						</div>
						<div class="forn-group">
							<div class="form-group row col-md-12 mb-3 m-0 p-0">
									<form:label path="sPhone" class="text-black">전화번호</form:label>
									<span class="text-danger">*</span>
								<div class="input-group \">
									<form:input path="sPhone" class="form-control" placeholder="'-'를 뺀 번호를 입력해주세요" />
									<div class="input-group-append">
									<button type="button" class="btn btn-primary"
										onclick="smsAuthBtn();" id="sms_AuthBtn">인증하기</button>
								</div>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<form:label path="certification">인증번호</form:label>
							<div class="input-group">
								<form:input path="certification" class="form-control" placeholder="인증번호를 입력해주세요" />
							</div>
						</div>

						<div class="form-group row">
							<div class="col-lg-12 mt-4 text-center">
								<form:button type="button" class="btn btn-primary btn-lg btn-clock" onclick="cert();">제출하기</form:button>
							</div>
						</div>
					</div>
				</form:form>
				<input type="hidden" id="randomVal" value=""/>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

<script>
	
function cert() {
    var random = Math.floor(Math.random() * 1000000)+"";
    var phone = $('#sPhone').val();
    console.log(phone);
    $('#randomVal').val(random);
    console.log(random);
	var obj = {
			"type" : "SMS",
			"contentType" : "COMM",
			"from" : "01094750503",
			"subject" : "대신마켓 가입 본인인증 문자입니다",
			"countryCode" : "82",
			"content" : random,
			"messages" : [ {
				"to" : phone,
				"subject" : "대신마켓 인증 문자",
				"content" : "회원님의 인증번호는 [" + random +"] 입니다."
			} ]
		};
	
	$.ajax({
		type : 'POST',
		url : "/DaesinProject/supporter/sms",
		dataType : "json",
		data :  JSON.stringify(obj),
		contentType: "application/json",
		success : function(data) {
			if(data.statusName == "success"){
					alert("인증 문자가 성공적으로 전송되었습니다!");
			}
		}
	});
}

function smsAuthBtn() {
	
	var userVal = $('#certification').val();
	var certVal = $('#randomVal').val();
	
	if(userVal == certVal){
		$.ajax({
			type : "post",
			url : "/DaesinProject/member/support_pro",
			data : $('#sup').serialize(),
			complete : function(data) {
				alert("서포터 등록에 성공하셨습니다!");
				location.href="${root}main"
			}
		});
	}else{
		alert("인증번호를 다시 확인해주세요")
	}
	
	
};
	
</script>
</body>
</html>
