<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="bg-dark d-flex flex-column min-vh-100">
		<jsp:include page="../common/header.jsp"/>
		<div class="wrap">
			<main class="flex-grow-1">
			
                <label for="title" class="form-label mt-3"><i class="fa-solid fa-font text-primary"></i><b> 글 제목 </b></label>
                <input type="text" class="form-control" id="title" placeholder="input title" name="title" value="${post.title}"  disabled>
                
                <label for="writer" class="form-label mt-3"><i class="fa-solid fa-user-pen text-primary"></i><b> 작성자 </b></label>
                <input type="text" class="form-control" id="writer" placeholder="writer" name="writer" value="${post.userId}" disabled>
                
                <label for="content" class="form-label mt-3"><i class="fa-solid fa-pen-to-square text-primary"></i><b> Content </b></label>
                <textarea rows="15" type="text" class="form-control" id="title" placeholder="input content" name="content" disabled>${post.content}</textarea>
                
                <label for="regdate" class="form-label mt-3"><i class="fa-regular fa-calendar-check text-primary"></i><b> Date written </b></label>
                <input type="text" class="form-control" id="regdate" placeholder="regdate" name="regdate" value="${post.createDate}" disabled>
                
                <label for="updatedate" class="form-label mt-3"><i class="fa-solid fa-file-signature text-primary"></i><b> Altered date </b></label>
                <input type="text" class="form-control" id="updatedate" placeholder="updatedate" name="updatedate" value="${post.updateDate}" disabled>
				
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</body>
</html>