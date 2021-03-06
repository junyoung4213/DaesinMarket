<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<!-- 게시글 리스트 -->
<div class="container" style="padding-top: 200px;">
	<div class="card shadow">
		<div class="card-body">
			<h4 class="card-title text-center mb-5 ">내가 맡은 의뢰 목록</h4>
			<table class="table table-hover mb-5" id="board_list">
				<thead>
					<tr>
						<th class="text-center">거래번호</th>
						<th class="text-center">게시물번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">금액</th>
						<th class="text-center d-none d-md-table-cell">작성시간</th>
						<th class="text-center d-none d-md-table-cell">진행상황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="obj" items="${boardList }">
						<tr>
							<td class="text-center">${obj.tNo }</td>
							<td class="text-center">${obj.boardBean.bNo }</td>
							<td class="text-center"><a
								href='${root}trade/read?bNo=${obj.boardBean.bNo}'>${obj.boardBean.bTitle}</a></td>
							<td class="text-center">${obj.boardBean.bReward }</td>
							<td class="text-center d-none d-md-table-cell">${obj.boardBean.bWriteTime}</td>
							<c:choose>
								<c:when test="${obj.boardBean.bStatus == 0 }">
									<td class="text-center d-none d-md-table-cell">대기중</td>
								</c:when>
								<c:when test="${obj.boardBean.bStatus == 1 }">
									<td class="text-center d-none d-md-table-cell">진행중</td>
								</c:when>
								<c:when test="${obj.boardBean.bStatus == 2 }">
									<td class="text-center d-none d-md-table-cell">완료</td>
								</c:when>
								<c:when test="${obj.boardBean.bStatus == 3 }">
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
								href="${root }trade/supporter?page=${pageBean.prevPage}"
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
								href="${root }trade/supporter?page=${pageBean.currentPage-1}"
								class="page-link">&lt;</a></li>
						</c:otherwise>
					</c:choose>



					<c:forEach var="idx" begin="${pageBean.min }"
						end="${pageBean.max }">
						<c:choose>
							<c:when test="${idx==pageBean.currentPage }">
								<li class="page-item active d-none d-md-block"><a
									href="${root}trade/supporter?page=${idx}" class="page-link">${idx }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item d-none d-md-block"><a
									href="${root}trade/supporter?page=${idx}" class="page-link">${idx }</a></li>
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
								href="${root }trade/supporter?page=${pageBean.currentPage+1}"
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
								href="${root }trade/supporter?page=${pageBean.nextPage}"
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




