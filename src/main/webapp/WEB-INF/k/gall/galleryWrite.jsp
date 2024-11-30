<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fnc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>

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
			${post}
			<form method="post" name="frm" class="m-5">
		       	<input type="hidden" name="pno" id="pno" value="${post.pno}">
		       	<input type="hidden" name="snedImg" id="sendImg" value="${fnc:split(post.content,'&%$^&')[0]}">
		       	<input type="hidden" name="writer" id="writer" value="${post.userId}">
		       	<input type="hidden" name="createDate" id="date" value="${post.createDate==''? today : post.createDate}"> 
		       	
		       	
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
									<p class="title-preview m-0">${post.title==''? '제목을 입력해주세요.': post.title} </p>
								</div>
								<div class="card-body p-0 img-size-target d-flex justify-content-center align-items-center">
									
									<img id="preview" name="imgData" class="${fnc:split(post.content,'&%$^&')[0]==''? 'd-none': '' } w-100 h-100" src="${fnc:split(post.content,'&%$^&')[0]}">
									<p class="${fnc:split(post.content,'&%$^&')[0]==''? '': 'd-none' }">이미지 파일을 첨부해주세요.</p>
									
								</div>
								<div class="card-footer">
									<div class="d-flex justify-content-between">
										<b class="write-view">${post.userId}</b>
										<div class="d-flex">
											<div class="px-1"><i class="fa-regular fa-eye me-1"></i>${post.viewCnt == 0 ? 0 : post.viewCnt}</div>
											<div class="px-1 ms-1">
												<i class="fa-solid fa-heart like-Y d-none pe-auto"></i>
												<i class="fa-regular fa-heart like-N"></i>
												0
											</div>
										</div>
									</div>
									<c:if test="${post.content==''}">
					                    <p class="content-preview m-0"></p>
				                    </c:if>
				                    <c:if test="${post.content!=''}">
					                    <p class="content-preview m-0">${fnc:split(post.content,'&%$^&')[1]}</p>
				                    </c:if>
		                    
									
									<p class="text-samll text-secondary m-0 text-end" >
										<c:out value="${post.createDate==''? today : post.createDate}" />
									</p>
								</div>
							</div>
		  				</div>
		            </div>
		            
		            
		            
		            <div class="card-footer">  
		                <div class="input-group my-2">
		                    <span class="input-group-text" id="inputGroup-sizing-default">내용</span>
		                    <c:if test="${post.content==''}">
			                    <input type="text" class="form-control" id="content" name="content" value="">
		                    </c:if>
		                    <c:if test="${post.content!=''}">
			                    <input type="text" class="form-control" id="content" name="content" value="${fnc:split(post.content,'&%$^&')[1]}">
		                    </c:if>
		                </div>
		            </div>
		        </div>
		        <div class="d-flex justify-content-end mt-4 me-2">
		        	<button type="button" class="btn btn-outline-secondary me-2" onclick="window.location.href='${cp}kallery'">목록</button>
		            <button type="button" class="btn btn-secondary ${post==null ? 'btn-add':'btn-modi'} " > ${post==null ? '등록':'수정'}</button>
		        </div>
			</form>
			
		</main>
		
<%-- 		<jsp:include page="../common/footer.jsp"/> --%>
		<script>
		 
		
		 $(document).ready(function() {
			 console.log($("#writer").val());
			if($("#writer").val()==""){
				const cookieValue = Cookies.get('userId');
			    if (cookieValue) {
			    	$("#writer").val(cookieValue);
			    	$(".write-view").text(cookieValue);
			    } else {
			        console.log('remember-id 쿠키가 존재하지 않습니다.');
			    }	
			}
			
			 
			 
			$("#title").on("input", function(){
				$(".title-preview").text($(this).val());
				
			});
			$("#content").on("input", function(){
				$(".content-preview").text($(this).val());
				
			});
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
			
			/* 추가 */
			$(".btn-add").click(function(){
				const title = $("#title").val();
				const sendImg = $("#sendImg").val();
				const tmp = $("#content").val();
				const userId = $("#writer").val();
				
				if(sendImg==""){
					alert("이미지를 넣어주세요.");
					return;
				}
				
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
			});
			
			/* 수정 */
			$(".btn-modi").click(function(){
				const title = $("#title").val();
				const sendImg = $("#sendImg").val();
				const tmp = $("#content").val();
				const userId = $("#writer").val();
				const pno = $("#pno").val();
				
				if(sendImg==""){
					alert("이미지를 넣어주세요.");
					return;
				}
				
				const data = {
						title, userId,
						pno,
						cno : 2,
						content : sendImg + "&%$^&" + tmp
				}
				
				console.log(data);
				
				$.ajax({
		            url: "${cp}/kallery/modify",
		            type: "post",
		            contentType: "application/json; charse=utf-8",
		            data: JSON.stringify(data),
		            success: function (res) {
		                if(res.status=='success'){
		                	alert("수정 하셨습니다.");
		                	location.href = ${cp}+"kallery";
		                }else{
		                	alert("수정에 실패하셨습니다.");
		                }
		            },
		            error: function () {
		                alert("서버에서 오류가 발생했습니다.");
		            }
		        });                
			});
			
		});
		</script>
	</body>
</html>