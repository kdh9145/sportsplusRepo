<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="content" class="container">
    <div class="row">
        <div class="col my-5">
        	
        	<div class="row my-3">
        		<div class="col text-center">
        			<h1 class="fw-bold">로그인</h1>
        		</div>
        	</div>
        	
        	<form class="row my-3" name="loginForm" action="loginProcess" method="post">
        		<div class="col text-center">
        		
        			<div class="my-2 text-end" id="keepLoginCheckBox">
						<input class="form-check-input shadow-none" type="checkbox"  name="keepLogin" value="keepLoggedIn" id="flexCheckDefault">
						<label class="form-check-label me-2" for="flexCheckDefault">로그인 유지</label>
					</div>
					
					<div class="form-floating mb-3">
						<input type="text" placeholder="" name="id" id="idInput" class="shadow-none border-0 form-control loginInput">
						<label for="idInput" class="loginLabel">아이디</label>
					</div>
					<div class="form-floating">
						<input type="password" placeholder="" name="pass" id="passInput" class="shadow-none border-0 form-control mt-3 loginInput">
						<label for="passInput" class="loginLabel">비밀번호</label>
					</div>
					
					<div class="mt-3">
						<input type="submit" class="btn btn-lg shadow-none btn-dark" id="loginBtn" value="로그인">
					</div>
					
					<div class="my-3" style="width : 20vw; margin:auto;">
						<div class="row">
							<div class="col-auto ps-3">
								<a class="fw-bold text-dark" href="join">회원가입</a>
							</div>
							<div class="col text-end">
								<a class="fw-bold text-dark" href="idFind">아이디찾기</a>
								<span class="mx-1">/</span>
								<a class="fw-bold text-dark" href="idFind">비밀번호찾기</a>
							</div>
						</div>
					</div>
					
        		</div>
        	</form>
        	
        </div>
    </div>
</div>