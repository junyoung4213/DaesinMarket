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
				<strong class="text-black">${cName }</strong>
			</div>
		</div>
	</div>
</div>

<div class="container" style="margin-top: 100px">
	<div class="row">
		<div class="col-lg-12 mb-5">
			<div class="col-lg-12 text-center">
				<h1 class="text-black">${cName }의뢰</h1>
				<br />
				<div class="border-bottom"></div>
				<br /> <br />
			</div>
			<div class="container card shadow col-md-6">
				<div class="card-body">
					<input type="hidden" id="receiver" value="${readContentBean.mId}" />
					<input type="hidden" id="caller" value="${member.mId}" />
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
							<a
								href="${root }board/main?bCno=${readContentBean.bCno}&page=${page}"
								class="btn btn-primary">목록보기</a>
							<c:if test="${readContentBean.bMno == member.mNo}">
								<a
									href="${root }board/modify?bCno=${readContentBean.bCno }&bNo=${bNo}&page=${page}"
									class="btn btn-info">수정하기</a>
								<button class="btn btn-warning" onclick="deletePopup();">삭제하기</button>
							</c:if>
							<c:if test="${readContentBean.bMno != member.mNo and member != null }">
								<button class="btn btn-danger" onclick="report();">신고하기</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<!-- 댓글 구현부  -->
			<c:if test="${member != null }">
			<div class="container col-md-6">
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
											<button type="button" onClick="request();"
												class="btn btn-success">신청하기</button>
										</div></td>
								</tr>
							</table>
						</div>
					</div>
					<input type="hidden" id="coBno" name="coBno"
						value="${readContentBean.bNo }" />
					<input type="hidden" id="coDate" name="coDate" value="" />
					<input type="hidden" id="bMno" name="bMno"
						value="${readContentBean.bMno }" />
					<input type="hidden" id="cnt" name="cnt" value="" />
					<input type="hidden" id="coSno" name="coSno" value="${member.mNo}" />
				</form>
			</div>
			<div class="container col-md-6 text-center">
				<form id="commentListForm" name="commentListForm" method="post">
					<div id="commentList"></div>
				</form>
			</div>
			</c:if>
			<!-- //댓글 구현부 -->

			<div id="commentPart" class="d-none d-md-block"></div>



		</div>
	</div>

</div>
<c:import url="/WEB-INF/views/include/bottom_info.jsp" />


