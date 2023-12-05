<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>SportsPlus</title>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic:wght@400;700;800&family=Nanum+Myeongjo:wght@400;700;800&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link href="resources/bootstrap/bootstrap.in.css" rel="stylesheet">
	<link href="resources/css/index.css" rel="stylesheet">
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/index.js"></script>
	<script src="resources/js/formCheck.js"></script>
</head>
<body>
	<%@ include file="template/header.jsp" %>
	
	<div id="searchResult" class="container bg-white rounded shadow-sm mb-5">
		<div class="row mb-3">
			<div class="col pt-3 ps-3 fs-5">
				<span id="ajaxKeyword" class="fw-bold"></span>
				<span>에 대한 기사 검색 결과</span>	
			</div>

		</div>
		
		<div class="row px-3">
			<div class="col">
				<div class="row" id="resultAppend"></div>		
			</div>
		</div>
		
		
		<div class="row">
			<div class="col text-end m-3 d-flex justify-content-end">
				<div style="width: fit-content; cursor: pointer;" id="searchClose">
					<span class="fs-5 fw-bold">검색창 닫기</span>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="${param.body}"/>
	<%@ include file="template/footer.jsp" %>
	
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>