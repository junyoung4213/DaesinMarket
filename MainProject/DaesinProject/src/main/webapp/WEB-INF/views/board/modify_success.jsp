<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify_Success</title>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	swal("글 수정 성공", "성공적으로 글이 수정되었습니다", "success").then(function(){
		location.href="${root}board/read?bNo=${modifyContentBean.bNo}&bCno=${modifyContentBean.bCno}&page=${page}";
		});
</script>
</body>
</html>


