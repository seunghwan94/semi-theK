<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<form method="post" action="signup" name="joinForm">
	<div class="modal-body">
	
		<div class="input-group mb-3">
			<input type="email" class="form-control my-3" id="signUpEmail2" placeholder="사용 할 이메일" name="useremail">
			<button class="btn btn-secondary my-3" type="button" id="button-sign-email">이메일 발송</button>
		
		</div>
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="emailCheck" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2" name="att"  >
			<button class="btn btn-secondary" type="button" id="button-sign-email-check"  >확인</button>
		</div>
			<input type="password" class="form-control my-3" id="pwd1" placeholder="비밀번호" name="pwd"  > 
			<input type="password" class="form-control my-3" id="pwd2" placeholder="비밀번호 확인" name="pwd"  >
			<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control " id="nickname" placeholder="닉네임" name="nickname">
				<button class="btn btn-secondary" type="button" id="button-sign-nick-check">확인</button>
			</div>
		</div>
		<div class="modal-footer">
			<button type="submit" id="signup-button" class="btn btn-dark">가입하기</button>
			<button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소하기</button>
		</div>

</form>
<script src="${cp}js/emailcheck.js"></script>
<script type="text/javascript">



$(function () {
	
	var form = document.joinForm;
	let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	let hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/
	
	let token = false;
	let etoken = false;
	let ntoken = false;
	
		
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
				const url = "${cp}useremail";
				const data = JSON.stringify({emailcheck});
				$.post({ url, data })
				.done(function(data){
					if(data.status=='success'){						
						alert("이메일 발송");
						token=true;
						$("#button-sign-email").hide();
						console.log(data);
					}else{
						alert("이메일 발송 실패 (중복된 아이디 입니다.)");
						token=false;
					}
					
				})
			
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
							etoken=true;
							$("#button-sign-email-check").hide();
						}else{
						alert("인증번호가 다릅니다.");
						etoken=false;
						}
					},
	                error: function () {
	                    alert("서버에서 오류가 발생했습니다.");
	                }
				})
				
			})
			//닉네임 중복 여부 확인
			 $("#button-sign-nick-check").click(function () { 
				const emc = $("#nickname").val();
				console.log(emc);
			 	const url = "${cp}signup"
			 	const nickname = $("#nickname").val();
				const data = {"nickName":nickname};
				$.ajax ({
					url : "${cp}signup",
					type : "get",
					contentType: "application/json; charse=utf-8",
					data : data,
					success : function (data){
						if(data == "success"){
							alert("사용 가능한 닉네임");
							ntoken=true;
							$("#button-sign-nick-check").hide();
							
						}else{						
							alert("이미 사용중");
							ntoken=false;
						}
						
					},
				})
				
			})
			$("#signup-button").click(function join() {
				if(!form.signUpEmail2.value){
					alert("아이디를 입력해주세요");
					form.signUpEmail2.focus();
					return false;
				}
				if(!form.pwd1.value){
					alert("비밀번호를 입력해주세요. (비밀번호는 8자리 이상이어야 하며, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.)");
					form.pwd1.focus();
					return false;
				}
				if(!reg.test(form.pwd1.value)){
					alert("비밀번호는 8자리 이상이어야 하며, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.");
					form.pwd1.focus();
					return false;
				}
				if(form.pwd1.value.search(/\s/) != -1){
					alert("비밀번호에 공백 없이 입력해주세요.");
					form.pwd1.focus();
					return false;
				}
				//비밀번호와 비밀번호 확인 값이 같은지 확인
				if(form.pwd1.value != form.pwd2.value){
					alert("비밀번호가 다릅니다.");
					form.pwd2.focus();
					return false;
				}
				if(token==false){
					alert("이메일 인증을 확인을 해주세요.");
					return false;
				}
				if(etoken==false){
					alert("이메일 번호을 확인을 해주세요.");
					return false;
				}	
				if(ntoken==false){
					alert("닉네임을 확인을 해주세요.");
					return false;
				}
			})			
	
	})
})
  
        

    
	


    
</script>
​
