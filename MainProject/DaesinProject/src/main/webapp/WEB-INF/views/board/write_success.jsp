<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<script>
	alert("글 작성에 성공하셨습니다. ")
	location.href = "${root }board/read?bCno=${writeContentBean.bCno}&bNo=${writeContentBean.bNo}&page=1"
		
</script>