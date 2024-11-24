<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"	/>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<main class="container mt-5">
        <h2 class="my-4 fw-bold">POSTS</h2>
        <table class="table table-hover text-center">
            <thead class="border-bottom border-light">
                <tr>
                    <th style="width: 10%;"> 글 번호 </th>
                    <th> 제목 </th>
                    <th style="width: 15%;"> 작성자 </th>
                    <th style="width: 15%;"> 날짜 </th>
                    <th style="width: 10%;"> 조회수 </th>
                    <th style="width: 10%;"> 댓글 </th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>1</td>
                    <td><a href="#" class="text-decoration-none">titleSample</a></td>
                    <td><button type="button" class="btn text-decoration-none post-writer" data-bs-toggle="popover" title="${cp}Profile Info" data-bs-content="${cp}프로필 정보">writer</button></td>
                    <td>2024/11/07</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="#" class="text-decoration-none">titleSample</a></td>
                    <td><button type="button" class="btn text-decoration-none post-writer" data-bs-toggle="popover" title="Profile Info" data-bs-content="프로필 정보">writer</button></td>
                    <td>2024/11/07</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="#" class="text-decoration-none">titleSample</a></td>
                    <td><button type="button" class="btn text-decoration-none post-writer" data-bs-toggle="popover" title="Profile Info" data-bs-content="프로필 정보">writer</button></td>
                    <td>2024/11/07</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="#" class="text-decoration-none">titleSample</a></td>
                    <td><button type="button" class="btn text-decoration-none post-writer" data-bs-toggle="popover" title="Profile Info" data-bs-content="프로필 정보">writer</button></td>
                    <td>2024/11/07</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="#" class="text-decoration-none">titleSample</a></td>
                    <td><button type="button" class="btn text-decoration-none post-writer" data-bs-toggle="popover" title="Profile Info" data-bs-content="프로필 정보">writer</button></td>
                    <td>2024/11/07</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="#" class="text-decoration-none">titleSample</a></td>
                    <td><button type="button" class="btn text-decoration-none post-writer" data-bs-toggle="popover" title="Profile Info" data-bs-content="프로필 정보">writer</button></td>
                    <td>2024/11/07</td>
                    <td>0</td>
                    <td>0</td>
                </tr>
                </tbody>
        </table>
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </main>
	<jsp:include page="../common/footer.jsp"/>
</body>
<script src="${cp}js/profilecard.js"></script>
</html>