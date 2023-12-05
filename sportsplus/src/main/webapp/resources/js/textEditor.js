$(function(){

	$(window).on("scroll", function(){
		let scrollTop = $(window).scrollTop();
		let editorTop = $("#category").offset().top;
		
		if (scrollTop > editorTop) {
			$("#prevBtn").appendTo($("#bottomSubmit"));
			$("#articleSumbit").appendTo($("#bottomSubmit"));
		} else {
			$("#prevBtn").appendTo($("#topSubmit"));
			$("#articleSumbit").appendTo($("#topSubmit"));
		}
	});

	let imgs = $("#articleContent").find("img");

	if(imgs.length > 0){
		$("#thumbnailSelect").empty();
			
			for(i=0; i<imgs.length; i++){
				let src = $(imgs[i]).attr("src");
				$("#thumbnailSelect").append(`
						<div class="row">
							<div class="col text-center m-3">
								<div class="border rounded thumbnail" style="width : 200px; height : 144px; margin:auto; background-position: center;
								background-image : url('` + src + `'); background-size : cover;" onclick="$(this).parent().parent().next().children().children().click();"></div>
							</div>
						</div>
						<div class="row">
							<div class="col text-center mx-3 mb-3">
								<label><input type="radio" class="form-check-input" name="thumbnail" value="` + src + `"> 썸네일 선택</label>
							</div>
						</div>
					`);
				$("#thumbnailBox").css("display", "block");
			}
			
			let thumbs = $("#thumbnailSelect").find("input[type=radio]");
			thumbs.each(function(){
				if($(this).val() == '${news.thumbnail}') $(this).prop("checked", true);
			});
			
			
	}

    const editor = $("#articleContent")
    editor.focus();
     
    $("#fontSelect").on("change", function(){
    	setFont($(this).val());
    	$("#fontSelect").val("글꼴");
    	editor.focus();
    });
    $("#fontSizeSelect").on("change", function(){
    	setFontSize($(this).val());
    	$("#fontSizeSelect").val("크기");
    	editor.focus();
    });
    $("#fontColorSelect").on("change", function(){
    	setFontColor($(this).val());
    	$("#fontColorSelect").val("색상");
    	editor.focus();
    });
    
    $("#fontBgSelect").on("change", function(){
    	setFontBg($(this).val());
    	$(this).val("음영");
    	editor.focus();
    });
    
    $('#boldBtn').on('click', function (e) {
        setStyle('bold');
        editor.focus();
        e.preventDefault();
    });

    $('#italicBtn').on('click', function (e) {
        setStyle('italic');
        editor.focus();
        e.preventDefault();
    });

    $('#underlineBtn').on('click', function (e) {
        setStyle('underline');
        editor.focus();
        e.preventDefault();
    });

    $('#strikeBtn').on('click', function (e) {
        setStyle('strikeThrough');
        editor.focus();
        e.preventDefault();
    });
    
    $('#leftSortBtn').on('click', function (e) {
        setStyle('justifyLeft');
        editor.focus();
        e.preventDefault();
    });
    
    $('#rightSortBtn').on('click', function (e) {
        setStyle('justifyRight');
        editor.focus();
        e.preventDefault();
    });
    
    $('#middleSortBtn').on('click', function (e) {
        setStyle('justifyCenter');
        editor.focus();
        e.preventDefault();
    });
    
    $('#linkBtn').on('click', function (e) {
        setStyle('createLink');
        editor.focus();
        e.preventDefault();
    });
    
    $('#imageBtn').on('click', function (e) {
		$("#imageFile").click();
		e.preventDefault();
    });
	
	$("#imageFile").change(function(){
				
		const fd = new FormData();
		const image = $("#imageFile")[0].files[0];
		fd.append('image',image);
		
		$.ajax({
			url : "imageUpload.ajax",
			data : fd,
			dataType : "json",
			type : "post",
			enctype : "multipart/form-data",
			processData: false,
			contentType : false,
			success : function(resData){
	    		document.execCommand('insertImage', false, "resources/upload/" + resData.fileName);
	    		$("#editor").focus();
	    		$("#thumbnailSelect").append(`
					<div class="row">
						<div class="col text-center m-3">
							<div class="border rounded thumbnail" style="width : 200px; height : 144px; margin:auto; background-position: center;
							background-image : url(`+ "resources/upload/" + resData.fileName + `); background-size : cover; cursor:pointer;" onclick="$(this).parent().parent().next().children().children().click();"></div>
						</div>
					</div>
					<div class="row">
						<div class="col text-center mx-3 mb-3">
							<label><input type="radio" class="form-check-input" name="thumbnail" value="` + "resources/upload/" + resData.fileName + `"> 썸네일 선택</label>
						</div>
					</div>`);				
				$("#thumbnailBox").css("display", "block");
				if($("#thumbnailBox").find("input[type=radio]").length == 1) $("#thumbnailBox").find("input[type=radio]").prop("checked", true);
			}, error : function(err){
				console.log("통신에러");
			}
		});
		$("#imageFile").val("");
	});
	
	//keyup이벤트
	$("#articleContent").on("keyup", function(e){
		
		let thumbs = $("#thumbnailSelect").find("input[type=radio]");		
		let imgs = $("#articleContent").find("img");
		
		if(imgs.length == 0) {
			$("#thumbnailSelect").empty();
			$("#thumbnailBox").css("display", "none");
		}
		
		let checked = false;
		for(i=0; i<thumbs.length; i++){
			if($(thumbs[i]).is(":checked")) checked = true;
		}
		if(! checked && thumbs.length > 0){
			$(thumbs[0]).prop("checked", true);
		}
				
		//imgs와 thumbs의 길이가 같지 않다면 thumbs에 없는 imgs 요소를 thumbs에 넣어준다.
		if(thumbs.length != imgs.length){
			$("#thumbnailSelect").empty();
			
			for(i=0; i<imgs.length; i++){
				let src = $(imgs[i]).attr("src");
				$("#thumbnailSelect").append(`
					<div class="row">
						<div class="col text-center m-3">
							<div class="border rounded thumbnail" style="width : 200px; height : 144px; margin:auto; background-position: center;
							background-image : url(`+ src + `); background-size : cover; cursor:pointer;" onclick="$(this).parent().parent().next().children().children().click();"></div>
						</div>
					</div>
					<div class="row">
						<div class="col text-center mx-3 mb-3">
							<label><input type="radio" class="form-check-input" name="thumbnail" value="` + src + `"> 썸네일 선택</label>
						</div>
					</div>`);
				$("#thumbnailBox").css("display", "block");
			}
		}
		
	});




});

function setStyle(style) {
    document.execCommand(style);
}
	
function setFontSize(size) {
	document.execCommand('fontSize', false, size);
}

function setFont(name) {
	document.execCommand('fontName', false, name);
}

function setFontColor(color) {
	document.execCommand('foreColor', false, color);
}

function setFontBg(color) {
	document.execCommand('hiliteColor', false, color);
}

function labelClick(){

	console.log($(this).css('background-image'));
	
	
}
