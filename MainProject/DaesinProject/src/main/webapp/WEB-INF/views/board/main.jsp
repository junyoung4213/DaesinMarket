<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<c:import url="/WEB-INF/views/include/top_menu.jsp" />


<div class="bg-light py-3">
	<c:if test="${member == null }">
	<div class="container" style="padding-top: 114.24px">
	</c:if>
	<c:if test="${member != null }">
	<div class="container" style="padding-top: 129.4px">
	</c:if>
		<div class="row">
			<div class="col-md-12 mb-0">
				<a href="${root }main">Home</a> <span class="mx-2 mb-0">/</span> <strong
					class="text-black">${cName }</strong>
			</div>
		</div>
	</div>
</div>

<!-- 게시글 리스트 -->

<div class="container mt-5">
	<div class="card shadow">
		<div class="card-body">
			<table class="table table-hover mb-5" id="board_list">
				<thead>
					<tr>
						<th class="text-center" width=10%>분류</th>
						<th class="text-center" width=10%>번호</th>
						<th class="text-center" width=40%>제목</th>
						<th class="text-center" width=10%>금액</th>
						<th class="text-center d-none d-md-table-cell" width=20%>지역</th>
						<th class="text-center d-none d-md-table-cell" width=10%>작성시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="obj" items="${boardList }">
						<tr>
							<td class="text-center">${obj.cName}</td>
							<td class="text-center">${obj.bNo }</td>
							<td class="text-center"><a
								href='${root }board/read?bNo=${obj.bNo}&page=${page}'>${obj.bTitle}</a></td>
							<td class="text-center">${obj.bReward }</td>
							<td class="text-center d-none d-md-table-cell">${obj.bAddr3}</td>
							<td class="text-center d-none d-md-table-cell">${obj.bWriteTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<%-- <div class="wrapper">
				<div class="search-container">
					<form action="${root }board/main" method="get">
						<button class="search-button" style="cursor:pointer"> <i
							class="fa fa-search"></i>
						</button> <input type="text" id="keyward" name="keyward" placeholder="검색어를 입력해주세요">
						<input type="hidden" id="cNo" name="cNo" value="${bCno }">
					</form>
				</div>
			</div> --%>

			<div class="d-md-block">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageBean.prevPage <=0 }">
							<li class="page-item disabled"><a href="#" class="page-link">&lt;&lt;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="${root }board/main?bCno=${bCno}&page=${pageBean.prevPage}"
								class="page-link">&lt;&lt;</a></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${pageBean.currentPage == 1}">
							<li class="page-item disabled"><a href="#" class="page-link">&lt;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="${root }board/main?bCno=${bCno}&page=${pageBean.currentPage-1}"
								class="page-link">&lt;</a></li>
						</c:otherwise>
					</c:choose>



					<c:forEach var="idx" begin="${pageBean.min }"
						end="${pageBean.max }">
						<c:choose>
							<c:when test="${idx==pageBean.currentPage }">
								<li class="page-item active d-none d-md-block"><a
									href="${root}board/main?bCno=${bCno}&page=${idx}"
									class="page-link">${idx }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item d-none d-md-block"><a
									href="${root}board/main?bCno=${bCno}&page=${idx}"
									class="page-link">${idx }</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					<c:choose>
						<c:when test="${pageBean.currentPage == pageBean.max}">
							<li class="page-item disabled"><a href="#" class="page-link">&gt;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="${root }board/main?bCno=${bCno}&page=${pageBean.currentPage+1}"
								class="page-link">&gt;</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pageBean.max >= pageBean.pageCnt }">
							<li class="page-item disabled"><a href="#" class="page-link">&gt;&gt;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="${root }board/main?bCno=${bCno}&page=${pageBean.nextPage}"
								class="page-link">&gt;&gt;</a></li>
						</c:otherwise>
					</c:choose>



				</ul>
				<div class="text-center">
					<a href="${root }board/write?bCno=${bCno}" class="btn btn-primary">글쓰기</a>
				</div>

			</div>


		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp" />


</body>
</html>




