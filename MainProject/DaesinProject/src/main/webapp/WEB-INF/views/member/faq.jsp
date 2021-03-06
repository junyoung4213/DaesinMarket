<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath}/" />

<c:import url="/WEB-INF/views/include/top_menu.jsp" />


<div class="site-section" data-aos="fade" style="padding-top:140px;">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<h2 class="h1 mb-3 text-black">문의하기</h2>
			</div>
			<div class="col-md-5">
				<form:form action="${root }email/question.do" method="post"
					modelAttribute="questionBean">
					<div class="p-3 p-lg-5 border">
						<form:hidden path="mNo" value="${member.mNo }" />
						<form:hidden path="mEmail" value="${member.mEmail }" />
						<form:hidden path="mId" value="${member.mId }" />

						<div class="form-group row">
							<div class="col-md-12">
								<form:label path="title" class="text-black">제목</form:label>
								<form:input path="title" class="form-control" />
							</div>
						</div>

						<div class="form-group row">
							<div class="col-md-12 mb-3">
								<form:label path="content" class="text-black">내용</form:label>
								<form:textarea path="content" cols="20" rows="6"
									class="form-control" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-lg-12">
								<form:button class="btn btn-primary btn-lg btn-block">문의메일 보내기</form:button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>


<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>
