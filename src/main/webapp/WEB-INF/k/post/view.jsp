<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="bg-dark d-flex flex-column min-vh-100 gothic-a1-regular">
		<jsp:include page="../common/header.jsp"/>
		<div class="pathway row bg-light">
		
		</div>
		<div class="wrap mt-5">
			<hr>
			<main class="container mt-5 text-white">
				
                <label for="title" class="form-label mt-3"><i class="fa-solid fa-t"></i><b> 글 제목 </b></label>
                <input type="text" class="form-control fw-bold big" id="title" placeholder="input title" name="title" value="${post.title}"  disabled>
                
                <label for="writer" class="form-label mt-3"><i class="fa-solid fa-user-pen"></i><b> 작성자 </b></label>
                <input type="text" class="form-control text-secondary small" id="writer" placeholder="writer" name="writer" value="${post.userId}" disabled>
                
                <label for="content" class="form-label mt-3"><i class="fa-solid fa-pen-to-square"></i><b> Content </b></label>
                <div type="text" class="ql-editor form-control"  id="title" placeholder="input content" name="content" disabled>${post.content}</div>
                
                <label for="regdate" class="form-label mt-3"><i class="fa-regular fa-calendar-check"></i><b> Date written </b></label>
                <input type="text" class="form-control text-secondary small" id="regdate" placeholder="regdate" name="regdate" value="${post.createDate}" disabled>
                
                <label for="updatedate" class="form-label mt-3"><i class="fa-solid fa-file-signature"></i><b> Altered date </b></label>
                <input type="text" class="form-control text-secondary small" id="updatedate" placeholder="updatedate" name="updatedate" value="${post.updateDate}" disabled>
				<hr>
             	<div class="text-center mt-5 mb-5">
             		<!-- <c:if test="${post.userId}"> -->
	             		<a href="modify?pno=${post.pno}&${criteria.qs2}" class="btn btn-outline-light"> ALTER POST </a>
	             		<a href="remove?pno=${post.pno}&${criteria.qs2}" class="btn btn-outline-light" onclick="return confirm('Delete this post?')"> DELETE POST </a>
             		<!-- </c:if> -->
             	</div>
				
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</body>
</html>