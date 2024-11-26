<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<jsp:include page="../common/head.jsp"/>
<link rel='stylesheet'href='${cp}css/user.css'>
</head>
	<form method="post" action="userconsent">
		<div class="modal-body">
			
		</div>
		
		<div class="modal-footer">
			<button class="btn btn-dark">확인</button>
			<button type="button" class="btn btn-dark" data-bs-dismiss="modal">취소</button>
		</div>
	</form>
</html>