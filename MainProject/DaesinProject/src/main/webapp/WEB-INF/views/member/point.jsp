<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />


<c:import url="/WEB-INF/views/include/top_menu.jsp" />


<div class="bg-light py-3">
	<div class="container" style="padding-top:240px">
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">포인트 충전</strong>
			</div>
		</div>
	</div>
</div>

<div class="site-section" data-aos="fade">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<h2 class="h1 mb-3 text-black">포인트 충전</h2>
			</div>
			<div class="card shadow col-md-5">
				<div class="card-body">
					
						<div class="form-group">
							<label for="mPoint">충전할 포인트를 입력해주세요</label>
							<div class="input-group">
								<input id="mPoint" name="mPoint" class="form-control"/>
							</div>
						</div>
			

						<div class="form-group">
							<div class="text-center">
								<button class="btn btn-primary" onclick="point();">포인트 충전</button>
							</div>
						</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
<script>
function point(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp06686127');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
	pg: 'kakaopay', // version 1.1.0부터 지원.
	/*
	'kakao':카카오페이,
	html5_inicis':이니시스(웹표준결제)
	'nice':나이스페이
	'jtnet':제이티넷
	'uplus':LG유플러스
	'danal':다날
	'payco':페이코
	'syrup':시럽페이
	'paypal':페이팔
	*/
	pay_method: 'card',
	/*
	'samsung':삼성페이,
	'card':신용카드,
	'trans':실시간계좌이체,
	'vbank':가상계좌,
	'phone':휴대폰소액결제
	*/
	merchant_uid: 'merchant_' + new Date().getTime(),
	
	name: '주문명:결제테스트',
	//결제창에서 보여질 이름
	amount: $('#mPoint').val(),
	//가격
	buyer_name: '아이디: ${member.mId}',
	buyer_email: '이메일: ${member.mEmail}'
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	*/
	}, function (rsp) {
	console.log(rsp);
	if (rsp.success) {
	location.href="${root}payment/success?amount="+rsp.paid_amount+"&mNo="+${member.mNo};
	} else {
	var msg = '포인트 충전에 실패했습니다. 고객센터로 문의해주세요.';
	msg += '에러내용 : ' + rsp.error_msg;
	alert(msg);
	
	
	}
	
	});

};
</script>
</body>
</html>









