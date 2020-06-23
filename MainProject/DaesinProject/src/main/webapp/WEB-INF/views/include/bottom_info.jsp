<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

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
							<li><a href="${root }main">HOME</a></li>
							<li><a href="${root }member/about">ABOUT</a></li>
							<li><a href="${root}member/support">서포터 신청하기</a></li>
							<li><a href="${root}member/faq">문의하기</a></li>


						</ul>
					</div>
					<div class="col-md-6 col-lg-4">
						<ul class="list-unstyled">
							<li><a href="${root }board/main?bCno=1">배달</a></li>
							<li><a href="${root }board/main?bCno=2">쇼핑</a></li>
							<li><a href="${root }board/main?bCno=3">단순작업</a></li>
							<li><a href="${root }board/main?bCno=4">역할 대행</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-3 text-center">
				<div class="block-5 mb-5 mb-lg-0">
					<h3 class="footer-heading mb-4">Contact Info</h3>
					<ul class="list-unstyled">
						<li class="address">서울시 종로구 12-34 대신빌딩</li>
						<li class="phone"><a href="tel://0212128272">02 1212 8272</a>
						</li>
						<li class="email">Daesin@gmail.com</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- <div class="row pt-5 mt-5 text-center">
			<div class="col-md-12">
				<p>
					Copyright &copy;
					
					<script>
						document.write(new Date().getFullYear());
					</script>
					
				</p>
			</div>
		</div> -->
	</div>
</footer>
</div>

<script src="${root }js/jquery-3.3.1.min.js"></script>
<script src="${root }js/jquery-ui.js"></script>
<script src="${root }js/popper.min.js"></script>
<script src="${root }js/bootstrap.min.js"></script>
<script src="${root }js/owl.carousel.min.js"></script>
<script src="${root }js/jquery.magnific-popup.min.js"></script>
<script src="${root }js/aos.js"></script>
<script src="${root }js/main.js"></script>
<script src="${root }js/jquery.ajax-cross-origin.min.js"></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/hmac-sha256.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/enc-base64.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var ws = new WebSocket("ws://localhost:8765/DaesinProject/echo");
	$('document').ready(function(){
	function socket() {
		ws.onopen = function() {
			console.log('Info: connection opened.');
			if($('#memberId').val() != ""){
			var msg = "search," + $('#memberId').val() + ",알림메시지";
			console.log(msg);
			ws.send(msg);
			}
		};
		ws.onmessage = function(event) {
			console.log("메세지 : " + event.data);
			toastr.options = {
				"closeButton" : true,
				"debug" : false,
				"newestOnTop" : false,
				"preventDuplicates" : false,
				"onclick" : null,
				"showDuration" : "300",
				"showEasing" : "swing",
				"showMethod" : "fadeIn",
				"timeOut" : "0",
				"extendedTimeOut" : "0"
			}
			toastr.success(event.data, "알림", {
			});
		};
		ws.onclose = function(event) {
			console.log('Info: connection closed.');
		};
	}
	socket();
	
	function getPoint() {
		var mId = $('#memberId').val();
		if(mId != ""){
		$.ajax({
			type : 'GET',
			url : "${root}member/returnPoint/"+mId,
			success : function(data) {
				$('.memberPoint').html(data);
			}
		});
		}
	};
	
	getPoint();
	
	});
	
	/* 소켓통신 */
	function saveAlarm(caller, receiver,co_phone){
	var boardNum = "${readContentBean.bNo }";
	var socketMsg = "";
	var msg="";
	console.log("콜러 : " + caller)
	console.log("리시버: " + receiver)
	console.log("게시물번호 : " + boardNum)
	
	if(receiver == $('#receiver').val()){
		msg = caller + "님이 " +"<a type='external' href='/DaesinProject/board/read?bNo=" +  boardNum + "'>" +boardNum+ "번 게시글에 댓글을 남겼습니다.";
		socketMsg = "reply," + receiver +"," + msg;
		memberSms("회원님이 등록한 게시물에 신청이 들어왔습니다.")
		}else{
		msg= caller + "님이 " + receiver + " 님의 신청을 수락했습니다."
		socketMsg = "accept," + receiver + "," + msg;
		supporterSms(co_phone, "서포터님의 신청이 수락되었습니다");
		}
	// 댓글 알림 DB저장
	$.ajax({
		type : 'POST',
		url : "<c:url value='/alarm/save'/>",
		data : {
				receiver : receiver,
				caller : caller,
				boardNum : boardNum,
				msg : msg
		},
		success : function(data){
				console.log("msgmsg : " + socketMsg);
				ws.send(socketMsg);
		},
		error : function(err){
			console.log(err);
		}
	});
	};
	/* 소켓통신 */
	
	function memberSms(message) {
	    var phone = $('#bPhone').val();
	    console.log(phone);
		var obj = {
				"type" : "SMS",
				"contentType" : "COMM",
				"from" : "01094750503",
				"subject" : "[대신마켓] 안내 문자",
				"countryCode" : "82",
				"content" : message,
				"messages" : [ {
					"to" : phone,
					"subject" : "대신마켓 안내 문자",
					"content" : message
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
						console.log("전송 성공");
				}else if(data.statusName == "fail"){
						console.log("전송 실패");
				}
			}
		});
	}
	
	function supporterSms(co_phone, message) {
	    var phone = co_phone;
	    console.log(phone);
		var obj = {
				"type" : "SMS",
				"contentType" : "COMM",
				"from" : "01094750503",
				"subject" : "[대신마켓] 안내 문자",
				"countryCode" : "82",
				"content" : message,
				"messages" : [ {
					"to" : phone,
					"subject" : "대신마켓 안내 문자",
					"content" : message
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
						console.log("전송 성공");
				}else if(data.statusName == "fail"){
						console.log("전송 실패");
				}
			}
		});
	}

</script>

