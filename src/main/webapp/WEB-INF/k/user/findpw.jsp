<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form method="post" action=findpw>
    <div class="modal-body">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="이메일" aria-label="이메일" aria-describedby="button-addon2">
          <button class="btn btn-secondary" type="button" id="button-addon2">이메일 발송</button>
        </div>
          <div class="input-group mb-3">
	          <input type="text" class="form-control" placeholder="이메일 인증" aria-label="이메일 인증" aria-describedby="button-addon2">
	          <button class="btn btn-secondary" type="button" id="button-addon2">확인</button>
	       </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-dark">확인</button>
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
  </div>
</form>