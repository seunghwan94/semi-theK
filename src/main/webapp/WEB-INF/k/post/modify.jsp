<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="bg-dark d-flex flex-column min-vh-100 gothic-a1-regular ">
		<div class="wrap">
			<main class="mt-5 mb-5">
				<jsp:include page="../common/header.jsp"/>
				<hr class="mb-5">
				
                <label for="title" class="form-label mt-3"><i class="fa-solid fa-t"></i><b> 글 제목 </b></label>
                <input type="text" class="form-control fw-bold big" id="title" placeholder="input title" name="title" value="${post.title}" >
                
                <label for="writer" class="form-label mt-3"><i class="fa-solid fa-user-pen"></i><b> 작성자 </b></label>
                <input type="text" class="form-control text-secondary small" id="writer" placeholder="writer" name="writer" value="${post.userId}" disabled>
                
                <label for="content" class="form-label mt-3"><i class="fa-solid fa-pen-to-square"></i><b> Content </b></label>
                <!-- 게시글 보는 곳 -->
                <div class="pathway bg-secondary text-light">
					<div id="editor" class="text-light h-3">
						${post.content}
					</div>
					<script src="https://cdn.jsdelivr.net/npm/quill@2/dist/quill.js"></script>
					<script src="${cp}js/quill.js"></script>
				</div>
                
                <label for="regdate" class="form-label mt-3"><i class="fa-regular fa-calendar-check"></i><b> 작성일 </b></label>
                <input type="text" class="form-control text-secondary small" id="regdate" placeholder="regdate" name="regdate" value="${post.createDate}" disabled>
                
                <label for="updatedate" class="form-label mt-3"><i class="fa-solid fa-file-signature"></i><b> 최근 수정일 </b></label>
                <input type="text" class="form-control text-secondary small" id="updatedate" placeholder="updatedate" name="updatedate" value="${post.updateDate}" disabled>
				<hr>
             	<div class="text-center mt-5 mb-5">
				<!-- <c:if test="${post.userId}=="> -->
	             		<a href="modify?pno=${post.pno}&${criteria.qs2}" class="btn btn-outline-light"> 수정하기 </a>
	             		<a href="remove?pno=${post.pno}&${criteria.qs2}" class="btn btn-outline-light" onclick="return confirm('Delete this post?')"> 삭제하기 </a>
				<!-- </c:if> -->
             	</div>
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</body>
</html>