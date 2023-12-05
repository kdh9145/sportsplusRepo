<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="content" class="container">
    <div class="row">
        <div class="col my-5">
        	
        	<div class="row">
        		<div class="col my-3 text-center">
        			<h1 class="fw-bold">회원정보 수정</h1>
        		</div>
        	</div>
        	
        	<form class="row" id="memberUpdateForm" name="memberUpdateForm" action="memberUpdateProcess" method="post">
        		<div class="col">
        		
        			<div class="row justify-content-center">
        				<div class="col-4">
        					
        					
        					<div class="form-floating my-3">
								<input type="text" placeholder="" name="name" id="joinNameInput" class="shadow-none border-0 form-control loginInput"
								 value="${sessionScope.member.name}" readonly>
								<label for="joinNameInput" class="loginLabel">이름</label>
							</div>
		        			<div class="form-floating my-3">
								<input type="text" placeholder="" name="id" id="joinIdInput" class="shadow-none border-0 form-control loginInput"
								 value="${sessionScope.member.id}" readonly>
								<label for="joinIdInput" class="loginLabel">아이디</label>
							</div>
							<div class="form-floating my-3">
								<input type="password" placeholder="" name="pass" id="joinPassInput" class="shadow-none border-0 form-control loginInput">
								<label for="joinPassInput" class="loginLabel">기존 비밀번호</label>
							</div>
							<div class="form-floating my-3">
								<input type="password" placeholder="" name="newPass" id="newPass" class="shadow-none border-0 form-control loginInput">
								<label for="newPass" class="loginLabel">변경할 비밀번호</label>
							</div>
							<div class="form-floating my-3">
								<input type="password" placeholder="" name="newPassConfirm" id="newPassConfirm" class="shadow-none border-0 form-control loginInput">
								<label for="newPassConfirm" class="loginLabel">변경할 비밀번호 확인</label>
							</div>
							<div class="form-floating my-3">
								<input type="email" placeholder="" name="email" id="joinEmailInput" class="shadow-none border-0 form-control loginInput"
								 value="${sessionScope.member.email}">
								<label for="joinEmailInput" class="loginLabel">이메일</label>
							</div>
							<div class="d-flex justify-content-center">
								<input type="submit" id="joinBtn" value="정보수정" class="btn btn-lg btn-dark shadow-none border-0">
							</div>
							
        				</div>
        			</div>

        		
        		</div>
        	</form>
        	
        </div>
    </div>
</div>