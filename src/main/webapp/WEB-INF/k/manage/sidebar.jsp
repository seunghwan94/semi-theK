<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="nav flex-column nav-pills me-3 col-auto col-sm-3 col-md-2 col-xl-1" id="v-pills-tab" role="tablist" aria-orientation="vertical">
    <div class="container-fluid ps-4 pt-3 m-2 text-center">
        <a class="navbar-brand" href="#">
          <img src="${cp}files/common/light_logo.png" class="w-50 m-3" alt="1">
        </a>
    </div>
    <div class="text-center">
        <a class="nav-link w-100 m-3 ${menu == 'home'? 'active' : '' }" href="${cp}manage/home">
            <i class="fa-solid fa-house pe-2"></i><span>home</span>
        </a>
        <a class="nav-link w-100 m-3 ${menu == 'statistics'? 'active' : '' }" href="${cp}manage/statistics">
            <i class="fa-solid fa-bullhorn pe-2"></i><span>통계</span>
        </a>
        <a class="nav-link w-100 m-3 ${menu == 'manage'? 'active' : '' }" href="${cp}manage/user">
            <i class="fa-solid fa-chart-simple pe-2"></i><span>관리</span>
        </a>
        <a class="nav-link w-100 m-3 ${menu == 'qna'? 'active' : '' }" href="${cp}manage/qna">
            <i class="fa-regular fa-comment-dots pe-2"></i><span>Q & A</span>
        </a>
    </div>
</div>