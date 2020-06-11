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
				<strong class="text-black">의뢰 목록</strong>
			</div>
		</div>
	</div>
</div>

<!-- 게시글 리스트 -->
<div class="container" style="margin-top: 100px;">
	<div class="card shadow">
		<div class="card-body">
			<h4 class="card-title text-center mb-5 ">의뢰목록 게시판</h4>
			<table class="table table-hover mb-5" id="board_list">
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">금액</th>
						<th class="text-center d-none d-md-table-cell">작성시간</th>
						<th class="text-center d-none d-md-table-cell">진행상황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="obj" items="${boardList }">
						<tr>
							<td class="text-center">${obj.bNo }</td>
							<td class="text-center"><a
								href='${root }board/read?bCno=${obj.bCno}&bNo=${obj.bNo}&page=${page}'>${obj.bTitle}</a></td>
							<td class="text-center">${obj.bReward }</td>
							<td class="text-center d-none d-md-table-cell">${obj.bWriteTime}</td>
							<c:choose>
								<c:when test="${obj.bStatus == 0 }">
									<td class="text-center d-none d-md-table-cell">대기중</td>
								</c:when>
								<c:when test="${obj.bStatus == 1 }">
									<td class="text-center d-none d-md-table-cell">진행중</td>
								</c:when>
								<c:when test="${obj.bStatus == 2 }">
									<td class="text-center d-none d-md-table-cell">완료</td>
								</c:when>
								<c:when test="${obj.bStatus == 3 }">
									<td class="text-center d-none d-md-table-cell">취소</td>
								</c:when>
							<c:otherwise>
								<td class="text-center d-none d-md-table-cell"></td>
							</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="d-md-block">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageBean.prevPage <=0 }">
							<li class="page-item disabled"><a href="#" class="page-link">&lt;&lt;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="${root }trade/member?page=${pageBean.prevPage}"
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
								href="${root }trade/member?page=${pageBean.currentPage-1}"
								class="page-link">&lt;</a></li>
						</c:otherwise>
					</c:choose>



					<c:forEach var="idx" begin="${pageBean.min }"
						end="${pageBean.max }">
						<c:choose>
							<c:when test="${idx==pageBean.currentPage }">
								<li class="page-item active d-none d-md-block"><a
									href="${root}trade/member?page=${idx}" class="page-link">${idx }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item d-none d-md-block"><a
									href="${root}trade/member?page=${idx}" class="page-link">${idx }</a></li>
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
								href="${root }trade/member?page=${pageBean.currentPage+1}"
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
								href="${root }trade/member?page=${pageBean.nextPage}"
								class="page-link">&gt;&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>