<script>



	var deletePopup = function() {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.href = "delete?bCno=${readContentBean.bCno}&bNo=${bNo}&bReward=${readContentBean.bReward}&mNo=${member.mNo}";
		}
	};
	
	function report() {
		var report = prompt("신고내용을 적어주세요","신고 내용");
		if(report==null){
			alert("신고요청이 취소되었습니다");
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
	
	function request(){
		var result = confirm("정말 신청하시겠습니까?");
		
		if(result==true){
			fn_comment();
		}
	};
	
	function accept(co_sno,co_id){
		var result = confirm("정말 수락하시겠습니까?");
		var bno = ${readContentBean.bNo};
		var cno = ${readContentBean.bCno};
		var mno = ${readContentBean.bMno};
		var caller = $('#caller').val();
		var receiver = co_id;
		if(result==true){
		$.ajax({
			type : 'POST',
			url : "<c:url value='/trade/add'/>",
			data : {tSno : co_sno,
					tBno : bno,
					mNo : mno},
			success : function(data) {
				if (data == "success") {
					alert("서포터와 매칭에 성공하셨습니다");
					saveAlarm(caller,receiver);
				}else if(data == "fail"){
					alert("서포터와의 매칭에 실패하셨습니다");
				}
			},
			error : function(request, status, error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		})
		}
	};
	
	function del(coNum){
		
		
		var result = confirm("정말 취소하시겠습니까?");
		
		if(result==true){
		$.ajax({
			type : 'POST',
			url : "<c:url value='/board/delete.do'/>",
			data : {coNum : coNum},
			success : function(data) {
				if (data == "success") {
					alert("신청이 정상적으로 취소되었습니다.");
					getCommentList(1);
				}
			},
			error : function(request, status, error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		});
		}
	};
	
	/**
	 * 초기 페이지 로딩시 댓글 불러오기
	 */
	$(function() {
		
		getCommentList(1);

	});
	
	/* 소켓통신 */
	function saveAlarm(caller, receiver){
	var ws = new WebSocket("ws://localhost:8765/DaesinProject/echo");
	var boardNum = ${readContentBean.bNo };
	var socketMsg = "";
	var msg="";
	console.log("콜러 : " + caller)
	console.log("리시버: " + receiver)
	console.log("게시물번호 : " + boardNum)
	
	if(receiver == $('#receiver').val()){
		msg = caller + "님이 " +"<a type='external' href='/DaesinProject/board/read?bNo=" +  boardNum + "'>" +boardNum+ "번 게시글에 댓글을 남겼습니다.";
		socketMsg = "reply," + receiver +"," + msg;
		}else{
		msg= caller + "님이 " + receiver + " 님의 신청을 수락했습니다."
		socketMsg = "accept," + receiver + "," + msg;
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


	/*
	 * 댓글 등록하기(Ajax)
	 */
	function fn_comment() {
		
		if(${readContentBean.bMno == member.mNo}){
			alert("본인 글에는 본인이 신청할 수 없습니다.");
		}else{
		var today = new Date();
		var cnt = (Number($('#cCnt').text()) + 1); 
		var lastPage = Math.floor(cnt/10);
		var caller = $('#caller').val();
		var receiver = $('#receiver').val();
		if (cnt%10 > 0) {
			lastPage++;
		}
		$('#coDate').val(today.toLocaleString());
		$.ajax({
			type : 'POST',
			url : "<c:url value='/board/addComment.do'/>",
			data : $("#commentForm").serialize(),
			success : function(data) {
				if (data == "success") {
					alert("신청에 성공하셨습니다");
					getCommentList(lastPage);
					$("#coMsg").val("");
					saveAlarm(caller,receiver);
				}
			},
			error : function(request, status, error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		});
		}
	};
	

	/**
	 * 댓글 불러오기(Ajax)
	 */
	function getCommentList(x) {
		
		var status =${readContentBean.bStatus};
		$.ajax({
					type : 'GET',
					url : "<c:url value='/board/commentList.do?cPage="+ x + "'/>",
					dataType : "json",
					data : $("#commentForm").serialize(),
					success : function(data) {
						var html = "";
						var cCnt = 0;
						var comment = "";

						if (data.length > 0) {
							
							$.each(data, function(key, value){ 
								
								if(value.co_id!=null ){
								
								html += "<div class='card shadow m-2 p-3 row' style='text-align:left'>";
								html += "<div>";
								html += "<h6>아이디 : " + value.co_id + "<br>";
								html += "<p>내용 : " + value.co_msg + "</p><br>";
								html += value.co_date + "</h6>";
								html += "</div>";
								
								if(status==0){
								if(${readContentBean.bMno == member.mNo}){
									html += "<div class='text-center card'>";
									html += "<button type='button' class='btn btn-primary' onclick='accept("+"\""+value.co_sno+"\",\""+value.co_id+"\""+");'>수락하기</button>";
									html += "</div>";
								}else if(value.co_sno == ${member.mNo}){
									html += "<div class='text-center card'>";
									html += "<button type='button' class='btn btn-danger' onclick='del("+value.co_num+");'>취소하기</button>";
									html += "</div>";
								}
								};
								
								html+="</div>";
								}
								
								
				            });
							
							$.each(data[0], function(key, value){
								cCnt = value.contentCnt;
								comment+= '<ul class="pagination justify-content-center">';
								
								if(value.prevPage<=0){
									comment += '<li class="page-item disabled"><a href="#" class="page-link">이전</a></li>';
								}else{
									comment += '<li class="page-item"><a onclick="getCommentList('+value.prevPage+');" class="page-link">이전</a></li>';
								}
								
								for(var i=value.min; i<=value.max;i++){
									if(value.currentPage==i){
										comment+='<li class="page-item active"><a onclick="getCommentList('+i+');" class="page-link">'+i+'</a></li>';
									}else{
										comment+='<li class="page-item"><a onclick="getCommentList('+i+');" class="page-link">'+i+'</a></li>';
									}
								}
								
								if(value.max >= value.pageCnt){
									comment+='<li class="page-item disabled"><a href="#" class="page-link">다음</a></li>';
								}else{
									comment+='<li class="page-item"><a onclick="getCommentList('+value.nextPage+');" class="page-link">다음</a></li>';
								}
								
								comment+='</ul>';
								
							});

						} else {
							html += "<div><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
							html += "</div>";
						}
						
						
						
						
						$("#cCnt").html(cCnt);
						/* $("#cnt").val(cCnt); */
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
