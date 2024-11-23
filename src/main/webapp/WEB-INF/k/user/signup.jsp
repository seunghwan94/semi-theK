<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form method="post" action="signup">
	<div class="modal-body">
		<input type="email" class="form-control my-3" id="useremail" placeholder="사용 할 이메일" name="useremail">
		<div class="input-group mb-3">
			<input type="text" class="form-control" placeholder="이메일" aria-label="이메일" aria-describedby="button-addon2">
			<button class="btn btn-secondary" type="button" id="button-addon2">이메일 발송</button>
		</div>
		<div class="input-group mb-3">
			<input type="text" class="form-control" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2" name="att">
			<button class="btn btn-secondary" type="button" id="button-addon2">확인</button>
		</div>
		<input type="password" class="form-control my-3" id="email" placeholder="비밀번호" name="pwd"> <input type="password"
			class="form-control my-3" id="email" placeholder="비밀번호 확인" name="pwd">
		<input type="text" class="form-control my-3" id="nickname" placeholder="닉네임" name="nickname">
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-dark">가입하기</button>
		<button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소하기</button>
	</div>
</form>

