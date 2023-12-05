<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/js/reply.js"></script>
<div id="content" class="container">
    <div class="row">
        <div class="col">
        	
        	<input type="hidden" name="no" id="articleNo" value="${news.no}">
        	<input type="hidden" name="loginId" id="loginId" value="${sessionScope.member.id}">
        	
        	<div class="row mb-3">
        		<div class="col">
        			<h2 class="fw-bold" id="newsCateogory">${category} 기사</h2>
        		</div>
    			<div class="col-auto text-end">
					<a href="newsList?cat=${news.category}&pageNum=${pageNum}" class="btn btn-dark">${category} 기사목록</a>
				</div>
        	</div>
        	
        	<div class="row">
        		<div class="col rounded bg-white shadow-sm p-5">
					<div class="row">
		        		<div class="col" id="newsList">
		        		
							<div class="row" id="newsTitle">
								<div class="col">
									<h2 class="fw-bold">
										${news.title}
									</h2>
								</div>
								
							</div>
							
							<div class="row my-3">
								<div class="col" id="newsRegDate">
									<span class="text-secondary" style="font-size : 14px;">최초 입력일 : ${news.regDate}&nbsp;&nbsp;&nbsp;최종 수정일 :  ${news.modifyDate}</span>
								</div>
								<c:if test="${sessionScope.isLogin and sessionScope.member.id eq 'admin'}">
								<div class="col-auto text-end">
       								<input type="button" value="수정" class="btn btn-warning btn-sm fw-bold" id="newsUpdate"
       								onclick="location.href='newsUpdate?no=${news.no}&cat=${news.category}'">
       								<input type="button" value="삭제" class="btn btn-danger btn-sm fw-bold" id="newsDelete"
       								onclick="location.href='newsDelete?no=${news.no}&cat=${news.category}'">
       							</div>
       							</c:if>
							</div>
							
							<div class="row my-4">
								<div class="col">
									<a id="addLike" class="me-3 text-dark likeHate" style="cursor:pointer;">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-emoji-laughing" viewBox="0 0 16 16">
											<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											<path d="M12.331 9.5a1 1 0 0 1 0 1A4.998 4.998 0 0 1 8 13a4.998 4.998 0 0 1-4.33-2.5A1 1 0 0 1 4.535 9h6.93a1 1 0 0 1 .866.5zM7 6.5c0 .828-.448 0-1 0s-1 .828-1 0S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 0-1 0s-1 .828-1 0S9.448 5 10 5s1 .672 1 1.5z"/>
										</svg>
										<span>좋아요 : </span>
										<span id="likeCount">${news.likeCount}</span>
									</a>
									<a id="addHate" class="me-3 text-dark likeHate" style="cursor:pointer;">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
											<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z"/>
										</svg>
										<span>싫어요 : </span>
										<span id="hateCount">${news.hateCount}</span>
									</a>
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
										<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
										<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
									</svg>
									<span>
										조회수 : ${news.readCount}
									</span>
								</div>
								
								<div class="col-auto me-3 text-end d-flex justify-content-end">
								
									<div class="dropdown me-3">
										<a class="dropdown-toggle text-dark" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
											글꼴
										</a>
										<ul class="dropdown-menu">
											<li class="fontFamily" data-name="Black Han Sans">
												<span class="dropdown-item">Black Han Sans</span>
											</li>
											<li class="fontFamily" data-name="Noto Sans">
												<span class="dropdown-item">Noto Sans</span>
											</li>
											<li class="fontFamily" data-name="Nanum Gothic">
												<span class="dropdown-item">Nanum Gothic</span>
											</li>
											<li class="fontFamily" data-name="Nanum Myeongjo">
												<span class="dropdown-item">Nanum Myeongjo</span>
											</li>
											<li class="fontFamily" data-name="Nanum Pen Script">
												<span class="dropdown-item">Nanum Pen Script</span>
											</li>
										</ul>
									</div>
									
									<a class="me-3 text-dark" id="fontSizeUp" style="cursor:pointer;">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
											<path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
										</svg>
									</a>
									<a class="me-3 text-dark" id="fontSizeDown" style="cursor:pointer;">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-lg" viewBox="0 0 16 16">
											<path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11A.5.5 0 0 1 2 8Z"/>
										</svg>
									</a>
									<a class="me-3 text-dark" id="articlePrint" style="cursor:pointer;">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-printer" viewBox="0 0 16 16">
											<path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z"/>
											<path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z"/>
										</svg>
									</a>
									
								</div>
							</div>
							
							<div class="row" id="newsContent">
								<div class="col me-5 my-3" id="detailContent">
									${news.content}
								</div>
							</div>
							
							<div class="row" id="replyBox">
								<div class="col me-5 my-3 border-top pt-3">
									
									<h3>기사 댓글</h3>
									<span class="text-secondary">기사를 읽고 의견을 남겨주세요.</span><br>
									
									<!-- 댓글 쓰기 폼 -->
									<c:if test="${sessionScope.isLogin}">
									<form name="replyForm" id="replyForm" class="row ">
										<input type="hidden" name="writer" id="writer" value="${sessionScope.member.id}">
										<div class="col">
											<div class="row">
												<div class="col">
													<textarea name="replyContent" id="replyContent" class="form-control shadow-none border-secondary-subtle" rows="5" style="resize: none;"></textarea>
												</div>
												<div class="col-2 ps-0">
													<input type="submit" class="btn btn-dark w-100 h-100" value="댓글 등록">
												</div>
											</div>
										</div>
									</form>
									</c:if>
									
									<!-- 댓글쓰기위한 로그인 안내 -->
									<c:if test="${not sessionScope.isLogin}">
									<div class="row">
										<div class="col">
											<div class="text-center rounded border d-flex align-items-center justify-content-center bg-secondary-subtle" 
											onclick="location.href='login'" style="height: 12vh; cursor : pointer;">
												댓글을 남기시려면&nbsp;<span class="fw-bold text-dark" style="text-decoration : underline;">로그인</span>&nbsp;하셔야합니다
											</div>
										</div>
									</div>
									</c:if>
									
							<div class="row">
								<div class="col" id="replyList">
									<!-- 댓글 리스트 -->
									<c:forEach var="r" items="${replyList}">
										<div class="row mx-1 rounded border border-secondary-subtle shadow-sm my-3">
											<div class="col-2 d-flex justify-content-center align-items-center border-end my-2">
												${r.writer}
											</div>
											<div class="col py-1 ps-3 d-flex align-items-center" style="min-height: 10vh;">
												${r.content}
											</div>
											<div class="col-2 text-end d-flex flex-column justify-content-center">
												<c:if test="${sessionScope.isLogin and sessionScope.member.id eq r.writer or sessionScope.member.id eq 'admin'}">
													<input type="button" class="btn btn-warning my-1 replyUpdateBtn" value="댓글수정" data-reply-no="${r.no}">
													<input type="button" class="btn btn-danger my-1 replyDeleteBtn" value="댓글삭제" data-reply-no="${r.no}">
												</c:if>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
									
								</div>
							</div>
							
							<!-- 댓글 수정 폼 -->
							<form name="replyUpdateForm" id="replyUpdateForm" class="row">
								<input type="hidden" name="replyNo" id="replyNo">
								<div class="col">
									<div class="row">
										<div class="col">
											<textarea name="updateReplyContent" id="updateReplyContent" class="form-control shadow-none border-secondary-subtle" rows="5" style="resize: none;"></textarea>
										</div>
										<div class="col-2 ps-0">
											<input type="submit" class="btn btn-warning w-100 h-100" value="수정하기" id="replyUpdateBtn">
										</div>
										<div class="col-2 ps-0">
											<input type="button" class="btn btn-danger w-100 h-100" value="취소하기" id="replyUpdateCancleBtn">
										</div>
									</div>
								</div>
							</form>							
							
							<div class="row">
								<div class="col me-5 my-3 text-center">
									<a href="#" class="btn btn-dark btn-lg">맨 위로</a>									
								</div>
							</div>
							
							<div class="row mt-5">
								<div class="col my-2">
									<h3>${category} 최신뉴스</h3>
								</div>
								<div class="col-auto me-5 my-2">
									<a href="newsList?cat=${news.category}&pageNum=${pageNum}" class="btn btn-sm btn-dark mx-2">${category} 기사목록</a>
								</div>
							</div>
							
							<div class="row">
								<div class="col me-5 my-2">
									
									<c:forEach var="n" items="${newsList}">
		        						<div class="row mb-3 latestNews newsRow" onclick="location.href='newsDetail?no=${n.no}&cat=${n.category}'" style="cursor : pointer;">
		        							<div class="col-3 me-3 latestNewsThumbnail" style="height : 15vh; background-position:center;
		        							background-image: url('${not empty n.thumbnail ? n.thumbnail : 'resources/images/defaultThumbnail.jpg'}');"></div>
		        							<div class="col" style="height : 15vh;">
		        								<div class="row">
		        									<div class="col article" style="height : 4vh; width:20vw;">
		        										<span class="fs-4 fw-bold">
		        											${n.title}
		        										</span>
		        									</div>
		        								</div>
		        								<div class="row">
		        									<div class="col articleContent" style="height : 8vh; width:20vw;">
		        										<span class="fs-6">
		        											${n.description}
		        										</span>
		        									</div>
		        								</div>
		        								<div class="row">
		        									<div class="col"  style="height : 3vh; width:20vw;">
		        										<span class="text-secondary">
		        											${n.regDate}
		        										</span>
		        									</div>
		        								</div>
		        							</div>
		        						</div>		        					
		        					</c:forEach>
									
								</div>
							</div>
							
		        		</div>
		        		
		        				        		<!-- 사이드바 시작, 전체기사일 경우에는 실행X  -->
		        		<c:if test="${cat ne 'all'}">
		        		<div class="col-4 border-start ps-5" id="sideList">

		        			<div class="row">
		        				<div class="col p-3 mb-3" style="border-bottom : 1px dotted #ddd;">
		        					
		        					<div class="row my-3">
		        						<div class="col">
		        							<span class="fw-bold fs-5">${category} 오픈톡</span>	
		        						</div>
		        					</div>
		        					
		        					<!-- 비로그인했을 때 채팅창 시작 -->
		        					<c:if test="${not sessionScope.isLogin}">
		        					<div class="row">
		        						<div class="col border p-3 rounded" style="background-color: #e5e5e5;">
		        						
		        								<div class="bg-white rounded d-flex flex-column justify-content-center align-items-center fw-bold" style="min-height : 40vh;">
		        									로그인이 필요한 컨텐츠입니다 <br>
		        									<a href="login" class="btn btn-dark my-3">로그인하러 가기</a>
		        								</div>
		        							
		        								<div class="mt-3 d-flex">
		        									<input type="text" class="form-control me-2 shadow-none border border-secondary-subtle" disabled>
		        									<input type="button" class="btn btn-dark" value="전송" disabled>
		        								</div>
		        							
		        						</div>
		        					</div>
		        					</c:if>
		        					<!-- 비로그인했을 때 채팅창 끝 -->
		        					
		        					<!-- 로그인했을 때 채팅창 시작 -->
		        					<c:if test="${sessionScope.isLogin}">
		        					<div class="row">
		        						<div class="col border p-3 rounded" style="background-color: #e5e5e5;">
		        								
		        								<div class="bg-white rounded" style="height : 40vh; overflow: auto;" id="${cat}Chat">
		        									<div class="text-dark p-3 text-center fw-bold">${category} 오픈톡에 참여하셨습니다</div>
		        								</div>
		        							
		        								<div class="mt-3 d-flex">
		        									<input type="text" class="form-control me-2 shadow-none border border-secondary-subtle" id="sendMessage">
		        									<input type="button" class="btn btn-dark" value="전송" id="sendBtn">
		        								</div>
		        							
		        						</div>
		        					</div>
		        					<script>
			
										let cat = '${cat}';
										let category = '${category}';
										let div = "#" + cat + "Chat";
										let loginId = '${sessionScope.member.id}';
		        						let url = "ws://192.168.35.92:8081/sportsplus/chat/" + cat;
		        						const chatConatiner = document.querySelector(div);
		        						
		        						const socket = new WebSocket(url);
		        						
		        						$(socket).on("open", function(event) {  
		        						});
		        						
		        						socket.addEventListener('message', function(event){
		        						    console.log('서버로부터 메시지 수신:', event.data); // 문자열로 출력
		        						    let chatMessage = $('<div>', {
		        						    	  'class': 'text-dark px-3 py-1'
		        						    }).append($('<span>', {'text': event.data}));
		        						    $(chatConatiner).append(chatMessage);
		        						    chatConatiner.scrollTo(0, chatConatiner.scrollHeight);
		        						    console.log("6");
		        						});
		        						
		        						$(socket).on('close', function(event) {
		        						    console.log('WebSocket 연결이 닫혔습니다.');
		        						});
		        						
		        						$(socket).on('error', function(event) {
		        						    console.error('WebSocket 오류:', event);
		        						});
		        						
		        						$("#sendMessage").on("keyup", function(event){
		        							
		        							if(event.key == 'Enter'){
			        							socket.send(loginId + ' : ' + $("#sendMessage").val());
			        							$("#sendMessage").val("");
			        							$("#sendMessage").focus();
		        							}
		        						});
		        						
		        						$("#sendBtn").on("click", function(){
		        							
		        							if($("#sendMessage").val().length == 0) {
		        								return;
		        							}
		        							
		        							socket.send(loginId + ' : ' + $("#sendMessage").val());
		        							$("#sendMessage").val("");
		        							$("#sendMessage").focus();
		        						});
		        						
		        					</script>
		        					</c:if>
		        					<!-- 로그인했을 때 채팅창 끝 -->
		        					
		        				</div>
		        			</div>
		        			
		        			<div class="row">
		        				<div class="col p-3" style="height : 25vh; border-bottom : 1px dotted #ddd;">
		        					<div class="row">
		        						<div class="col">
		        							<span class="fw-bold fs-5">스포츠 별 인기기사</span>
											<span class="align-top fs-5" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip" 
											data-bs-title="각 스포츠별로 최근 일주일동안의 기사들 중 가장 많이 조회된 기사들입니다">ⓘ</span>
		        						</div>
		        					</div>
		        					<div class="row">
		        						<div class="col my-3">
		        							<c:forEach var="m" items="${mainNews}">
		        									<div class="row newsRow" onclick="location.href='newsDetail?no=${m.no}&cat=${m.category}'" style="cursor:pointer;">
		        										<div class="col-2 text-end px-0 my-1" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; font-size:14px;">
					        								<a href="newsDetail?no=${m.no}&cat=${m.category}">
					        									<c:if test="${m.category eq 'baseball'}">
					        										<span class="text-secondary">국내야구</span>
					        									</c:if>
					        									<c:if test="${m.category eq 'worldBaseball'}">
					        										<span class="text-secondary">해외야구</span>
					        									</c:if>
					        									<c:if test="${m.category eq 'football'}">
					        										<span class="text-secondary">국내축구</span>
					        									</c:if>
					        									<c:if test="${m.category eq 'worldFootball'}">
					        										<span class="text-secondary">해외축구</span>
					        									</c:if>
					        									<c:if test="${m.category eq 'basketball'}">
					        										<span class="text-secondary">농구</span>
					        									</c:if>
					        								</a>
					        							</div>
		        										<div class="col my-1 fw-bold" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
					        								<a href="newsDetail?no=${m.no}&cat=${m.category}">
					        									<span class="text-dark">${m.title}</span>
					        								</a>
					        							</div>
					        							<div class="col-auto text-end px-0 my-1" style="font-size:12px;">
					        								<a href="newsDetail?no=${m.no}&cat=${m.category}">
					        									<span class="text-secondary">조회수(${m.readCount})</span>
					        								</a>
					        							</div>
		        									</div>
		        							</c:forEach>
		        						</div>
		        					</div>
		        				</div>
		        			</div>
		        			
		        		</div>
		        		</c:if>
		        		
		        		
		        	</div>
        		</div>
        	</div>
        	
        </div>
    </div>
</div>