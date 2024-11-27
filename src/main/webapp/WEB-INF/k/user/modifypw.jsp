<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action=modifypw>
    <div class="modal-body">    
          <input type="text" class="form-control" id="changepw1" placeholder="이메일" aria-label="이메일" aria-describedby="button-addon2">
          <div class="input-group mb-3">
	          <input type="text" class="form-control" id="changepw2" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2">
	          <button class="btn btn-secondary" type="button" id="button-modify-check">비밀번호 확인</button>
	       </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-dark">확인</button>
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
   </div>
</form>
<script>
$(function(){
    $("#alert-success").hide();
    $("#alert-danger").hide();
    $("input").keyup(function(){      	
        var pwd1=$("#changepw1").val();
        var pwd2=$("#changepw2").val();
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
</script>