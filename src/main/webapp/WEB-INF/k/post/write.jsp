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
					<div>
						<jsp:include page="../common/writer.jsp"/>
					</div>
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
			const myContent = $("#editor .ql-editor").html();
			console.log(myContent);
			const data = {"title" : "ddd" , "content" : myContent, "userId" : "dd"   }
            $.ajax({
                url: "${cp}post/write",
                type: "POST",
                contentType: "application/json; charse=utf-8",
                data: JSON.stringify(data),
                
                success: function (res) {
                    if (res=='success') {
                        alert("적용 되었습니다.");
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