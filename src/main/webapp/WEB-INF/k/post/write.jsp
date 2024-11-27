<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="d-flex flex-column min-vh-100 gothic-a1-regular ">
		<div class="wrap">
			<jsp:include page="../common/header.jsp"/>
			<main class="mb-5 container">
				<form method="post">
					<div class="input-group container m-2">
						<span class="input-group-text">제목</span>
						<input type="text" class="form-control" placeholder="input text" name="title">
					</div>
					<jsp:include page="../common/writer.jsp"/>
					<hr class="bg-white">
					<div class="p-3 container">
						<div class="input-group container m-2">
							<span class="input-group-text">태그</span>
							<input type="text" class="form-control" placeholder="예시 = #소통해요">
						</div>
						<div class="input-group container m-2">
							<span class="input-group-text">작성자</span>
							<input type="text" class="form-control" value="${userId}" name="writer">
						</div>
					</div>
					<button class="btn btn-outline-secondary mt-2">작성하기</button>
				</form>
			</main>
			<jsp:include page="../common/footer.jsp"/>
			
		</div>
	</body>
</html>