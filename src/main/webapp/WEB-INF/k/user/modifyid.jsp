<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form method="post" action=modifypw>
    <div class="modal-body">
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="signUpEmail" placeholder="이메일" aria-label="이메일" aria-describedby="button-addon2">
          <button class="btn btn-secondary" type="button" id="button-modify-email">이메일 발송</button>
        </div>
          <div class="input-group mb-3">
	          <input type="text" class="form-control" id="userid" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2">
	          <button class="btn btn-secondary" type="button" id="button-modify-check">확인</button>
	       </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-dark">확인</button>
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
  </div>
</form>

<script>
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
})
$(function (){
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
})		
</script>