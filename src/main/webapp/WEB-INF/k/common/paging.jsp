<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="">
	<ul class="pagination justify-content-center my-5">
		<c:if test="${pageDto.doublePrev}">
			<li class="page-item"><a class="page-link" href="${currentPage}?page=${pageDto.startPage-1}&${pageDto.cri.qs}"><i class="fa-solid fa-angles-left"></i></a></li>
		</c:if>
		<c:if test="${pageDto.prev}">
			<li class="page-item"><a class="page-link" href="${currentPage}?page=${pageDto.cri.page-1}&${pageDto.cri.qs}"><i class="fa-solid fa-angle-left"></i></a></li>
		</c:if>
			
		<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}" var="page">
			<li class="page-item ${page == pageDto.cri.page ? 'active' : ''}"><a class="page-link" href="${currentPage}?page=${page}&amount=${pageDto.cri.amount}&category=${pageDto.cri.category}" >${page}</a></li>
		</c:forEach>
			
		<c:if test="${pageDto.next}">
			<li class="page-item"><a class="page-link" href="${currentPage}?page=${pageDto.cri.page+1}&${pageDto.cri.qs}"><i class="fa-solid fa-angle-right"></i></a></li>
		</c:if>
		<c:if test="${pageDto.doubleNext}">
			<li class="page-item"><a class="page-link" href="${currentPage}?page=${pageDto.endPage+1}&${pageDto.cri.qs}"><i class="fa-solid fa-angles-right"></i></a></li>
		</c:if>
	</ul>
</div>