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
				<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <a
					href="${root }board/main">Request</a> <span class="mx-2 mb-0">/</span>
				<strong class="text-black">거래 페이지</strong>
			</div>
		</div>
	</div>
</div>

<div class="container" style="margin-top: 100px">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6 mb-5">
			<div class="col-lg-12 text-center">
				<h1 class="text-black">${readContentBean.bTitle}</h1>
				<br />
				<div class="border-bottom"></div>
				<br /> <br />
			</div>
			<div class="card shadow">
				<div class="card-body">
				<c:if test="${member.mId == readContentBean.mId }">
				<input type="hidden" id="receiver" value="${sId }"/>
				</c:if>
				<c:if test="${member.mId != readContentBean.mId }">
				<input type="hidden" id="receiver" value="${readContentBean.mId}"/>
				</c:if>
				<input type="hidden" id="caller" value="${member.mId}"/>
					<div class="form-group">
						<label for="bTitle">제목</label>
						<input type="text" id="bTitle" name="bTitle" class="form-control"
							value="${readContentBean.bTitle }" disabled="disabled" />
					</div>

					<div class="form-group">
						<label for="bContent">내용</label>
						<textarea id="bContent" name="bContent" class="form-control"
							rows="10" style="resize: none" disabled="disabled">${readContentBean.bContent }</textarea>
					</div>

					<c:if test="${readContentBean.biName != null}">
						<div class="form-group">
							<label for="upload_file">첨부 이미지</label>
							<img alt="첨부 이미지" src="${root }upload/${readContentBean.biName}"
								width="100%">
						</div>
					</c:if>

					<div class="form-group">
						<label for="bReward">금액</label>
						<input type="text" id="bReward" name="bReward"
							class="form-control" value="${readContentBean.bReward }"
							disabled="disabled" />
					</div>

					<div class="form-group">
						<label for="bAddr1">주소</label>
						<input type="text" id="bAddr1" name="bAddr1" class="form-control"
							value="${readContentBean.bAddr1 }" disabled="disabled" />
					</div>

					<div class="form-group">
						<label for="bAddr2">상세주소</label>
						<input type="text" id="bAddr2" name="bAddr2" class="form-control"
							value="${readContentBean.bAddr2 }" disabled="disabled" />
					</div>

					<div class="form-group">
						<label for="b_write_time">작성시간</label>
						<input type="text" id="b_write_time" name="b_write_time"
							class="form-control" value="${readContentBean.bWriteTime }"
							disabled="disabled" />
					</div>

					<div class="form-group">
						<label for="b_end_time">마감시간</label>
						<input type="text" id="b_end_time" name="b_end_time"
							class="form-control" value="${readContentBean.bEndTime }"
							disabled="disabled" />
					</div>

					<div class="form-group">
						<div class="text-center">
								<button class="btn btn-warning" onclick="complete();">완료하기</button>
								<button class="btn btn-danger" onclick="cancel();">취소하기</button>
								<button class="btn btn-danger" onclick="report();">문의하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="map" style="width:500px;height:400px;"></div>
</div>
<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

<script>
	var caller = $('#caller').val();
	var receiver = $('#receiver').val();
	
	/* 소켓통신 */
	function saveAlarm(caller, receiver, status, callback){
	var ws = new WebSocket("ws://localhost:8765/DaesinProject/echo");
	var boardNum = ${readContentBean.bNo };
	var socketMsg = "";
	var msg="";
	console.log("콜러 : " + caller);
	console.log("리시버: " + receiver);
	console.log("게시물번호 : " + boardNum);
	
	msg = caller + "님이 " + boardNum + "번 의뢰글에 "+ status+ " 버튼을 누르셨습니다.";
	socketMsg = "reply," + receiver +"," + msg;

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
				callback();
		},
		error : function(err){
			console.log(err);
		}
	});
	};
	/* 소켓통신 */


	function complete() {

		var result = confirm("정말 완료하시겠습니까?");
		var mNo = ${member.mNo};
		var bno = ${readContentBean.bNo};
		var tReward = ${readContentBean.bReward};
		if (result == true) {
			$.ajax({
				type : 'POST',
				url : "<c:url value='/trade/complete'/>",
				data : {
					mNo : mNo,
					tBno : bno,
					tReward : tReward
				},
				success : function(data) {
					if (data == "success") {
						alert("의뢰 완료 요청을 전송했습니다.");
						saveAlarm(caller,receiver,"완료");
					} else if (data == "fail") {
						alert("에러)의뢰가 완료되지 못했습니다");
					} else if (data == "different"){
						alert("거래 상대방이 취소 버튼을 누른 상태입니다. 문제시 고객센터로 문의해주세요.");
					} else if (data == "complete"){
						alert("의뢰가 성공적으로 완료되었습니다.");
						saveAlarm(caller,receiver,"완료",function(){
						location.href = "${root}main";
						});
					}
				},
				error : function(request, status, error) {
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}

			});
		}

	}

	function cancel() {
		var result = confirm("정말 취소하시겠습니까?");
		var mNo = ${member.mNo};
		var tReward = ${readContentBean.bReward};
		var tBno = ${readContentBean.bNo};
		if (result == true) {
			$.ajax({
				type : 'POST',
				url : "<c:url value='/trade/cancel'/>",
				data : {
					mNo : mNo,
					tReward : tReward,
					tBno : tBno
				},
				success : function(data) {
					if (data == "success") {
						alert("의뢰 취소 요청을 전송했습니다.");
						saveAlarm(caller,receiver,"취소");
					}else if (data == "fail") {
						alert("에러)의뢰가 취소되지 못했습니다");
					}else if (data == "different"){
						alert("거래 상대방이 완료 버튼을 누른 상태입니다. 문제시 고객센터로 문의해주세요.")
					}else if (data == "complete"){
						alert("의뢰가 성공적으로 취소되었습니다.");
						saveAlarm(caller,receiver,"취소");
						location.href = "${root}main";
					}
				},
				error : function(request, status, error) {
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}

			});
		}
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	var loc = $('#bAddr1').val();
	
	if(loc!=""){
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(loc, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">목적지</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	
	}else{
		$('#map').remove();
	}
	
	function report() {
		var report = prompt("문의내용을 적어주세요","문의 내용");
		if(report==null){
			alert("요청이 취소되었습니다");
		}else{
		$.ajax({
			type : 'POST',
			url : "<c:url value='/board/report.do?bNo="+${bNo}+"'/>",
			data : {report : report},
			success : function(data) {
				if (data == "success") {
					alert("신고내용이 성공적으로 접수되었습니다");
				}
			}
		});
		}
	};
	
</script>
</body>
</html>
