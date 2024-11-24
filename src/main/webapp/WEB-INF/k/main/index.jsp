<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"/>
	<link rel='stylesheet'href='css/indexbxslider.css'>
	<link rel='stylesheet'href='css/style.css'>
</head>
<body class="bg-dark">
	<jsp:include page="../common/header.jsp"/>
	<hr>
    <main class="container my-5 mx-auto p-3 justify-content-center">
        <div id="slide-container">
            <ul class="bxslider1">
            <c:forEach var="u" begin="1" end="5" >
            	<li>
  					<img src="https://placehold.co/1300x250?text=Slider+${u}"/>          	
            	</li>
            </c:forEach>
            </ul>
		</div>
            <div class="container-fluid mt-5 p-2 mx-auto text-center">
	            <div class="row">
	                <div class="col-sm-5 p-3">
                    	<hr class="text-light">
	                    <b><a href="#" class="p-2 mt-4 big text-light">${cp}시판</a></b>
	                    <hr class="text-light">
                   		<c:forEach var="p" begin="1" end="5">
	                    	<ul class="p-0">
		                    	<li>
		                    		<div class="row p-2 border-bottom mx-auto text-light">
		                    			<div class="col-sm-1 small">
		                    				<d class="small">${p}</d>
		                    			</div>
										<div class="col-sm-6 text-truncate">
		                                    <a href="#" class="text-light"><d class="small">제목제목제목제목제목제목제목제목제목제목</d></a>
		                                </div>
										<div class="col-sm-1">
		                                    <a href="#" class="text-light"><d class="small">[10]</d></a>
		                                </div>
		                                <div class="col-sm-2">
		                                    <a href="#" class="text-light"><d class="small"><i class="fa-solid fa-heart small">:${p}</i></d></a>
		                                </div>
		                                <div class="col-sm-2 small">
		                                    <a href="#" class="text-light"><d class="small">2020020${p}</d></a>
		                                </div>
		                    		</div>
		                    	</li>
   		                    </ul>
                   		</c:forEach>
           			</div>
	                <div class="col-sm-2"></div>
   	                <div class="col-sm-5 p-3">
                     	<hr class="text-light">
	                    <b><a href="#" class="p-2 mt-4 text-light big">${cp}시판</a></b>
	                    <hr class="text-light">
						<c:forEach var="p" begin="1" end="5">
	                    	<ul class="p-0">
		                    	<li>
		                    		<div class="row p-2 border-bottom mx-auto text-light">
		                    			<div class="col-sm-1 small">
		                    				<d class="small">${p}</d>
		                    			</div>
										<div class="col-sm-6 text-truncate">
		                                    <a href="#" class="text-light"><d class="small">제목제목제목제목제목제목제목제목제목제목</d></a>
		                                </div>
										<div class="col-sm-1">
		                                    <a href="#" class="text-light"><d class="small">[10]</d></a>
		                                </div>
		                                <div class="col-sm-2">
		                                    <a href="#" class="text-light"><d class="small"><i class="fa-solid fa-heart small">:${p}</i></d></a>
		                                </div>
		                                <div class="col-sm-2 small">
		                                    <a href="#" class="text-light"><d class="small">2020020${p}</d></a>
		                                </div>
		                    		</div>
		                    	</li>
   		                    </ul>
                   		</c:forEach>
           			</div>
       			</div>
	            <div class="justify-content-center text-center">
					<ul class="bxslider2">
						<c:forEach var="s" begin="1" end="8">
						    <li class="text-start"><a><img src="https://placehold.co/170x200?text=gallery+${s}"/></a></li>
						</c:forEach>
					</ul>
           		</div>
           		<div class="row">
	                <div class="col-sm-5 p-3">
                    	<hr class="text-light">
	                    <b><a href="#" class="p-2 mt-4 text-light big">${cp}시판</a></b>
	                    <hr class="text-light">
                   		<c:forEach var="p" begin="1" end="5">
	                    	<ul class="p-0">
		                    	<li>
		                    		<div class="row p-2 border-bottom mx-auto text-light">
		                    			<div class="col-sm-1 small">
		                    				<d class="small">${p}</d>
		                    			</div>
										<div class="col-sm-6 text-truncate">
		                                    <a href="#" class="text-light"><d class="small">제목제목제목제목제목제목제목제목제목제목</d></a>
		                                </div>
										<div class="col-sm-1">
		                                    <a href="#" class="text-light"><d class="small">[10]</d></a>
		                                </div>
		                                <div class="col-sm-2">
		                                    <a href="#" class="text-light"><d class="small"><i class="fa-solid fa-heart small">:${p}</i></d></a>
		                                </div>
		                                <div class="col-sm-2 small">
		                                    <a href="#" class="text-light"><d class="small">2020020${p}</d></a>
		                                </div>
		                    		</div>
		                    	</li>
   		                    </ul>
                   		</c:forEach>
           			</div>
	                <div class="col-sm-2"></div>
   	                <div class="col-sm-5 p-3">
                     	<hr class="text-light">
	                    <b><a href="#" class="p-2 mt-4 text-light big">${cp}시판</a></b>
	                    <hr class="text-light">
						<c:forEach var="p" begin="1" end="5">
	                    	<ul class="p-0">
		                    	<li>
		                    		<div class="row p-2 border-bottom mx-auto text-light">
		                    			<div class="col-sm-1 small">
		                    				<d class="small">${p}</d>
		                    			</div>
										<div class="col-sm-6 text-truncate">
		                                    <a href="#" class="text-light"><d class="small">제목제목제목제목제목제목제목제목제목제목</d></a>
		                                </div>
										<div class="col-sm-1">
		                                    <a href="#" class="text-light"><d class="small">[10]</d></a>
		                                </div>
		                                <div class="col-sm-2">
		                                    <a href="#" class="text-light"><d class="small"><i class="fa-solid fa-heart small">:${p}</i></d></a>
		                                </div>
		                                <div class="col-sm-2 small">
		                                    <a href="#" class="text-light"><d class="small">2020020${p}</d></a>
		                                </div>
		                    		</div>
		                    	</li>
   		                    </ul>
                   		</c:forEach>
           			</div>
       			</div>
			</div>
	</main>
<jsp:include page="../common/footer.jsp"/>
</body>
<script src="${cp}js/bxsliderindex.js"></script>
</html>
