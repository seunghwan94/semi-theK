<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"	/>
	<link rel='stylesheet'href='css/indexbxslider.css'>
	<link rel='stylesheet'href='css/style.css'>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<hr>
    <div class="expand-sm bg-light" style="height: 30%;">
    </div>
    <main class="container my-5 mx-auto p-2 justify-content-center">
        <div id="slide-container">
            <ul class="bxslider1">
                <li>
                    <img src="http://placehold.it/1220x300&text=Slide-One" />
                </li>
                <li>
                    <img src="http://placehold.it/1220x300&text=Slide-Two" />
                </li>
                <li>
                    <img src="http://placehold.it/1220x300&text=Slide-Three" />
                </li>
                <li>
                    <img src="http://placehold.it/1220x300&text=Slide-Four" />
                </li>
                <li>
                    <img src="http://placehold.it/1220x300&text=Slide-Five" />
                </li>
                <li>
                    <img src="http://placehold.it/1220x300&text=Slide-Six" />
                </li>
            </ul>
        </div>
     </main>
<footer class="container-fluid fixed-bottom bg-dark text-center text-light">
    <address class="small"><i>푸터푸터푸터</i> ${cp} </address>
    <d class="small"><i>copyrights All rights resereved &copy;</i></d>
</footer>
</body>
<script src="${cp}js/bxsliderindex.js"></script>
</html>
