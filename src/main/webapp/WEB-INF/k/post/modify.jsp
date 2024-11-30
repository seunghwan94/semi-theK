<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<body class="gothic-a1-regular ">
		<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/idshower.jsp"/>
		<div class="wrap">
			<main class="mt-5 mb-5">
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
				<c:if test="${not empty post.userId}">
	           		<button type="button" class="btn btn-outline-light post-mod"> 수정글 게시 </button>
	           		<a href="remove?pno=${post.pno}&${criteria.qs2}" class="btn btn-outline-light" onclick="return confirm('Delete this post?')"> 삭제하기 </a>
				</c:if>
             	</div>
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
		<script>
			//alert("~!!!~~~~")
			$(".post-mod").click(function(){
			//alert("~!!!~~~~")
				const pno = ${post.pno};
				const title = $("#title").val();
				const content = $("#editor .ql-editor").html();
				const data = {pno, title, content, userId:'\${post.userId}'};

				$.ajax({
	                url: "${cp}list/modify",
	                type: "post",
	                contentType: "application/json; charse=utf-8",
	                data: JSON.stringify(data),
	                success: function (res){
	                	console.log(res);
	                    if (res.status=="success") {
	                        alert("적용 되었습니다. 변경된 글을 확인해 보세요.");
	                        const url = "${cp}list/view?pno="+pno;
	                		window.location.href= url;
	                    } else {
	                        alert("적용 실패하였습니다");
	                    }
	                },
	                error: function () {
	                    alert("서버에서 오류가 발생했습니다.");
	                }
	            });
			});
		</script>
	</body>
</html>