<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<style>
		.card-target {
			width:397px;
		}
		.img-size-target {
			width:397px;
			height:260px;
			
		}
		img{
			
			object-fit: contain;
		}
		.like-Y, .like-N {
			cursor:pointer;
		}
	</style>
<body class="gothic-a1-regular">
	<jsp:include page="../common/header.jsp"/>
	
	<main class="mt-5 mb-5">
		<hr class="mb-5">
		
		<form method="post" name="frm" class="m-5">
	       	<input type="hidden" name="pno" id="pno" value="${post.pno}">
	       	<input type="hidden" name="snedImg" id="sendImg" value=""> 
	       	<%-- <input type="hidden" name="writer" id="writer" value="${post.writer}">  --%>
	       	<input type="hidden" name="writer" id="writer" value="1@a"> 
	        <div class="card">
	            <div class="card-header">
	                <div class="input-group flex-nowrap my-2">
	                    <span class="input-group-text" id="addon-wrapping">제 목</span>
	                    <input type="text" class="form-control"  id="title" value="${post.title}" name="title">
	                </div>
	            </div>
	            <div class="card-body p-0">
				    
				    <input class="form-control" type="file" id="addImg" accept="image/*">
	  				<div class=" d-flex justify-content-center">
		  				<div class="card m-5 card-target">
							<div class="card-header">
								<p class="title-preview m-0">제목을 입력해주세요.</p>
							</div>
							<div class="card-body p-0 img-size-target d-flex justify-content-center align-items-center">
								<img id="preview" name="imgData" class="d-none w-100 h-100">
								<p>이미지 파일을 첨부해주세요.</p>
							</div>
							<div class="card-footer">
								<div class="d-flex justify-content-between">
									<b>상조장</b>
									<div class="d-flex">
										<div class="px-1"><i class="fa-regular fa-comment me-1"></i>0</div>
										<div class="px-1 ms-1">
											<i class="fa-solid fa-heart like-Y d-none pe-auto"></i>
											<i class="fa-regular fa-heart like-N"></i>
											0
										</div>
									</div>
								</div>
								<p class="content-preview m-0"></p>
								<p class="text-samll text-secondary m-0 text-end" >2024-11-30</p>
							</div>
						</div>
	  				</div>
	            </div>
	            <div class="card-footer">  
	                <div class="input-group my-2">
	                    <span class="input-group-text" id="inputGroup-sizing-default">내용</span>
	                    <input type="text" class="form-control" id="content" name="content" value="${post.content}">
	                </div>
	            </div>
	            
	        </div>
	        <div class="d-flex justify-content-end mt-4 me-2">
	            <button type="button" class="btn btn-secondary btn-add" >등록</button>
	        </div>
		</form>
		
	</main>
	
	<jsp:include page="../common/footer.jsp"/>
	<script>
	 
	
	 $(document).ready(function() {
		$("#title").on("input", function(){
			$(".title-preview").text($(this).val());
			
		});
		$("#content").on("input", function(){
			$(".content-preview").text($(this).val());
			
		});
		$(".like-Y").click(function(){
			$(".like-Y").addClass("d-none");
			$(".like-N").removeClass("d-none");
		})
		$(".like-N").click(function(){
			$(".like-N").addClass("d-none");
			$(".like-Y").removeClass("d-none");
		})
		
		/* 이미지 미리보기 */
	    $('#addImg').on('change', function(event) {
	        const file = event.target.files[0];
	        
			if (file) {
				const reader = new FileReader();
	          	reader.onload = function(e) {
		        	$('#preview').attr('src', e.target.result).show();
		        	$("#sendImg").val(e.target.result);
		        	console.log($("#sendImg").val());
		        	$('#preview').removeClass("d-none");
		        	$('.img-size-target > p').addClass("d-none");
	          	};
		        reader.readAsDataURL(file);
		    };
		});
		
		
		$(".btn-add").click(function(){
			const title = $("#title").val();
			const sendImg = $("#sendImg").val();
			const tmp = $("#content").val();
			const userId = $("#writer").val();
			
			const data = {
					title, userId,
					cno : 2,
					content : sendImg + "&%$^&" + tmp
			}
			
			console.log(data);
			
			$.ajax({
	            url: "${cp}/kallery/write",
	            type: "post",
	            contentType: "application/json; charse=utf-8",
	            data: JSON.stringify(data),
	            success: function (res) {
	                if(res.status=='success'){
	                	alert("등록 하셨습니다.");
	                	location.href = ${cp}+"/kallery";
	                }else{
	                	alert("등록에 실패하셨습니다.");
	                }
	            },
	            error: function () {
	                alert("서버에서 오류가 발생했습니다.");
	            }
	        });                
		})
	});
	</script>
	</body>
</html>