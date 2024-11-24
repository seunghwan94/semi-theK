<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<jsp:include page="../common/head.jsp"/>
<%-- <link rel='stylesheet'href='${cp}css/user.css'> --%>
</head>

<body class="gothic-a1-regular">
    <nav class="navbar navbar-light bg-light">
        <form class="container-fluid justify-content-start">
          <button class="btn btn-outline-success me-2" type="button">마이페이지</button>
          <button class="btn btn-sm btn-outline-secondary" type="button">등급 변경 신청</button>
        </form>
      </nav>
    <form class="container-fluid col-sm-12 col-md-10 col-lg-10">
        <div class="d-flex rounded float-start">
            <img class="" src="${cp}files/common/user.png">
            <div>
                <button class="btn btn-secondary my-3" type="button" id="button-addon2">프로필 사진 변경</button>
            </div>
        </div>
        <div class="wrap">
            <div>
                <div class= "input-group">
                    <input type="text" class="form-control my-3" placeholder="닉네임" aria-label="이메일 인증" aria-describedby="button-addon2" name="att">
                    <button class="btn btn-secondary my-3" type="button" id="button-addon2">닉네임 변경</button>
            	</div>
            </div>	
            <div>
                <input type="password" class="form-control my-3" id="pwd" placeholder="이메일" name="pwd">
            </div>
            <div>   
                <div class="input-group">
                    <input type="text" class="form-control my-3" id="nickname" placeholder="등급" name="nickname">
                    <input type="text" class="form-control my-3" placeholder="성별" aria-label="이메일 인증" aria-describedby="button-addon2" name="att">
                    <button class="btn btn-secondary my-3" type="button" id="button-addon2">성별 변경</button>
            	</div>
	            <div>
	                <input type="text" class="form-control my-3" id="nickname" placeholder="소개" name="nickname">
	            </div>
	            <div>   
	                <input type="text" class="form-control my-3" id="nickname" placeholder="팔로잉" name="nickname">
	                <input type="text" class="form-control my-3" id="nickname" placeholder="팔로워" name="nickname">
	            </div>  
	         </div> 
        </div>
    </form>  
    
    
        <div class="container-fluid col-sm-12 col-md-10 col-lg-10 mt-5">
            <div>
                <input type="text" class="form-control my-3" id="nickname" placeholder="이름" name="nickname">
                <input type="text" class="form-control my-3" id="nickname" placeholder="지역" name="nickname">
            </div>
            <div>
                <input type="text" class="form-control my-3" id="nickname" placeholder="등급" name="nickname">
            </div>
        </div>
        <div class="d-flex justify-content-between p-2">
            <button class="btn btn-secondary" type="button" id="button-addon2">Language</button> 
            <button class="btn btn-danger" type="button" id="button-addon2">회원 탈퇴</button>
        </div>        
</body>
</html>