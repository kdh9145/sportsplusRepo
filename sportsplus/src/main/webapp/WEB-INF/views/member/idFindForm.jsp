<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="content" class="container">
    <div class="row">
        <div class="col my-5">
        	
        	<div class="row my-3 justify-content-center">
        		<div class="col-4 ms-5">
        			<h3 class="fw-bold">아이디 찾기</h3>
        		</div>
        	</div>
        	
        		<div class="col text-center">
        							
					<div class="form-floating mb-3">
						<input type="text" placeholder="" name="name" id="idFindName" class="shadow-none border-0 form-control loginInput">
						<label for="idFindName" class="loginLabel">이름</label>
					</div>
					<div class="form-floating">
						<input type="email" placeholder="" name="email" id="idFindEmail" class="shadow-none border-0 form-control mt-3 loginInput">
						<label for="idFindEmail" class="loginLabel">이메일</label>
					</div>
					
					<div class="mt-3">
						<input type="button" class="btn btn-lg shadow-none btn-dark" id="idFindBtn" value="아이디 찾기">
					</div>
					
        		</div>
        	
        	<div class="row mt-5 justify-content-center">
        		<div class="col-4 ms-5">
        			<h3 class="fw-bold">비밀번호 찾기</h3>
        		</div>
        	</div>
        	
        	
        		<div class="col text-center">
        							
					<div class="form-floating mb-3">
						<input type="text" placeholder="" name="name" id="passFindName" class="shadow-none border-0 form-control loginInput">
						<label for="passFindName" class="loginLabel">이름</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" placeholder="" name="id" id="passFindId" class="shadow-none border-0 form-control loginInput">
						<label for="passFindId" class="loginLabel">아이디</label>
					</div>
					<div class="form-floating">
						<input type="email" placeholder="" name="email" id="passFindEmail" class="shadow-none border-0 form-control mt-3 loginInput">
						<label for="passFindEmail" class="loginLabel">이메일</label>
					</div>
					
					<div class="mt-3">
						<input type="button" class="btn btn-lg shadow-none btn-dark" id="passFindBtn" value="비밀번호 찾기">
					</div>
					
        		</div>
        	
			<div class="d-flex justify-content-center my-3">
				<a href="login" class="text-dark">
				<span class="text-secondary">아이디, 비밀번호가 기억났으면</span>
				<span class="fw-bold">로그인</span>
				</a>
			</div>
        	
        	
        </div>
    </div>
</div>