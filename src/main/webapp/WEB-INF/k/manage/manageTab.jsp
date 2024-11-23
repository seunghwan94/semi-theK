<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
    <li class="nav-item"><a class="nav-link ${tab=='u'? 'active' : '' }" href="${cp}manage/user">유저</a></li>
    <li class="nav-item"><a class="nav-link ${tab=='m'? 'active' : '' }" href="${cp}manage/menu">메뉴</a></li>
    <li class="nav-item"><a class="nav-link ${tab=='t'? 'active' : '' }" href="${cp}manage/taboo">Taboo</a></li>
    <li class="nav-item"><a class="nav-link ${tab=='t'? 'active' : '' }" href="#">공지사항</a></li>
</ul>