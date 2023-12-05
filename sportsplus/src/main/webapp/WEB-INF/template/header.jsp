<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar navbar-expand-lg bg-dark mb-5" id="navbar">
	<div class="container" id="container">
		<a class="navbar-brand fw-bold fs-3" href="newsMain"
			style="line-height: 30px;"> SportsPlus </a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item ms-2"><a class="nav-link" href="newsMain">처음화면</a></li>
				<li class="nav-item ms-2"><a class="nav-link" href="newsList?cat=all">전체기사</a></li>
				<li class="nav-item ms-2"><a class="nav-link" href="newsList?cat=baseball">국내야구</a></li>
				<li class="nav-item ms-2"><a class="nav-link" href="newsList?cat=worldBaseball">해외야구</a></li>
				<li class="nav-item ms-2"><a class="nav-link" href="newsList?cat=football">국내축구</a></li>
				<li class="nav-item ms-2"><a class="nav-link" href="newsList?cat=worldFootball">해외축구</a></li>
				<li class="nav-item ms-2"><a class="nav-link" href="newsList?cat=basketball">농구</a></li>
			</ul>
			<div id="searchBar" class="me-2">
				<input type="search" placeholder="검색어입력"
					class="form-control shadow-none" id="searchInput">
			</div>

			<div id="searchIcon" style="cursor: pointer;">
				<a>
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" 
				class="bi bi-search" viewBox="0 0 16 16">
	                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 
	                3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 
	                5.5 5.5 0 0 1 11 0z" />
                 </svg>
				</a>
			</div>
			<c:if test="${not sessionScope.isLogin}">
				<a href="login" class="ms-4">
					<span class="fs-5 fw-bold">로그인</span>
				</a>
				<a href=join class="ms-4">
					<span class="fs-5 fw-bold">회원가입</span>
				</a>
			</c:if>
			<c:if test="${sessionScope.isLogin}">
				<a href="memberUpdate" class="ms-4">
					<span class="fs-5 fw-bold">정보수정</span>
				</a>
				<a href="logout" class="ms-4">
					<span class="fs-5 fw-bold">로그아웃</span>
				</a>
			</c:if>
		</div>
	</div>
</div>