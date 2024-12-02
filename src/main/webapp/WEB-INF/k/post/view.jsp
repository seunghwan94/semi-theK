<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="gothic-a1-regular">
		<jsp:include page="../common/header.jsp"/>
		<c:if test="${not empty user}">
			<jsp:include page="../common/idshower.jsp"/>
		</c:if>
		<div class="pathway row bg-light">
		</div>
		<div class="wrap mt-5">
			<main class="container mt-5 text-white">
                <label for="title" class="form-label mt-3"><i class="fa-solid fa-t"></i><b> 글 제목 </b></label>
                <input type="text" class="form-control fw-bold big" id="title" placeholder="input title" name="title" value="${post.title}"  readonly>
                
                <label for="writer" class="form-label mt-3"><i class="fa-solid fa-user-pen"></i><b> 작성자 </b></label>
                <input type="text" class="form-control text-secondary small" id="writer" placeholder="writer" name="writer" value="${post.userId}" readonly>
                
                <label for="content" class="form-label mt-3"><i class="fa-solid fa-pen-to-square"></i><b> 글 내용 </b></label>
                
                <div type="text" class="ql-editor form-control"  id="content"  name="content" >${post.content}</div>

                <label for="regdate" class="form-label mt-3"><i class="fa-regular fa-calendar-check"></i><b> 작성일 </b></label>
                <input type="text" class="form-control text-secondary small" id="regdate" placeholder="regdate" name="regdate" value="${post.createDate}" readonly>
                
                <label for="updatedate" class="form-label mt-3"><i class="fa-solid fa-file-signature"></i><b> 최근 수정일 </b></label>
                <input type="text" class="form-control text-secondary small" id="updatedate" placeholder="updatedate" name="updatedate" value="${post.updateDate}" readonly>
				<hr>
				<div>
					
				</div>
             	<div class="text-center mt-5 mb-5">
					<a href="${cp}list/modify?pno=${post.pno}" class="btn btn-outline-light btn-mod d-none" > 수정하기 </a>
					<a href="${cp}list?cno=${post.cno}" class="btn btn-outline-light btn-ret" > 게시판으로 돌아가기 </a>
					<a href="${cp}list/remove?pno=${post.pno}" class="btn btn-outline-light btn-del d-none" onclick="return confirm('Delete this post?')"> 삭제하기 </a>
             	</div>
            	<jsp:include page="../common/reply.jsp"/> 	
			</main>
		</div>
	<script type="text/javascript">
		$(document).ready(function() {
			if ("${user.id}" == "${post.userId}") {
				console.log("${user.id}");
				console.log("${post.userId}");
		        $(".btn-mod, .btn-del").removeClass("d-none");
		    } 
		    
		    const cookieValue = Cookies.get('userId');
	        if (cookieValue) {
	            console.log('쿠키 값:', cookieValue);
	        } else {
	            console.log('쿠키가 존재하지 않습니다.');
	        }
		})
	</script>
	</body>
</html>