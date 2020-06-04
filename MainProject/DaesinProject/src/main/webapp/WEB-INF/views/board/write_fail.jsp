<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<script>
	alert("보상으로 지급할 포인트가 부족합니다. 다시 확인해주세요.")
	window.history.back();
</script>