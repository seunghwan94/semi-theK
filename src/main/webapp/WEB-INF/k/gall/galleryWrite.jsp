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
	</style>
<body class="gothic-a1-regular">
	<jsp:include page="../common/header.jsp"/>
	
	<main class="mt-5 mb-5">
		<hr class="mb-5">
		<form name="frm" action="${cp}manage/ntc" class="m-5">
       	<input type="hidden" name="pno" id="pno" value="${post.pno}"> 
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
						<div class="card-header">상조장</div>
						<div class="card-body p-0 img-size-target d-flex justify-content-center align-items-center">
							<img id="preview" class="d-none w-100 h-100">
							<p>이미지 파일을 첨부해주세요.</p>
						</div>
						<div class="card-footer">
						test
						</div>
					</div>
  				</div>
            </div>
            <div class="card-footer">  
                <div class="input-group my-2">
                    <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
                    <input type="text" class="form-control" id="writer" name="writer" value="${post.userId}">
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
	    $('#addImg').on('change', function(event) {
	        const file = event.target.files[0];
	        
			if (file) {
				const reader = new FileReader();
	          	reader.onload = function(e) {
		        	$('#preview').attr('src', e.target.result).show();
		        	$('#preview').removeClass("d-none");
		        	$('.img-size-target > p').addClass("d-none");
	          	};
		        reader.readAsDataURL(file);
		    };
		});
	});
	</script>
	</body>
</html>