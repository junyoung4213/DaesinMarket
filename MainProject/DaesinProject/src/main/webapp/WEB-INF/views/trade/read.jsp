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
							<c:if test="${readContentBean.bMno == member.mNo}">
								<button class="btn btn-warning" onclick="complete();">완료하기</button>
							</c:if>
							<c:if test="${readContentBean.bMno != member.mNo }">
								<button class="btn btn-danger" onclick="cancel();">취소하기</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<!-- 댓글 구현부 
			<div class="container col-md-12">
				<form id="commentForm" name="commentForm" method="post">
					<br> <br>
					<div>
						<div>
							<span><strong>신청자수</strong></span> <span id="cCnt"></span>명
						</div>
						<div>
							<table class="table">
								<tr>
									<td><textarea class="col-md-12" rows="3" cols="30"
											id="coMsg" name="coMsg" placeholder="한마디를 입력하세요"></textarea>
										<br>
										<div class="card">
											<button type="button" onClick="request()"
												class="btn btn-success">신청하기</button>
										</div></td>
								</tr>
							</table>
						</div>
					</div>
					<input type="hidden" id="coBno" name="coBno"
						value="${readContentBean.bNo }" /> <input type="hidden"
						id="coSno" name="coSno" value="${member.mNo}" /> <input
						type="hidden" id="coDate" name="coDate" value="" /> <input
						type="hidden" id="bMno" name="bMno"
						value="${readContentBean.bMno }" /> <input type="hidden" id="cnt"
						name="cnt" value="" />
				</form>
			</div>
			<div class="container text-center">
				<form id="commentListForm" name="commentListForm" method="post">
					<div id="commentList"></div>
				</form>
			</div>

			<div id="commentPart" class="d-none d-md-block"></div>
			 -->


		</div>
	</div>

</div>
<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

<script>

	
	
	function complete(){
		
		
		var result = confirm("정말 완료하시겠습니까?");
		var bno = ${readContentBean.bNo};
		var tReward = ${readContentBean.bReward};
		if(result==true){
		$.ajax({
			type : 'POST',
			url : "<c:url value='/trade/complete'/>",
			data : {tBno : bno,
					tReward : tReward},
			success : function(data) {
				if (data == "success") {
					alert("의뢰가 성공적으로 완료되었습니다.");
					location.href="${root}main"
				}else if(data == "fail"){
					alert("에러)의뢰가 완료되지 못했습니다");
				}
			},
			error : function(request, status, error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		});
		}
		
	}
	
	function cancel(){
		var result = confirm("정말 취소하시겠습니까?");
		var mNo = ${readContentBean.bMno};
		var tReward = ${readContentBean.bReward};
		var tBno = ${readContentBean.bNo};
		if(result==true){
		$.ajax({
			type : 'POST',
			url : "<c:url value='/trade/cancel'/>",
			data : {mNo : mNo,
				tReward : tReward,
				tBno : tBno},
			success : function(data) {
				if (data == "success") {
					alert("맡은 의뢰가 정상적으로 취소되었습니다.");
					location.href="${root}main"
				}
			},
			error : function(request, status, error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		});
		}
	}

</script>
</body>
</html>