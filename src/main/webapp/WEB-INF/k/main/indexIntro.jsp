<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
    <jsp:include page="../common/head.jsp" />
</head>
<style>
	main {
		padding: 150px;
		position: relative; 
		overflow: hidden; 
	}
	.card-main {
		width : 327px;
		height: 500px;
		cursor: pointer;
	}
	.card {
	    transition: transform 0.3s ease, box-shadow 0.3s ease;
	}
	.card:hover {
	    transform: scale(1.1);
	}
	video{
		position: absolute;
		top: 0;
		left: 0;
		width: 100%; 
		height: 100%; 
		object-fit: cover; 
		z-index: -1; 
	}
</style>
<body class="gothic-a1-regular">
    <!--<div class="z-0" style="position:fixed; height:100vh; width:100%; background-color:#00000044; top:0; left:0;"></div> -->
   	<img src="${cp}files/common/k_landscape.png" class="img-fluid position-absolute z-n1 position-fixed fixed-bottom" alt="landscape">
   	
    <main class="container my-2 mx-auto justify-content-center z-3" style="background-color:black; border-radius: 30px;">
		<video src="${cp}/files/common/k_intro.mp4" alt="mp4" muted autoplay playsinline loop></video>
		<div class="d-flex justify-content-around">
			
			<div class="card card-main p-4 main-index">
				<div class="card-body d-flex flex-column justify-content-around">
					<div class="text-center mb-4">
						<img src="${cp}/files/common/dark_logo.png" style="width:150px;" alt="dark_logo">
					</div>
					<h3>메인페이지</h3>
					<div class="text-end">
						<h3><i class="fa-solid fa-arrow-right"></i></h3>
					</div>
				</div>
			</div>
			
			<div class="card card-main p-4 manage-index">
				<div class="card-body d-flex flex-column justify-content-around">
					<div class="text-center mb-4">
						<img src="${cp}/files/common/light_logo.png" style="width:105px;" alt="dark_logo">
					</div>
					<h3>관리자페이지</h3>
					<div class="text-end">
						<h3><i class="fa-solid fa-arrow-right"></i></h3>
					</div>
				</div>
			</div>
		</div>
    </main>
    <script type="text/javascript">
    	$(".main-index").click(function(){
    		location.href='index';
    	})
   	 	$(".manage-index").click(function(){
    		location.href='manage';
    	})
    </script>
</body>
</html>