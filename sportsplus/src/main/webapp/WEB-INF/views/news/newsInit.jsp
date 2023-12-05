<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script>
$(function(){
	$.ajax({
		url : "newsInit.ajax"	,
		dataType : "json",
		success : function(resData){
			console.log(resData);
			if(resData.result) location.replace("newsMain");
		}
		
	});
});
</script>
</head>
<body style="background-color : black;">
	<div class="container bg-black">
	
		<div class="row">
			<div class="col text-center">
				<img src="resources/images/loading.gif">	
			</div>
		</div>
		<div class="row">
			<div class="col text-center text-white fs-1">
				<p>뉴스기사 초기화중입니다</p>
				<p>초기화에 몇분이 소요됩니다</p>
				<p>초기화가 완료 되면 자동으로 페이지가 이동됩니다.</p>
			</div>
		</div>
		
	</div>
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>