$(function(){
	
	$("#idFindName").on("keyup", function(){
		regName(this);	
	});
	$("#passFindName").on("keyup", function(){
		regName(this);	
	});
	$("#passFindId").on("keyup", function(){
		regInput(this);	
	});
	
	$(document).on("submit", "#writeArticleForm", function(){
		if($("#articleTitle").val().length == 0) { 
			alert("기사 제목을 입력해 주세요");
			return false;
		}
		
		if($("#articleTitle").val().length > 50){
			alert("제목은 50자 이내로 입력해 주세요");
			return false;
		}
		
		if($("#articleContent").html().trim().length == 0) { 
			alert("기사 내용을 입력해 주세요");
			return false;
		}
		
		$("#hiddenContent").val($("#articleContent").html().trim());
		
		let desc = $("#articleContent").text();
		
		if(desc.length > 100) {
			desc = desc.substring(0, 100);
		}
		
		$("#description").val(desc);
		
		if($("#thumbnailBox").is(":visible") && ! $("input[name=thumbnail]").is(":checked")) {
			alert("썸네일을 선택 해 주세요");
			return false;
		}
		
	});
	
	$("#joinForm").on("submit", function(){
		
		if($("#joinNameInput").val().length == 0){
			alert("이름을 입력해 주세요");
			$("#joinNameInput").focus();
			return false;
		}
		if($("#joinIdInput").val().length == 0){
			alert("아이디를 입력해 주세요");
			$("#joinIdInput").focus();
			return false;
		}
		if($("#isIdCheck").val() == 'false'){
			alert("아이디 중복확인을 해주세요");
			$("#joinIdInput").focus();
			return false;
		}
		if($("#joinPassInput").val().length == 0){
			alert("비밀번호를 입력해 주세요");
			$("#joinPassInput").focus();
			return false;
		}
		if($("#joinPassConfirmInput").val().length == 0){
			alert("비밀번호 확인을 입력해 주세요");
			$("#joinPassConfirmInput").focus();
			return false;
		}
		if($("#joinPassConfirmInput").val() != $("#joinPassInput").val()){
			alert("비밀번호가 동일하지 않습니다");
			$("#joinPassConfirmInput").focus();
			return false;
		}
		if($("#joinEmailInput").val().length == 0){
			alert("이메일을 입력해 주세요");
			$("#joinEmailInput").focus();
			return false;
		}
		
		let regExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;	
		if(! regExp.test($("#joinEmailInput").val())) {
			alert("이메일 형식만 입력할 수 있습니다.");
			$("#joinEmailInput").val($("#joinEmailInput").val().replace(regExp, ""));
			return false;
		}
		
	});
	
	$("#memberUpdateForm").on("submit", function(){
		
		if($("#joinPassInput").val().length == 0){
			alert("비밀번호를 입력해 주세요");
			$("#joinPassInput").focus();
			return false;
		}
		if($("#newPass").val().length > 0 && $("#joinPassInput").val().length == 0){
			alert("비밀번호를 변경하시려면 기존 비밀번호를 입력해 주세요");
			$("#newPass").focus();
			return false;
		}
		if($("#newPassConfirm").val() != $("#newPass").val()){
			alert("비밀번호가 동일하지 않습니다");
			$("#newPassConfirm").focus();
			return false;
		}
		
		let regExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;	
		if(! regExp.test($("#joinEmailInput").val())) {
			alert("이메일 형식만 입력할 수 있습니다.");
			$("#joinEmailInput").val($("#joinEmailInput").val().replace(regExp, ""));
			return false;
		}
		
	});

	$("#joinNameInput").on("keyup", function(){
		regName(this);
	});
	$("#joinIdInput").on("keyup", function(){
		$("#isIdCheck").val("false");
		regInput(this);
	});
	$("#joinPassInput").on("keyup", function(){
		regInput(this);
	});
	$("#joinPassConfirmInput").on("keyup", function(){
		regInput(this);
	});
	$("#newPass").on("keyup", function(){
		regInput(this);
	});
	$("#newPassConfirm").on("keyup", function(){
		regInput(this);
	});

});

function regInput(e){
	let regExp = /[^A-Za-z0-9]/gi;	
	if(regExp.test($(e).val())) {
		alert("영문 대소문자, 숫자만 입력할 수 있습니다.");
		$(e).val($(e).val().replace(regExp, ""));
	}
}
function regName(e){
	let regExp = /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi;	
	if(regExp.test($(e).val())) {
		alert("한글만 입력할 수 있습니다.");
		$(e).val($(e).val().replace(regExp, ""));
	}
}

