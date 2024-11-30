<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
	<head>
		<jsp:include page="../common/head.jsp"	/>
	</head>
	<style>
		.img-size-target {
			width:397px;
			height:260px;
		}
		img{
			
			object-fit: contain;
		}
		.card-hover {
		    transition: transform 0.3s ease, box-shadow 0.3s ease;
		}
		
		.card-hover:hover {
		    transform: scale(1.1);
		}
		.like-YN {
			cursor: pointer;
		}
		
	</style>
<body class="gothic-a1-regular">
	<jsp:include page="../common/header.jsp"/>
	
	<main class="mt-5 mb-5">
		<hr class="mb-5">
		<div class="card d-flex m-5 border-0" >
			<div class="d-flex p-2 flex-wrap" >
				<c:forEach items="${posts}" var="post">
					<div class="card m-2 card-hover" data-bs-toggle="modal" data-bs-target="#exampleModal" data-pno="${post.pno}" style="width:397px;">
						<div class="card-header text-truncate">${post.title}</div>
						<div class="card-body p-1 img-size-target d-flex justify-content-center align-items-center">
							<img class="w-100 h-100" src="${fnc:split(post.content,'&%$^&')[0]}">
						</div>
						<div class="card-footer">
							<div class="d-flex justify-content-between">
								<b>${post.userId}</b>
								<div class="d-flex">
									<div class="px-1">
										<i class="fa-regular fa-eye me-1"></i>
										${post.viewCnt}
									</div>
									<div class="px-1 ms-1 ">
										<i class="fa-solid fa-heart d-none"></i>
										<i class="fa-regular fa-heart "></i>
										
									</div>
								</div>
							</div>
							<p class="content-preview m-0  text-truncate">${fnc:split(post.content,'&%$^&')[1]}</p>
							<p class="text-samll text-secondary m-0 text-end" >2024-11-30</p>
						</div>
					</div>
				</c:forEach>
			
			
			</div>
		</div>
		<div class="d-flex justify-content-end mt-4 me-5">
            <button type="button" class="btn btn-secondary" onclick="window.location.href='kallery/write'" >글쓰기</button>
        </div>
		<jsp:include page="../common/paging.jsp"></jsp:include>
		
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		    
		    <div class="card card-target">
		    
		      <div class="card-header">
		      	<div class="" style="position:absolute; right:10px">
		      		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      	</div>
		      	<div>
		      	<p class="title-preview m-0 " id="exampleModalLabel" style="width: 95%"></p>
		      </div>
		      <div class="card-body p-0 d-flex justify-content-center align-items-center">
				<img id="preview" name="imgData" class=" w-100 h-100" src="">
			  </div>
		      <div class="card-footer">
				<div class="d-flex justify-content-between">
					<b class="user-id"></b>
					<div class="d-flex">
						<div class="px-1 d-flex align-items-center">
							<i class="fa-regular fa-eye me-1"></i>
							<p class="p-0 m-0 view-cnt">0</p>
						</div>
						<div class="px-1 ms-1 like-YN">
							<i class="fa-solid fa-heart like-Y d-none pe-auto"></i>
							<i class="fa-regular fa-heart like-N"></i>
							0
						</div>
					</div>
				</div>
	            <p class="content-preview m-0"></p>
				<p class="text-samll text-secondary m-0 text-end" ></p>
			  </div>
			</div>
	      </div>
	      
	      
	    </div>
	  </div>


	</main>
	
<%-- 	<jsp:include page="../common/footer.jsp"/> --%>

	<script>
	$(".like-YN").on("click",function(){
		const $likeY = $(this).find("i").eq(0);
		const $likeN = $(this).find("i").eq(1);
		
		if ($likeY.hasClass("d-none")){
			$likeY.removeClass("d-none");
			$likeN.addClass("d-none");
		}else{
			$likeY.addClass("d-none");
			$likeN.removeClass("d-none");
			
		}

	});
	
	$(".card-hover").click("click", function(){
		
		const pno = $(this).data("pno");
		const title = $(this).find(".card-header").text().trim();
	    const bodyImage = $(this).find("img").attr("src");
	    const bodyText = $(this).find(".content-preview").text().trim();
	    const userId = $(this).find("b").text().trim();
	    const viewCnt = $(this).find(".fa-eye").parent().text().trim();
	    const viewCntPuls = Number(viewCnt) + 1;
	    
	    $.ajax({
            url: "${cp}/kallery",
            type: "put",
            contentType: "application/json; charse=utf-8",
            data: JSON.stringify({pno}),
            success: function (res) {
                
            }
        });   
		
	    $(this).find(".fa-eye").parent().html('<i class="fa-regular fa-eye me-1"></i>' + viewCntPuls);
	    
	    $(".title-preview").text(title);
	    $("#preview").attr("src", bodyImage).removeClass("d-none");
	    $(".card-footer .content-preview").text(bodyText);
	    $(".card-footer .user-id").text(userId);
	    $(".card-footer .view-cnt").text(viewCntPuls);
	    
	});
	
	</script>	
	</body>
</html>