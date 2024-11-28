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
   
     <!--  <form class="container-fluid justify-content-start"> -->
       <div class= "row">
        <div class= "col-6 card p-0">
          <button class="btn btn-outline-success me-2 w-100" type="button" style="margin:0px">마이페이지</button>
        </div>
        <div class="col-6 card p-0 ">
          <button class="btn btn-sm btn-outline-secondary me-2 w-100 h-100" style="margin:0px ;"type="button">등급 변경 신청</button>
         </div>
        </div>
<!--       </form> -->
<!-- 
    <form class="container-fluid col-sm-12 col-md-10 col-lg-10">
        </form>   -->
        
        <div class="d-flex justify-content-center">
	        <div class="d-flex rounded float-start flex-column ">
	            <img class="w-25" src="${cp}files/common/user.png">
	          	<div>
	          		<button class="btn btn-secondary my-3" type="button" id="button-addon2">프로필 사진 변경</button>
	          	</div>
	       	</div>
	       	<div>
		      	<div class="input-group flex-nowrap">
					  <span class="input-group-text" id="addon-wrapping">@</span>
					  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				<div class="input-group flex-nowrap">
					  <span class="input-group-text" id="addon-wrapping">@</span>
					  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				<div class="input-group flex-nowrap">
					  <span class="input-group-text" id="addon-wrapping">@</span>
					  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				<div class="input-group flex-nowrap">
					  <span class="input-group-text" id="addon-wrapping">@</span>
					  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
				</div>
			</div>
				
		</div>
    
    
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