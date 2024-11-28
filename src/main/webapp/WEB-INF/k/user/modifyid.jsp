<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form method="post" action=modifyid>
    <div class="modal-body">
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="signUpEmail" name="modifyemail" placeholder="이메일" aria-label="이메일" aria-describedby="button-addon2">
          
          <button class="btn btn-secondary" type="button" id="button-modify-email">이메일 발송</button>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="userid" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2">
          <button class="btn btn-secondary" type="button" id="button-modify-check">확인</button>
	    </div>
	        <input type="password" class="form-control my-3" id="pwd3" placeholder="비밀번호" name="pwd"> 
			<input type="password" class="form-control my-3" id="pwd4" placeholder="비밀번호 확인" name="pwd">
			<div class="alert alert-success" id="alert-success1">비밀번호가 일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger1">비밀번호가 일치하지 않습니다.</div>
    </div>

    <div class="modal-footer">
        <button type="submit" id="modifyclick" class="btn btn-dark">확인</button>
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
  </div>
</form>

<script>
//이메일 전송
$(function(){
	$("#button-modify-email").click(function(){
		const emailcheck =$("#signUpEmail").val();
		console.log(emailcheck);
		alert("이메일 전송")
		const url="${cp}useremail";
		const data = JSON.stringify({emailcheck});
		$.post({url , data})
			.done(function(data){})		
		
	})
	//이메일 인증확인
	$("#button-modify-check").click(function () { //emc가 인증번호 입력한거
		const emc = $("#userid").val();
		console.log(emc);
	 	const url = "${cp}useremail"
	 	const email = $("#signUpEmail").val();
		const data = {"email":email ,"att":emc};
		$.ajax ({
			url : "${cp}useremail",
			type : "get",
			contentType: "application/json; charse=utf-8",
			data : data,
			success : function (data){
				if(data == "success"){
					alert("인증완료");
					$("#button-modify-check").hide();
				}else{
				alert("인증번호가 다릅니다.");
				}					
			},
               error: function () {
                   alert("서버에서 오류가 발생했습니다.");
               }
		})
	})
	//비밀번호 일치 여부
	$("#alert-success1").hide();
    $("#alert-danger1").hide();
    $("input").keyup(function(){      	
        var pwd1=$("#pwd3").val();
        var pwd2=$("#pwd4").val();
        if(pwd1 != "" || pwd2 != ""){
        	if(pwd1 == pwd2){
        		
         	
	          $("#alert-success1").show();
	          $("#alert-danger1").hide();
	          $("#submit").removeAttr("disabled");
	         }else{
	          	$("#alert-success1").hide();
	             $("#alert-danger1").show();
	             $("#submit").attr("disabled", "disabled");     
	         } 
        }  
    });
   
})

</script>