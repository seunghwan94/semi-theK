<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<form method="post" action="signin">
		<div class="modal-body">
			<input type="email" class="form-control my-3" id="signinemail"  value="${cookie['remember-id'].value}" placeholder="이메일" name="useremail">
			<input type="password" class="form-control my-3" id="signin-pwd" placeholder="비밀번호" name="pwd">
			<div class="form-check form-switch my-3">
               <input class="form-check-input" type="checkbox" id="mySwitch" name="remember-id" value="yes" ${empty cookie['remember-id'] ? '' : 'checked'}>
               <label class="form-check-label" for="mySwitch">아이디 기억</label>
        	</div>	
		</div>
		
		<div class="modal-footer">
			<button type="button" id = "signin-button" class="btn btn-dark">확인</button>
			<button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
		</div>
	</form>
	
	<script>
			$(function() {
				$("#signin-button").click(function() {
					const signinpw = $("#signin-pwd").val();
					const signinid = $("#signinemail").val();
				 	
					const data = {"id":signinid,"pw":signinpw};
				 	
					$.ajax ({
						url : "${cp}signin",
						type : "post",
						contentType: "application/json; charse=utf-8",
						 data: JSON.stringify(data),
						success : function (data){
							console.log(data);
							if(data.status == "success2"){
								location.href="index";
							}else if(data.status == "success"){
								location.href="indexIntro";
							}else{						
								alert("없는 회원입니다.");								
							}
						}	
					})
				})
			})
	</script>