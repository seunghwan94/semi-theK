<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"/>
	</head>
	<body class="gothic-a1-regular ">
		<jsp:include page="../common/header.jsp"/>
		<c:if test="${not empty user}">
			<jsp:include page="../common/idshower.jsp"/>
		</c:if>
		<div class="wrap">
			<main class="mb-5 container">
				<form method="post">
					<div class="input-group container mx-3">
						<span class="input-group-text">제목</span>
						<input type="text" class="form-control" placeholder="input title here" name="title" id="post-title">
					</div>
					<select class="form-select form-select-sm text-white bg-secondary my-3 border-dark" name="cat">
					    <c:forEach items="${categories}" var="cate">
					        <option value="${cate.cno}" class="post-cate" ${urlCno == cate.cno ? "selected" : "" }>${cate.cname}</option>
					    </c:forEach>
					</select>
					<div>
						<jsp:include page="../common/writer.jsp"/>
					</div>
					<div class="p-3 container">
						<div class="input-group container m-2">
							<span class="input-group-text">태그</span>
							<input type="text" class="form-control" placeholder="예시 #소통해요" name="tag" id="post-tag">
						</div>
						<div class="input-group container m-2">
							<span class="input-group-text">작성자</span>
							<input type="text" class="form-control" value="${userId}" name="writer" id="post-writer">
						</div>
					</div>
					<button type="button" class="btn btn-outline-secondary mt-2 post-button">작성하기</button>
				</form>
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</body>
	<script>
		$(".post-button").click(function(){
			// console.log(${cno});
			// const url = "list/post/write?cno=" + ${cno};
			const myTitle = $("#post-title").val();
			const myContent = $("#editor .ql-editor").html();
			const myId = $("#post-writer").val(); 
			const myCate = $("select[name=cat]").val();
	
			console.log(myTitle);
			console.log(myContent);
			console.log(myId);
			console.log(myCate);
			
			const data = {"title" : myTitle , "content" : myContent, "userId" : myId, "cno" : myCate};
            $.ajax({
                url: "${cp}post/write",
                type: "post",
                contentType: "application/json; charse=utf-8",
                data: JSON.stringify(data),
                success: function (res) {
                	console.log(res);
                    if (res == "success") {
                        alert("적용 되었습니다. 작성된 게시판을 확인해 보세요!");
                		const url = "${cp}list?cno="+myCate;
                		window.location.href= url;
                    } else {
                        alert("적용 실패하였습니다");
                    }
                },
                error: function () {
                    alert("서버에서 오류가 발생했습니다.");
                }
            });
		})
	</script>
</html>