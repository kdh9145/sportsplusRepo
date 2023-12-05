<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="content" class="container">
    <div class="row">
        <div class="col my-5">
        	
        	<div class="row">
        		<div class="col my-3 text-center">
        			<h1 class="fw-bold">회원가입</h1>
        			<p>
        				<span>
        					회원이 되시면 SportsPlus의<br>
        					다양한 컨텐츠를 이용하실 수 있어요!
        				</span>
        			</p>
        		</div>
        	</div>
        	
        	<form class="row" id="joinForm" name="joinForm" action="joinProcess" method="post">
        		<div class="col">
        		
        			<div class="row justify-content-center">
        				<div class="col-4">
        					
        					<div class="form-floating my-3">
								<input type="text" placeholder="" name="name" id="joinNameInput" class="shadow-none border-0 form-control loginInput">
								<label for="joinNameInput" class="loginLabel">이름</label>
							</div>
		        			<div class="form-floating my-3 d-flex">
								<input type="text" placeholder="" name="id" id="joinIdInput" class="shadow-none border-0 form-control loginInputId">
								<label for="joinIdInput" class="loginLabel">아이디</label>
								<input type="button" id="overlapId" value="중복체크" class="btn btn-dark">
							</div>
							<div class="form-floating my-3">
								<input type="password" placeholder="" name="pass" id="joinPassInput" class="shadow-none border-0 form-control loginInput">
								<label for="joinPassInput" class="loginLabel">비밀번호</label>
							</div>
							<div class="form-floating my-3">
								<input type="password" placeholder="" name="passConfirm" id="joinPassConfirmInput" class="shadow-none border-0 form-control loginInput">
								<label for="joinPassConfirmInput" class="loginLabel">비밀번호 확인</label>
							</div>
							<div class="form-floating my-3">
								<input type="email" placeholder="" name="email" id="joinEmailInput" class="shadow-none border-0 form-control loginInput">
								<label for="joinEmailInput" class="loginLabel">이메일</label>
							</div>
							<div class="d-flex justify-content-center">
								<input type="submit" id="joinBtn" value="가입하기" class="btn btn-lg btn-dark shadow-none border-0">
							</div>
							<div class="d-flex justify-content-center my-3">
								<a href="login" class="text-dark">
								<span class="text-secondary">이미 회원이시면</span>
								<span class="fw-bold">로그인</span>
								</a>
							</div>
							
							
							
        				</div>
        			</div>

        		
        		</div>
        	</form>
        	<input type="hidden" id="isIdCheck" value="false">
        </div>
    </div>
</div>