$(function(){

	//댓글 삭제 버튼을 눌렀을때
	$(document).on("click", ".replyDeleteBtn", function(){
		
		if(confirm('이 댓글을 정말 삭제하시겠습니까?')){
			
			if($("#replyUpdateForm").is(":visible")){
				$("#replyUpdateForm").slideUp(300);
			}
			
			let data = "bbsNo=" + $("#articleNo").val() + "&no=" + $(this).attr("data-reply-no");
			setTimeout(function() {
				$.ajax({
					url : "replyDelete.ajax",
					data : data,
					type : "post",
					dataType : "json",
					success : function(resData){
					
						$("#replyUpdateForm").insertAfter("#replyBox");
						$("#replyUpdateForm").css("display", "none");
						
						$("#replyList").empty();
						
						$(resData).each(function(i, d){
							
							if($("#loginId").val() == d.writer || $("#loginId").val() == 'admin'){
								$("#replyList").append(
						
									'<div class="row mx-1 rounded border border-secondary-subtle shadow-sm my-3">' +
										'<div class="col-2 d-flex justify-content-center align-items-center border-end my-2">' +
											d.writer +
										'</div>' +
										'<div class="col py-1 ps-3 d-flex align-items-center" style="min-height: 10vh;">' +
											d.content +
										'</div>' +
										'<div class="col-2 text-end d-flex flex-column justify-content-center">' +
												'<input type="button" class="btn btn-warning my-1 replyUpdateBtn" value="댓글수정" data-reply-no="' + d.no + '"> ' +
												'<input type="button" class="btn btn-danger my-1 replyDeleteBtn" value="댓글삭제" data-reply-no="' + d.no + '">' +
										'</div>' +
									'</div>'
									
								);
							}
							else{
								$("#replyList").append(
						
									'<div class="row mx-1 rounded border border-secondary-subtle shadow-sm my-3">' +
										'<div class="col-2 d-flex justify-content-center align-items-center border-end my-2">' +
											d.writer +
										'</div>' +
										'<div class="col py-1 ps-3 d-flex align-items-center" style="min-height: 10vh;">' +
											d.content +
										'</div>' +
										'<div class="col-2 text-end d-flex flex-column justify-content-center">' +
										'</div>' +
									'</div>'
									
								);
							}

							$("#updateReplyContent").val("");
							$("#replyContent").val("");
							
						});
					
					},error : function(err){
						console.log("통신에러");
					}
				});
			}, 300);
						
		}
		
	});

	//댓글 수정 취소버튼을 눌렀을 때
	$(document).on("click", "#replyUpdateCancleBtn", function(){
		$("#updateReplyContent").val("");
		$("#replyUpdateForm").attr("data-reply-no", "");
		$("#replyUpdateForm").slideUp("300");
	});
	
	//댓글 수정 버튼을 눌렀을 떄
	$(document).on("click", ".replyUpdateBtn", function(){
		
		let insertArea = $(this).parent().parent();
		
		if($("#replyUpdateForm").is(":visible") && ! insertArea.next().is("#replyUpdateForm")){
			$("#replyUpdateForm").slideUp("300");
			setTimeout(function() {
				$("#replyUpdateForm").insertAfter(insertArea).slideDown("300");
			}, 500);
		} else{
			$("#replyUpdateForm").insertAfter(insertArea).slideDown("300");		
		}
		$("#updateReplyContent").val($(this).parent().prev().text().trim());
		$("#replyNo").val($(this).attr("data-reply-no"));
	});
	
	//댓글 업데이트 폼이 submit 될 때
	$("#replyUpdateForm").on("submit", function(){	
		if($("#updateReplyContent").val().length == 0) {
			alert("댓글 내용을 입력해주세요");
			return false;
		}
		
		if($("#replyUpdateForm").is(":visible")){
			$("#replyUpdateForm").slideUp(300);
		}
		
		let data = "bbsNo=" + $("#articleNo").val() + "&no=" + $("#replyNo").val() + "&content=" + $("#updateReplyContent").val();
		setTimeout(function() {
			$.ajax({
				url : "replyUpdate.ajax",
				data : data,
				type : "post",
				dataType : "json",
				success : function(resData){
				
										$("#replyUpdateForm").insertAfter("#replyBox");
					$("#replyUpdateForm").css("display", "none");
					
					$("#replyList").empty();
					
					$(resData).each(function(i, d){
						
						if($("#loginId").val() == d.writer || $("#loginId").val() == 'admin'){
							$("#replyList").append(
					
								'<div class="row mx-1 rounded border border-secondary-subtle shadow-sm my-3">' +
									'<div class="col-2 d-flex justify-content-center align-items-center border-end my-2">' +
										d.writer +
									'</div>' +
									'<div class="col py-1 ps-3 d-flex align-items-center" style="min-height: 10vh;">' +
										d.content +
									'</div>' +
									'<div class="col-2 text-end d-flex flex-column justify-content-center">' +
											'<input type="button" class="btn btn-warning my-1 replyUpdateBtn" value="댓글수정" data-reply-no="' + d.no + '"> ' +
											'<input type="button" class="btn btn-danger my-1 replyDeleteBtn" value="댓글삭제" data-reply-no="' + d.no + '">' +
									'</div>' +
								'</div>'
								
							);
						}
						else{
							$("#replyList").append(
					
								'<div class="row mx-1 rounded border border-secondary-subtle shadow-sm my-3">' +
									'<div class="col-2 d-flex justify-content-center align-items-center border-end my-2">' +
										d.writer +
									'</div>' +
									'<div class="col py-1 ps-3 d-flex align-items-center" style="min-height: 10vh;">' +
										d.content +
									'</div>' +
									'<div class="col-2 text-end d-flex flex-column justify-content-center">' +
									'</div>' +
								'</div>'
								
							);
						}
						
						
						
						$("#updateReplyContent").val("");
						
					});
				
				},error : function(err){
					console.log("통신에러");
				}
			});
		}, 300);
		
		
		return false;
	});
	
	//댓글 쓰기 폼이 submit 될 때
	$("#replyForm").on("submit", function(){	
		if($("#replyContent").val().length == 0) {
			alert("댓글 내용을 입력해주세요");
			return false;
		}
		
		if($("#replyUpdateForm").is(":visible")){
			$("#replyUpdateForm").slideUp(300);
		}
		setTimeout(function() {
		  
			let data = "bbsNo=" + $("#articleNo").val() + "&content=" + $("#replyContent").val() + "&writer=" + $("#writer").val(); 
		
			$.ajax({
				url : "replyWrite.ajax",
				data : data,
				type : "post",
				dataType: "json",
				success : function(resData){
					
					$("#replyUpdateForm").insertAfter("#replyBox");
					$("#replyUpdateForm").css("display", "none");
					
					$("#replyList").empty();
					
					$(resData).each(function(i, d){
						
						if($("#loginId").val() == d.writer || $("#loginId").val() == 'admin'){
							$("#replyList").append(
					
								'<div class="row mx-1 rounded border border-secondary-subtle shadow-sm my-3">' +
									'<div class="col-2 d-flex justify-content-center align-items-center border-end my-2">' +
										d.writer +
									'</div>' +
									'<div class="col py-1 ps-3 d-flex align-items-center" style="min-height: 10vh;">' +
										d.content +
									'</div>' +
									'<div class="col-2 text-end d-flex flex-column justify-content-center">' +
											'<input type="button" class="btn btn-warning my-1 replyUpdateBtn" value="댓글수정" data-reply-no="' + d.no + '"> ' +
											'<input type="button" class="btn btn-danger my-1 replyDeleteBtn" value="댓글삭제" data-reply-no="' + d.no + '">' +
									'</div>' +
								'</div>'
								
							);
						}
						else{
							$("#replyList").append(
					
								'<div class="row mx-1 rounded border border-secondary-subtle shadow-sm my-3">' +
									'<div class="col-2 d-flex justify-content-center align-items-center border-end my-2">' +
										d.writer +
									'</div>' +
									'<div class="col py-1 ps-3 d-flex align-items-center" style="min-height: 10vh;">' +
										d.content +
									'</div>' +
									'<div class="col-2 text-end d-flex flex-column justify-content-center">' +
									'</div>' +
								'</div>'
								
							);
						}
						
						
						
						$("#replyContent").val("");
						
					});
					
				},error : function(err){
					console.log("통신에러");
				}
			});
		  
		}, 300);
		
		
		
		return false;
	});
	
	
	
});