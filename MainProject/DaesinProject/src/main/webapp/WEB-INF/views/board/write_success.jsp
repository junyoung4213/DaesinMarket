<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write_Success</title>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	swal("글쓰기 성공", "글 작성에 성공하셨습니다", "success").then(function(){
		location.href = "${root }board/read?bCno=${writeContentBean.bCno}&bNo=${writeContentBean.bNo}&page=1"
		});
</script>
</body>
</html>


