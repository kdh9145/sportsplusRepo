<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">	
</head>
<body style="background-color:#f0f0f0;">
<div id="errorPage" class="container" style="min-height : 100vh;">
    <div class="row justify-content-center h-100 align-items-center">
        <div class="col-8 rounded bg-white text-center border h-50 p-5">
			<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				<path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
			</svg>
        	<h1 class="text-center my-3">페이지를 찾을 수 없습니다</h1>
        	<span class="fs-5 text-secondary">
				방문하시려는 페이지의 주소가 잘못 입력되었거나,<br>
				페이지의 주소가 변경 혹은 삭제되어 <br>
				요청하신 페이지를 찾을 수 없습니다.<br>
				입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다<br>
			</span>
			<input type="button" value="이전으로 돌아가기" class="btn btn-dark btn-lg mt-5" onclick="history.back();">
        </div>
    </div>
</div>
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>