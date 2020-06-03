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
				<strong class="text-black">${cName }</strong>
			</div>
		</div>
	</div>
</div>

<div class="container" style="margin-top: 100px">
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6 mb-5">
			<div class="col-lg-12 text-center">
				<h1 class="text-black">${cName }의뢰</h1>
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
							<a href="${root }board/main?bCno=${bCno}&page=${page}"
								class="btn btn-primary">목록보기</a> <a
								href="${root }board/modify?bCno=${bCno }&bNo=${bNo}&page=${page}"
								class="btn btn-info">수정하기</a>
							<button class="btn btn-warning" onclick="deletePopup();">삭제하기</button>
							<a href="${root }board/report" class="btn btn-danger">신고하기</a>
						</div>
					</div>
				</div>
			</div>

			<!-- 댓글 구현부  -->
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
						value="${readContentBean.bNo }" />
					<input type="hidden" id="coSno" name="coSno" value="${member.mNo}" />
					<input type="hidden" id="coDate" name="coDate" value="" />
				</form>
			</div>
			<div class="container text-center">
				<form id="commentListForm" name="commentListForm" method="post">
					<div id="commentList"></div>
				</form>
			</div>
			<!-- //댓글 구현부 -->

			<div id="commentPart" class="d-none d-md-block">
				<%-- <ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageBean.prevPage <=0 }">
							<li class="page-item disabled"><a href="#" class="page-link">이전</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a onclick="getCommentList(${pageBean.prevPage});"
								class="page-link">이전</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="idx" begin="${pageBean.min }"
						end="${pageBean.max }">
						<c:choose>
							<c:when test="${idx==pageBean.currentPage }">
								<li class="page-item active"><a
									onclick="getCommentList(${idx});"
									class="page-link">${idx }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									onclick="getCommentList(${idx});"
									class="page-link">${idx }</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					<c:choose>
						<c:when test="${pageBean.max >= pageBean.pageCnt }">
							<li class="page-item disabled"><a href="#" class="page-link">다음</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a onclick="getCommentList(${pageBean.nextPage});"
								class="page-link">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul> --%>
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
<script>
	var deletePopup = function() {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.href = "delete?bCno=${bCno}&bNo=${bNo}"
		}
	}
	
	function request(){
		var result = confirm("정말 신청하시겠습니까?");
		
		if(result==true){
			fn_comment();
		}
	}
	
	/**
	 * 초기 페이지 로딩시 댓글 불러오기
	 */
	$(function() {
		
		getCommentList(1);

	});


	/*
	 * 댓글 등록하기(Ajax)
	 */
	function fn_comment() {
		var today = new Date();
		$('#coDate').val(today.toLocaleString())
		$.ajax({
			type : 'POST',
			url : "<c:url value='/board/addComment.do'/>",
			data : $("#commentForm").serialize(),
			success : function(data) {
				if (data == "success") {
					getCommentList(1);
					$("#coMsg").val("");
				}
			},
			error : function(request, status, error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		});
	}


	/**
	 * 댓글 불러오기(Ajax)
	 */
	function getCommentList(x) {
		$.ajax({
					type : 'GET',
					url : "<c:url value='/board/commentList.do?cPage="+ x + "'/>",
					dataType : "json",
					data : $("#commentForm").serialize(),
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {
						var html = "";
						var cCnt = "0";
						var comment = "";

						if (data.length > 0) {
							
							$.each(data, function(key, value){ 
								
								if(value.co_name!=null ){
								
								if(value.co_sno == ${member.mNo} || ${readContentBean.bMno == member.mNo} ){
								html += "<div class='card shadow m-2 p-3 row' style='text-align:left'>"
								html += "<div>"
								html += "<h6>이름 : " + value.co_name + "<br>";
								html += "<p>내용 : " + value.co_msg + "</p><br>";
								html += value.co_date + "</h6>";
								html += "</div>"
								
								}
								
								if(${readContentBean.bMno == member.mNo}){
									html += "<div class='text-center'>";
									html += "<button type='button' class='btn btn-primary mr-3'>수락하기</button>";
									html += "<button type='button' class='btn btn-danger'>거절하기</button>";
									html += "</div>";
									html += "</div>";
								}else if(value.co_sno == ${member.mNo}){
									html += "<div class='text-center'>";
									html += "<button type='button' class='btn btn-primary mr-3'>수정하기</button>";
									html += "<button type='button' class='btn btn-danger'>취소하기</button>";
									html += "</div>";
									html += "</div>";
								}
								}
								
								
				            });
							
							$.each(data[0], function(key, value){
								cCnt = value.contentCnt;
								console.log(cCnt);
								comment+= '<ul class="pagination justify-content-center">';
								
								if(value.prevPage<=0){
									comment += '<li class="page-item disabled"><a href="#" class="page-link">이전</a></li>';
								}else{
									comment += '<li class="page-item"><a onclick="getCommentList('+value.prevPage+');" class="page-link">이전</a></li>'
								}
								
								for(var i=value.min; i<=value.max;i++){
									if(value.currentPage==i){
										comment+='<li class="page-item active"><a onclick="getCommentList('+i+');" class="page-link">'+i+'</a></li>'
									}else{
										comment+='<li class="page-item"><a onclick="getCommentList('+i+');" class="page-link">'+i+'</a></li>'
									}
								}
								
								if(value.max >= value.pageCnt){
									comment+='<li class="page-item disabled"><a href="#" class="page-link">다음</a></li>'
								}else{
									comment+='<li class="page-item"><a onclick="getCommentList('+value.nextPage+');" class="page-link">다음</a></li>'
								}
								
								comment+='</ul>'
								
							});

						} else {
							html += "<div><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
							html += "</div>";
						}
						
						
						
						
						$("#cCnt").html(cCnt);
						$("#commentList").html(html);
						$("#commentPart").html(comment);

					},
					error : function(request, status, error) {

					}

				});

	}
	
</script>
</body>
</html>
