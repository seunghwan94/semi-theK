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
   
        <ul class="nav nav-tabs " id="myTab" role="tablist">
		  <li class="nav-item" role="presentation">
		    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Home</button>
		  </li>
		 <!--  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button>
		  </li> -->
		</ul>
		<div class="tab-content" id="myTabContent">
			<jsp:include page="mypage.jsp"/>
	   </div>
	 <%--  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
	  	<jsp:include page="gradechange.jsp"/>
	  </div> --%>

        
         
        
        
</body>
</html>