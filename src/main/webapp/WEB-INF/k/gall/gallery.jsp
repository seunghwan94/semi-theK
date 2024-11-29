<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<style>
		img {
			object-fit :cover; 
			max-width:397px;
			min-width:397px;
		}
	</style>
<body class="gothic-a1-regular">
	<jsp:include page="../common/header.jsp"/>
	
	<main class="mt-5 mb-5">
		<hr class="mb-5">
		<div class="card d-flex m-5 border-0" >
			<div class="d-flex p-2 flex-wrap" >
				<div class="card m-2 ">
					<div class="card-header">상조장</div>
					<div class="card-body p-0">
						<img class="w-100 h-100" src="${cp}files/common/dog.jpg">
					</div>
					<div class="card-footer">
					test
					</div>
				</div>
				<div class="card m-2">
					<div class="card-body">
					<img class="w-100 h-100 " src="${cp}files/common/dog.jpg">
					</div>
					<div class="card-footer">
					test
					</div>
				</div>
				<div class="card m-2">
					<div class="card-body">
					<img class="w-100 h-100 " src="${cp}files/common/dog.jpg">
					</div>
					<div class="card-footer">
					test
					</div>
				</div>
				<div class="card m-2">
					<div class="card-body">
					<img class="w-100 h-100 " src="${cp}files/common/dog.jpg">
					</div>
					<div class="card-footer">
					test
					</div>
				</div>
				
				
				<div class="card m-2">
					<div class="card-body">
						<img class="w-100 h-100 " src="${cp}files/common/dog.jpg">
					</div>
					<div class="card-footer">
						test
					</div>
				</div>
				<div class="card m-2">
					<div class="card-body">
						<img class="w-100 h-100 " src="${cp}files/common/dog.jpg">
					</div>
					<div class="card-footer">
						test
					</div>
				</div>
				<div class="card m-2">
					<div class="card-body">
						<img class="w-100 h-100 " src="${cp}files/common/dog.jpg">
					</div>
					<div class="card-footer">
						test
					</div>
				</div>
				<div class="card m-2">
					<div class="card-body">
						<img class="w-100 h-100 " src="${cp}files/common/dog.jpg">
					</div>
					<div class="card-footer">
						test
					</div>
				</div>
			</div>
		</div>
		
	</main>
	
	<jsp:include page="../common/footer.jsp"/>
	
	</body>
</html>