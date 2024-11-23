<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<jsp:include page="../common/head.jsp"/>
<link rel='stylesheet'href='css/user.css'>
</head>

<body class="gothic-a1-regular">
	<div>
		<video src="${cp}files/common/k_intro.mp4" muted autoplay playsinline></video>
		<div class="class-box text-center">
			<p class="fs-1" style="color: #fff;">한국 여행 어디든</p>
			<div>
				<button type="button" id="signin"
					class="login-box btn btn-light w-100 m-0" data-bs-toggle="modal"
					data-bs-target="#signinModal">로그인</button>
					
				<div class="d-flex justify-content-between">
					<button type="button" id="id_pw" class="btn text-secondary p-0"
						data-bs-toggle="modal" data-bs-target="#id_pwModal">아이디/비밀번호
						찾기</button>
					<button type="button" id="signup" class="btn text-secondary p-0"
						data-bs-toggle="modal" data-bs-target="#signupModal">회원가입</button>
					

					<!--로그인 버튼시 -->		
						<div class="modal fade" id="signinModal" 
							aria-labelledby="exampleModalLabel" aria-hidden="false">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
								<div class="modal-header d-flex justify-content-center">
				                    <img class="w-25" src="${cp}files/common/dark_logo.png">
				                </div>
								<jsp:include page="signin.jsp" />			
								</div>
							</div>
						</div>		
					<!--비밀번호찾기 버튼시 -->
						<div class="modal fade" id="id_pwModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="false">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
								<div class="modal-header d-flex justify-content-center">
				                    <img class="w-25" src="${cp}files/common/dark_logo.png">
				                </div>
								<jsp:include page="findpw.jsp" />									
								</div>
							</div>
						</div>
					<!--회원가입 버튼시 -->	
					<div class="gothic-a1-regular">
						<div class="modal fade" id="signupModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="false">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
								<div class="modal-header d-flex justify-content-center">
				                    <img class="w-25" src="${cp}files/common/dark_logo.png">
				                </div>
								<jsp:include page="signup.jsp" />			
								</div>
							</div>
						</div>
					</div>							
				</div>
			</div>
		</div>
	</div>
</body>

</html>