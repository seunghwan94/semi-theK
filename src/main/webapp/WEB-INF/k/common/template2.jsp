<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
		 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	</head>
	<body class="bg-dark d-flex flex-column min-vh-100 gothic-a1-regular ">
		<div class="wrap">
			<main class="mt-5 mb-5">
				<jsp:include page="../common/header.jsp"/>
				<hr class="mb-5">
				
				
				<!-- 여기를 수정하면 됨 -->
				 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
			<body class="card-body d-flex flex-column justify-content-center align-items-center vh-100">
		    <div class="container text-left"> <!-- text-left로 변경하여 왼쪽 정렬 -->
		        <!-- 검색 입력창 -->
		       <div class="row">
		        <div class="col-md-11 mb-4 w-5 w-md-30 mx-auto">Search About Us
		        </div>
		       </div> 
		       <hr>
		        <div class="col-md-5 content mx-5">
		            <p>세계에 K의 바람이 불고 있다.</p>
		            <p>Lorem Ipsum: Lorem Ipsum, Lorem Ipsum, Lorem Ipsum.</p>
		            <p>Lorem Ipsum Lorem Ipsum: Lorem Ipsum, Lorem Ipsum, Lorem Ipsum.</p>
		             
		           		<div class="support mt-5">
		                <!-- 지원 항목 -->
		                 <div class="form-group mb-4 w-10 w-md-40 mx-auto">
		            		<input type="text" class="form-control form-control-lg" placeholder="Support US with,">
		        		</div>
		                
		                <!-- PayPal -->
		               	<div class="col-md-10">
			                <div class="col-md-10 d-flex align-items-center mb-3">
			                <i class="fa-brands fa-bitcoin fa-4x"></i>
		                    <span class="col-md-10 m-3">Support us with PayPal</span>
		                </div>
		              </div>  
		                <div class="mb-4">
		                    <span>Lorem Ipsum : Lorem Ipsum, Lorem Ipsum, Lorem Ipsum.</span>
		                </div>
		                
		                <!-- BTC -->
		                <div class="col-md-10">
		                	<div class="col-md-10 d-flex align-items-center mb-3">
			                <i class="fa-brands fa-btc fa-3x"></i>
			                <span class="col-md-10 m-3">Support us with BTC</span>
		                </div>
					</div>
		                <p>Lorem Ipsum: Lorem Ipsum, Lorem Ipsum, Lorem Ipsum.</p>
		            </div>
		        </div>
		    </div>
			</main>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</body>
</html>