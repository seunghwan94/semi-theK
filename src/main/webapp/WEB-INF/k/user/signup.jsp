<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form method="post" action="signup">
	<div class="modal-body">
		<div class="input-group mb-3">
			<input type="email" class="form-control my-3" id="signUpEmail" placeholder="사용 할 이메일" name="useremail">
			<button class="btn btn-secondary my-3" type="button" id="button-sign-email">이메일 발송</button>
		</div>
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="emailCheck" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2" name="att">
			<button class="btn btn-secondary" type="button"
				id="button-sign-email-check">확인</button>
		</div>
			<input type="password" class="form-control my-3" id="pwd1" placeholder="비밀번호" name="pwd1"> 
			<input type="password" class="form-control my-3" id="pwd2" placeholder="비밀번호 확인" name="pwd2">
		<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
		<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			<input type="text" class="form-control my-3" id="nickname" placeholder="닉네임" name="nickname">
	</div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-dark">가입하기</button>
			<button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소하기</button>
		</div>

</form>
<script src="${cp}js/emailcheck.js"></script>
<script type="text/javascript">

	
    $(function(){
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function(){      	
            var pwd1=$("#pwd1").val();
            var pwd2=$("#pwd2").val();
            if(pwd1 != "" || pwd2 != ""){
            	if(pwd1 == pwd2){
            		
	            	
	             $("#alert-success").show();
	             $("#alert-danger").hide();
	             $("#submit").removeAttr("disabled");
	            }else{
	             	$("#alert-success").hide();
	                $("#alert-danger").show();
	                $("#submit").attr("disabled", "disabled");
           		 } 
            }  
        });
    });
    
    
    //인증번호 이메일 전송
    $(function () {
		$("#button-sign-email").click(function (){
			const emailcheck = $("#signUpEmail").val();
			console.log(emailcheck);
			rndText(emailcheck,function(data) {
				console.log(data);
				alert("이메일 발송");

		
			});
		});
	});	
		const url = "/k/usermail";
		function rndText(mailsender,callback) {
			console.log(mailsender);
			const data = JSON.stringify(mailsender);
			$.post({ url, data })
				.done(function(data) {
					console.log(data);
					if (callback)
						callback(data);
	
				});
		};

    
</script>
​
