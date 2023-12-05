$(function(){

	//아이디찾기 버튼 클릭시
	$("#idFindBtn").on("click", function(){
		let name = $("#idFindName").val();
		let email = $("#idFindEmail").val();

		
		if(name.length == 0){
			alert("이름을 입력해주세요");
			return;
		}
		if(email.length == 0){
			alert("이메일을 입력해주세요");
			return;
		}
		
		$.ajax({
			url : "idFind.ajax",
			data : "name=" + name + "&email=" + email,
			type : "post",
			dataType : "json",
			success : function(resData){
				if(resData.result) alert("회원님의 아이디는 " + resData.member.id + "입니다");
				else alert("입력하신 정보에 해당하는 회원정보가 없습니다");
			},error : function(err){
				console.log("통신에러");
			}	
		});	
	});
	
	//비밀번호찾기 버튼 클릭시
	$("#passFindBtn").on("click", function(){
		let name = $("#passFindName").val();
		let id = $("#passFindId").val();
		let email = $("#passFindEmail").val();
		
		if(name.length == 0){
			alert("이름을 입력해주세요");
			return;
		}
		if(id.length == 0){
			alert("아이디를 입력해주세요");
			return;
		}
		if(email.length == 0){
			alert("이메일을 입력해주세요");
			return;
		}
		
		$.ajax({
		
			url : "passFind.ajax",
			data : "name=" + name + "&id=" + id + "&email=" + email,
			type : "post",
			dataType : "json",
			success : function(resData){
			
				if(resData.result) alert("회원님의 이메일로 임시비밀번호를 발송하였습니다 \n 임시비밀번호로 로그인하시고 비밀번호를 변경해주세요");
				else alert("입력하신 정보에 해당하는 회원정보가 없습니다");
				
				
			},error : function(err){
				console.log("통신에러");
			}	
		});	
	});

	$("#overlapId").on("click", function(){
		
		let id = $("#joinIdInput").val();
		let result = false;
		
		$.ajax({
			
			url : "overlapId.ajax",
			data : "id=" + id,
			type : "post",
			dataType : "json",
			success : function(resData){
				
				if(resData){
					alert('중복된 아이디입니다.');
					$("#isIdCheck").val("false");
					$("#joinIdInput").focus();
				} 
				if(! resData){
					alert('사용가능 한 아이디입니다');
					$("#isIdCheck").val("true");
					$("#joinPassInput").focus();
				}
				
				
			},error : function(err){
				console.log("통신에러");
			}
			
		});
		
	});

	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

    $("#searchIcon").click(function(){

        if($("#searchBar").css("opacity") == 0) {
            $("#searchBar").css("opacity", 100);
            $("#searchInput").focus();
        } else{
            $("#searchBar").css("opacity", 0);
            $("#searchInput").val("");
            $("#searchResult").css("display", "none");
        }

    });


	
 	
 	//좋아요,싫어요
	$(".likeHate").on("click", function(){
			let articleNo = $("#articleNo").val();
			let func = $(this).attr("id");
			
			$.ajax({
				url : "likeHate.ajax",
				data : "no=" + articleNo + "&func=" + func,
				type : "post",
				dataType : "json",
				success : function(resData){
					$("#likeCount").text(resData.likeCount);
					$("#hateCount").text(resData.hateCount);
				},error : function(err){
					console.log("통신오류 : " + err);
				}
			});
	});
	
	
	let printWindow = null
	$("#articlePrint").on("click",function(){
		let w = $(window).width() / 2;
		let h = $(window).height();
		let l = w / 2;
				
		if(!printWindow || printWindow.closed){
			printWindow = window.open("", "인쇄하기", "toolbar=no, location=no, status=no, menubar=no, width=" + w + ", height=" + h + ", left=" + l);
		}
		else {
			alert("이미 인쇄창이 열려 있습니다.");
			printWindow.focus();
			return;
		}
			
		printWindow.document.write();			
		printWindow.document.write(`<div style="font-size : 3rem; font-weight:600">` + $("#newsTitle").text() +`</div>`);
		printWindow.document.write(`<div style="margin-top: 3vh;">&nbsp;</div>`);
		printWindow.document.write($("#newsRegDate").html());
		printWindow.document.write(`<div style="margin-top: 3vh; border-top: 1px solid lightgray;">&nbsp;</div>`);		
		printWindow.document.write(`<div style="overflow:hidden;">` + $("#newsContent").html() + `</div>`);
		printWindow.document.write(`<input type="button" value="인쇄하기" id="printBtn" style="position: fixed; top : 3vh; right : 3vw; border:1px solid white; 
		background-color : black; color : white; width:10vw; height:5vh; border-radius:5px; cursor:pointer;" onclick="window.print();">`);
	});

	$("#fontSizeUp").on("click", function(){
		let fontSize = parseInt($("#detailContent").css("font-size"));
		if(fontSize < 180) $("#detailContent").css("font-size", fontSize + 4 + "px");
	});
	
	$("#fontSizeDown").on("click", function(){
		let fontSize = parseInt($("#detailContent").css("font-size"));
		if(fontSize > 12) $("#detailContent").css("font-size", fontSize - 4 + "px");
	});
	
	$(".fontFamily").on("click", function(){
		let fontName = $(this).attr("data-name");
		$("#detailContent").css("font-family", fontName);
	});
	
	$("#searchClose").click(function(){
		$("#resultAppend").empty();
		$("#searchResult").css("display", "none");
		$("#searchInput").val("");
	});
	
	

	//검색창에 검색어를 입력했을 때
	$("#searchInput").on("keyup",function(){
		
		let keyword = $(this).val();
		$("#ajaxKeyword").text('\"' + keyword + '\"');
		
		if($("#searchInput").val().length == 0){
			$("#searchResult").css("display", "none");
		}
		else{

			//keyword에 대한 검색결과 ajax통신으로 가져오기
			$.ajax({
			
				url : "search.ajax",
				data : "keyword=" + keyword,
				type : "post",
				dataType : "json",
				success : function(resData){
					
					
					
					if(resData.newsList.length == 0) {
						$("#resultAppend").empty();
						$("#searchResult").css("display", "none");
					}
					else{
						
						$("#resultAppend").empty();
						$("#searchResult").css("display", "block");
						
						for(i=0; i<resData.newsList.length; i++){
							$("#resultAppend").append(`
								
								<div class="col-2 mb-3" style="cursor:pointer;" onclick="location.href='newsDetail?no=` + resData.newsList[i].no + `&cat=` + 
								resData.newsList[i].category + `'">
									<div class="rounded border searchResultDiv" style="background-position: center;
									background-image: url('` + 
									(resData.newsList[i].thumbnail != null && resData.newsList[i].thumbnail.length > 0 ? resData.newsList[i].thumbnail : "resources/images/defaultThumbnail.jpg") 
									 + `')"></div>
									<div class="" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									<span id="ajaxTitle" style="font-size:14px;" class="fw-bold">` + resData.newsList[i].title + `</span>
									</div>
								</div>
								
							`);
						}
						
						
					}		
				},error : function(err){
					console.log("에러메시지 : " + err);
				}
				
			});
			
		}	
	});
	
		
	
	
	
});

	function isCompleteKeyword(str) {
		let charCode = str.charCodeAt(str.length - 1); //0은 문자열의 index
		return charCode < 0xAC00 || charCode > 0xD7A3;
	}