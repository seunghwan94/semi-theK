<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="gothic-a1-regular ">
		<jsp:include page="../common/header.jsp"/>
		<c:if test="${not empty user}">
			<jsp:include page="../common/idshower.jsp"/>
		</c:if>
		<div class="wrap">
			<main class="mt-5 mb-5">
				<hr class="mb-5">
				
				
				
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</body>
</html>