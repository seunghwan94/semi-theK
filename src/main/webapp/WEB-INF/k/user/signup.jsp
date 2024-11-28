<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="signup-view d-none">
<form method="post" action="signup">
	<div class="modal-body">
	
		<div class="input-group mb-3">
			<input type="email" class="form-control my-3" id="signUpEmail2" placeholder="사용 할 이메일" name="useremail">
			<button class="btn btn-secondary my-3" type="button" id="button-sign-email">이메일 발송</button>
		</div>
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="emailCheck" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2" name="att">
			<button class="btn btn-secondary" type="button" id="button-sign-email-check">확인</button>
		</div>
			<input type="password" class="form-control my-3" id="pwd1" placeholder="비밀번호" name="pwd"> 
			<input type="password" class="form-control my-3" id="pwd2" placeholder="비밀번호 확인" name="pwd">
		<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
		<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			<input type="text" class="form-control my-3" id="nickname" placeholder="닉네임" name="nickname">
	</div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-dark">가입하기</button>
			<button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소하기</button>
		</div>

</form>
</div>
<script src="${cp}js/emailcheck.js"></script>
<script type="text/javascript">

$(function () {
	$("#consentok").click(function() {
		$(".ucs-view").addClass("d-none");
		$(".signup-view").removeClass("d-none");
		
		//비밀번호 일치 여부
		$("#alert-success").addClass("d-none");
        $("#alert-danger").addClass("d-none");
        $("input").keyup(function(){      	
            var pwd1=$("#pwd1").val();
            var pwd2=$("#pwd2").val();
            if(pwd1 != "" || pwd2 != ""){
            	if(pwd1 == pwd2){
            		
	            	
	             $("#alert-success").removeClass("d-none");
	             $("#alert-danger").addClass("d-none");
	             $("#submit").removeAttr("disabled");
	            }else{
	             	$("#alert-success").addClass("d-none");
	                $("#alert-danger").removeClass("d-none");
	                $("#submit").attr("disabled", "disabled");
           		 } 
            }  
        })
        //인증번호 이메일 전송
        $("#button-sign-email").click(function (){
			const emailcheck = $("#signUpEmail2").val();
			console.log(emailcheck);
			alert("이메일 전송");
			const url = "${cp}useremail";
			const data = JSON.stringify({emailcheck});
			$.post({ url, data })
			.done(function(data){})
		
		});	
        //이메일 확인
        $("#button-sign-email-check").click(function () { //emc가 인증번호 입력한거
			const emc = $("#emailCheck").val();
			console.log(emc);
		 	const url = "${cp}useremail"
		 	const email = $("#signUpEmail2").val();
			const data = {"email":email ,"att":emc};
			$.ajax ({
				url : "${cp}useremail",
				type : "get",
				contentType: "application/json; charse=utf-8",
				data : data,
				success : function (data){
					if(data == "success"){
						alert("인증완료");
						$("#button-sign-email-check").hide();
					}else{
					alert("인증번호가 다릅니다.");
					}
					
				},
                error: function () {
                    alert("서버에서 오류가 발생했습니다.");
                }
			})
			
		})
        
		
	})
})
  
        

    
	


    
</script>
​
