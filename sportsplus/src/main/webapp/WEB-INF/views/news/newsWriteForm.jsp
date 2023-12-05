<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/js/textEditor.js"></script>

<div id="content" class="container">
    <div class="row">
        <div class="col">
        	
        	<form name="writeArticleForm" id="writeArticleForm" action="newsWriteProcess" method="post" class="row">
        		<div class="col rounded bg-white shadow-sm p-5">

        			<div class="row">
	        			<div class="col">
		        			<h2 class="fw-bold">기사 작성</h2>
						</div>
						<div class="col text-end mb-3" id="topSubmit">
							<input type="button" value="이전으로" class="btn btn-outline-dark btn-lg me-2" onclick="location.href='newsList?cat=${cat}'" id="prevBtn">
							<input type="submit" value="등록하기" class="btn btn-dark btn-lg" id="articleSumbit">
						</div>
					</div>
					        			
					<div class="row mb-3">
        				<div class="col input-group">
        					<span class="input-group-text">카테고리 선택</span>
       						<select name="category" class="form-select shadow-none border border-secondary-subtle" id="category">
								<option ${cat eq "baseball" ? "selected" : ""} value="baseball">국내야구</option>
								<option ${cat eq "worldBaseball" ? "selected" : ""} value="worldBaseball">해외야구</option>
								<option ${cat eq "football" ? "selected" : ""} value="football">국내축구</option>
								<option ${cat eq "worldFootball" ? "selected" : ""} value="worldFootball">해외축구</option>
								<option ${cat eq "basketball" ? "selected" : ""} value="basketball">농구</option>
							</select>
        				</div>
        				<div class="col-9"></div>
        			</div>
        			
	        		<div class="row">
						<div class="col form-floating">
							<input type="text" class="form-control shadow-none border border-secondary-subtle" id="articleTitle" placeholder="" name="title">
							<label for="articleTitle" class="ms-3">기사 제목</label>
						</div>
					</div>			
					
					<div class="row">
						<div class="col text-center mt-3">
							<div id="toolbar" class="border rounded-top border-bottom-0 d-flex justify-content-center align-items-center"
							 style="background-color: #f0f0f0;">
							
								<select id="fontSelect" class="form-select mx-2" style="width:7vw; height : 4vh;">
									<option>글꼴</option>
									<option class="fs-6" value="Black Han Sans">Black Han Sans</option>
									<option class="fs-6" value="Noto Sans KR">Noto Sans</option>
									<option class="fs-6" value="Nanum Gothic">Nanum Gothic</option>
									<option class="fs-6" value="Nanum Myeongjo">Nanum Myeongjo</option>
									<option class="fs-6" value="Nanum Pen Script">Nanum Pen Script</option>
								</select>
								<select id="fontSizeSelect" class="form-select mx-2" style="width:7vw; height : 4vh;">
									<option>크기</option>
									<option value="1" style="font-size: 10px;">10px</option>
									<option value="2" style="font-size: 12px;">12px</option>
									<option value="3" style="font-size: 16px;">16px(기본크기)</option>
									<option value="4" style="font-size: 18px;">18px</option>
									<option value="5" style="font-size: 24px;">24px</option>
									<option value="6" style="font-size: 32px;">32px</option>
									<option value="7" style="font-size: 48px;">48px</option>
								</select>
								
								<select id="fontColorSelect" class="form-select mx-2" style="width:7vw; height : 4vh;">
									<option class="fs-6">색상</option>
									<option class="fs-6" value="#000000">검정</option>
									<option class="fs-6" value="#FFFFFF">흰색</option>
									<option class="fs-6" value="#CCCCCC">회색</option>
									<option class="fs-6" value="#F03E3E">빨강</option>
									<option class="fs-6" value="#1971C2">파랑</option>
									<option class="fs-6" value="#37B24D">녹색</option>
								</select>
								<select id="fontBgSelect" class="form-select mx-2" style="width:7vw; height : 4vh;">
									<option class="fs-6">음영</option>
									<option class="fs-6" value="#000000">검정</option>
									<option class="fs-6" value="#FFFFFF">흰색</option>
									<option class="fs-6" value="#CCCCCC">회색</option>
									<option class="fs-6" value="#F03E3E">빨강</option>
									<option class="fs-6" value="#1971C2">파랑</option>
									<option class="fs-6" value="#37B24D">녹색</option>
								</select>

								<button class="toolbarItem" id="boldBtn">
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-type-bold" viewBox="0 0 16 16">
										<path d="M8.21 13c2.106 0 3.412-1.087 3.412-2.823 0-1.306-.984-2.283-2.324-2.386v-.055a2.176 2.176 0 0 0 1.852-2.14c0-1.51-1.162-2.46-3.014-2.46H3.843V13H8.21zM5.908 4.674h1.696c.963 0 1.517.451 1.517 1.244 0 .834-.629 1.32-1.73 1.32H5.908V4.673zm0 6.788V8.598h1.73c1.217 0 1.88.492 1.88 1.415 0 .943-.643 1.449-1.832 1.449H5.907z"/>
									</svg>
								</button>
									
								<button class="btn btn-lg toolbarItem" id="italicBtn">
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-type-italic" viewBox="0 0 16 16">
										<path d="M7.991 11.674 9.53 4.455c.123-.595.246-.71 1.347-.807l.11-.52H7.211l-.11.52c1.06.096 1.128.212 1.005.807L6.57 11.674c-.123.595-.246.71-1.346.806l-.11.52h3.774l.11-.52c-1.06-.095-1.129-.211-1.006-.806z"/>
									</svg>
								</button>
																	
								<button class="btn btn-lg toolbarItem" id="underlineBtn">
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-type-underline" viewBox="0 0 16 16">
										<path d="M5.313 3.136h-1.23V9.54c0 2.105 1.47 3.623 3.917 3.623s3.917-1.518 3.917-3.623V3.136h-1.23v6.323c0 1.49-.978 2.57-2.687 2.57-1.709 0-2.687-1.08-2.687-2.57V3.136zM12.5 15h-9v-1h9v1z"/>
									</svg>
								</button>
								
								<button class="btn btn-lg toolbarItem" id="strikeBtn">
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-type-strikethrough" viewBox="0 0 16 16">
										<path d="M6.333 5.686c0 .31.083.581.27.814H5.166a2.776 2.776 0 0 1-.099-.76c0-1.627 1.436-2.768 3.48-2.768 1.969 0 3.39 1.175 3.445 2.85h-1.23c-.11-1.08-.964-1.743-2.25-1.743-1.23 0-2.18.602-2.18 1.607zm2.194 7.478c-2.153 0-3.589-1.107-3.705-2.81h1.23c.144 1.06 1.129 1.703 2.544 1.703 1.34 0 2.31-.705 2.31-1.675 0-.827-.547-1.374-1.914-1.675L8.046 8.5H1v-1h14v1h-3.504c.468.437.675.994.675 1.697 0 1.826-1.436 2.967-3.644 2.967z"/>
									</svg>
								</button>
								
								<button class="btn btn-lg toolbarItem" id="leftSortBtn">
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-filter-left" viewBox="0 0 16 16">
										<path d="M2 10.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
									</svg>
								</button>
								
								<button class="btn btn-lg toolbarItem" id="middleSortBtn">
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
									</svg>
								</button>
								
								<button class="btn btn-lg toolbarItem" id="rightSortBtn">
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-filter-right" viewBox="0 0 16 16">
										<path d="M14 10.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0 0 1h3a.5.5 0 0 0 .5-.5zm0-3a.5.5 0 0 0-.5-.5h-7a.5.5 0 0 0 0 1h7a.5.5 0 0 0 .5-.5zm0-3a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0 0 1h11a.5.5 0 0 0 .5-.5z"/>
									</svg>
								</button>
								
								<button class="btn btn-lg toolbarItem" id="imageBtn">
									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
										<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
										<path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
									</svg>
								</button>
								
								<input type="file" name="imageFile" id="imageFile" style="display:none;">
								
							</div>
						</div>
					</div>
					
					<!--  -->
					<div class="row">
						<div class="col">
							<div class="d-flex">
								<div class="col border-start border-bottom p-3" style="width: 67%;">
									<div id="articleContent" contenteditable="true" style="min-height : 50vh;">
									
									</div>
								</div>
								<div class="col-4 border border-top-0 py-5" style="width: 33%;">
									<div id="articleContent" style="min-height : 50vh;">
									
										<!-- 썸네일 선택 -->
										<div id="thumbnailBox">
											<div class="row mt-3">
												<div class="col text-center">
													<span class="fw-bold fs-4">
														썸네일 선택
													</span>
												</div>
											</div>
											<div class="row">
												<div class="col" id="thumbnailSelect">
												</div>
											</div>
										</div>
										<!-- 썸네일 선택 -->
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--  -->
					
					<div class="row my-3">
						<div class="col text-end" id="bottomSubmit">
							
						</div>
					</div>
					
					<input type="hidden" name="content" id="hiddenContent">
					<input type="hidden" name="description" id = "description">
        		</div>
        	</form>
        	        	
        </div>
    </div>
</div>